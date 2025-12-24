abstract class DataBaseResult<T> {
  const DataBaseResult();
  factory DataBaseResult.success(T data) = Success<T>;
  factory DataBaseResult.failure(String message) = Failure<T>;
}

class Success<T> extends DataBaseResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends DataBaseResult<T> {
  final String message;
  const Failure(this.message);
}
