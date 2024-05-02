import 'exception.dart';
import 'failure.dart';

Failure mapExceptionToFailure(dynamic e) {
  if (e is ServerException) {
    return ServerFailure();
  } else if (e is UnauthorizedRequestException) {
    return UnauthorizedRequestFailure();
  } else if (e is CacheException) {
    return CacheFailure();
  } else if (e is BadRequestException) {
    return BadRequestFailure();
  }  else if (e is NetworkConnectionException) {
    return NetworkFailure();
  } else {
    print('Caught error: $e');
    return AnonymousFailure();
  }
}