import 'package:unittest/unittest.dart';
import 'package:logging/logging.dart';
import 'test_protocol.dart' as test_protocol;
import 'test_transport_io.dart' as test_transport_io;
import 'test_transport_html.dart' as test_transport_html;

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
  test_transport_io.main();
  test_transport_html.main();
}
