abstract class Router {
  void onSuccess({Map? params});
  void onFail({Map? params});

  void call(bool clause) {
    if (clause) {
      onSuccess();
    } else {
      onFail();
    }
  }
}
