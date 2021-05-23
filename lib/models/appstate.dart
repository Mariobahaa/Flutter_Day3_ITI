class AppState<T> {
  T data;
  String error;
  bool hasData, hasError, waiting;
  AppState({
    this.data,
    this.error,
    this.hasData = false,
    this.hasError = false,
    this.waiting = false,
  });
}
