library thrift.test.test_protocol;

import 'package:args/args.dart';
import 'package:logging/logging.dart';
import 'package:unittest/unittest.dart';
// custom <additional imports>

import 'package:thrift/protocol.dart';

// end <additional imports>

final _logger = new Logger('test_protocol');

// custom <library test_protocol>
// end <library test_protocol>
main([List<String> args]) {
  Logger.root.onRecord.listen(
      (LogRecord r) => print("${r.loggerName} [${r.level}]:\t${r.message}"));
  Logger.root.level = Level.OFF;
// custom <main>
// end <main>

}
