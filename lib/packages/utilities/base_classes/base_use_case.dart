abstract class UseCase<Request, Response> {
  UseCase();

  Future<Response> call(Request request);
}

abstract class NoRequestUseCase<Response> {
  Future<Response> call();
}
