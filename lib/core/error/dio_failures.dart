import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String? errMessage;

  const Failure({this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    if (dioException.error is SocketException) {
      return ServerFailure(errMessage: 'لا يوجد اتصال بالإنترنت.');
    }
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'انتهت مهلة الاتصال.');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'انتهت مهلة إرسال الطلب.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'انتهت مهلة استلام الاستجابة.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'تم إلغاء الطلب إلى خادم API.');
      case DioExceptionType.unknown:
        if (dioException.message != null &&
            (dioException.message!.contains('SocketException') ||
                dioException.message!.contains('Network is unreachable'))) {
          return ServerFailure(errMessage: 'لا يوجد اتصال بالإنترنت.');
        }

        return ServerFailure(errMessage: 'حدث خطأ غير معروف.');
      default:
        return ServerFailure(errMessage: 'حدث خطأ غير متوقع.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    // Handle specific status codes
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        errMessage:
            _extractErrorMessage(response) ??
            'طلب غير صالح أو فشل في المصادقة.',
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        errMessage: 'لم يتم العثور على الطلب. الرجاء المحاولة لاحقاً!',
      );
    } else if (statusCode == 422) {
      // Paymob-specific: Handling validation errors
      final errors = response['errors'] as Map<String, dynamic>?;
      if (errors != null && errors.isNotEmpty) {
        return ServerFailure(errMessage: errors.values.first.join(', '));
      }
      return ServerFailure(
        errMessage: _extractErrorMessage(response) ?? "فشلت عملية التحقق",
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: 'خطأ في الخادم الداخلي. الرجاء المحاولة لاحقاً.',
      );
    } else {
      return ServerFailure(
        errMessage:
            _extractErrorMessage(response) ??
            'عذراً! حدث خطأ. الرجاء المحاولة مرة أخرى.',
      );
    }
  }

  static String? _extractErrorMessage(dynamic response) {
    if (response == null) return null;

    if (response is Map<String, dynamic>) {
      const commonKeys = [
        'message',
        'msg',
        'error',
        'errors',
        'detail',
        'info',
      ];
      for (var key in commonKeys) {
        if (response.containsKey(key)) {
          final value = response[key];
          if (value is String && value.isNotEmpty) {
            return value;
          } else if (value is Map) {
            return _extractErrorMessage(value);
          } else if (value is List && value.isNotEmpty) {
            return value.join(', ');
          } else if (value != null) {
            return value.toString();
          }
        }
      }

      for (var value in response.values) {
        final result = _extractErrorMessage(value);
        if (result != null) return result;
      }
    }

    if (response is List && response.isNotEmpty) {
      return _extractErrorMessage(response.first);
    }

    if (response is String && response.isNotEmpty) {
      return response;
    }

    return null;
  }
}
