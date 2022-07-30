class Failure {
  final String message;

  Failure(this.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(String message) : super(message);
}
