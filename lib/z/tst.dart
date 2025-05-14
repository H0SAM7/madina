import 'dart:developer';

class RequestCounter {
  RequestCounter._privateConstructor();

  static final RequestCounter _instance = RequestCounter._privateConstructor();

  static RequestCounter get instance => _instance;

  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    log('🔁 Total API Requests: $_count');
  }

  void reset() {
    _count = 0;
    log('🧹 Request counter reset.');
  }
}
