abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}
class GetCacheFailure extends Failure {
  GetCacheFailure(String message) : super(message);
}
