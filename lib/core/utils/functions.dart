import '../error/failure.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return "Server Failure";
    case CacheFailure:
      return "Cache Failure";
    case NetworkFailure:
      return "No Internet Connection";
    default:
      return "Unexpected Error";
  }
}
