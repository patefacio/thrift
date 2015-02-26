import 'package:unittest/unittest.dart';
import 'package:logging/logging.dart';
import 'test_protocol.dart' as test_protocol;
import 'test_transport.dart' as test_transport;

void testCore(Configuration config) {
  unittestConfiguration = config;
  main();
}

main() {
  Logger.root.level = Level.OFF;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  test_protocol.main();
  test_transport.main();
}

