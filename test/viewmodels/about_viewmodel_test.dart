import 'package:flutter_test/flutter_test.dart';
import 'package:plasticdive/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AboutViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
