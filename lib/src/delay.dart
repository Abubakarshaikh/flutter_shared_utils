/// a small helper function to return a Future with a configurable delay
Future<void> delay(bool addDelay, [int milliseconds = 2000]) {
  if (addDelay) {
    return Future<void>.delayed(Duration(milliseconds: milliseconds));
  } else {
    return Future<void>.value();
  }
}