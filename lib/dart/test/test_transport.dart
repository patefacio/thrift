library thrift.test.test_transport;

import 'package:args/args.dart';
import 'package:logging/logging.dart';
import 'package:unittest/unittest.dart';
// custom <additional imports>

import 'package:thrift/transport.dart';

// end <additional imports>

final _logger = new Logger('test_transport');

// custom <library test_transport>
// end <library test_transport>
main([List<String> args]) {
  Logger.root.onRecord.listen(
      (LogRecord r) => print("${r.loggerName} [${r.level}]:\t${r.message}"));
  Logger.root.level = Level.OFF;
// custom <main>
  Logger.root.level = Level.INFO;
  group('server socket transport', () {
    test('create and open', () async {
      final server = await TServerSocket.bind('127.0.0.1', 4041);
      _logger.info('Server is $server');
      server.listen((TSocket tsocket) async {
        _logger.info('Got Tsocket $tsocket');
      });
      //await server.close();

      _logger.info('Server is done');
    });
  });

// end <main>

}
