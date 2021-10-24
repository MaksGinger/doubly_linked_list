class NoSuchElementException implements Exception {
  final String message;
  const NoSuchElementException([this.message = 'No such element']);

  @override
  String toString() {
    return message;
  }
}
