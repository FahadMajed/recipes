abstract class UseCase<Request, Response> {
  Future<Response> call(Request request);
}
