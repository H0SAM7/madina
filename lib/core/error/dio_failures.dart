import 'package:dio/dio.dart';

abstract class Failure {
  final String? errMessage;

  const Failure({this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timed out.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Request send timed out.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Response receive timed out.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: 'Request to API server was cancelled.');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(errMessage: 'An unknown error occurred.');
      default:
        return ServerFailure(errMessage: 'An unexpected error occurred.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    // Handle specific status codes
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          errMessage: _extractErrorMessage(response) ??
              'Invalid request or authentication failed.');
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request was not found. Please try later!');
    } else if (statusCode == 422) {
      // Paymob-specific: Handling validation errors
      final errors = response['errors'] as Map<String, dynamic>?;
      if (errors != null && errors.isNotEmpty) {
        return ServerFailure(errMessage: errors.values.first.join(', '));
      }
      return ServerFailure(
          errMessage: _extractErrorMessage(response) ?? 'Validation error occurred.');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal server error. Please try later.');
    } else {
      return ServerFailure(
          errMessage: _extractErrorMessage(response) ??
              'Oops! There was an error. Please try again.');
    }
  }

  // Helper method to extract error message from various response structures
  static String? _extractErrorMessage(dynamic response) {
    if (response == null) return null;

    // Handle if response is a Map
    if (response is Map<String, dynamic>) {
      // Common keys for error messages
      const commonKeys = ['message', 'msg', 'error', 'errors', 'detail', 'info'];
      for (var key in commonKeys) {
        if (response.containsKey(key)) {
          final value = response[key];
          if (value is String && value.isNotEmpty) {
            return value;
          } else if (value is Map) {
            // Recursively search in nested map
            return _extractErrorMessage(value);
          } else if (value is List && value.isNotEmpty) {
            // Handle lists (e.g., errors: ["msg1", "msg2"])
            return value.join(', ');
          } else if (value != null) {
            return value.toString();
          }
        }
      }

      // Recursively search through all values in the map
      for (var value in response.values) {
        final result = _extractErrorMessage(value);
        if (result != null) return result;
      }
    }

    // Handle if response is a List
    if (response is List && response.isNotEmpty) {
      return _extractErrorMessage(response.first);
    }

    // Handle if response is a String
    if (response is String && response.isNotEmpty) {
      return response;
    }

    return null;
  }
}