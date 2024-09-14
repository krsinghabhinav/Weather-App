class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message $_prefix';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, "No Internet ");
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, "Request time out");
}

class ServerExceptionError extends AppException {
  ServerExceptionError([String? message])
      : super(message, 'Internal Server Error');
}

class InvalidException extends AppException {
  InvalidException([String? message])
      : super(message, 'Invalid Url status code 400');
}

class FetchDataExcetion extends AppException {
  FetchDataExcetion([String? message]) : super(message, '');
}

class ExceptionError extends AppException {
  ExceptionError([String? message]) : super(message, '');
}
