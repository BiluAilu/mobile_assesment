class ServerException implements Exception {}

class CacheException implements Exception {}



class NetworkConnectionException implements Exception {}

class UnauthorizedRequestException implements Exception {}

class BadRequestException implements Exception{
  BadRequestException();

 
}


class AuthenticationException implements Exception {
  AuthenticationException({
    required this.errorMessage,
  });

  final String errorMessage;
}
