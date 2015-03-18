library thrift.test.test_transport_io;

import 'package:args/args.dart';
import 'package:logging/logging.dart';
import 'package:unittest/unittest.dart';
// custom <additional imports>
import 'package:thrift/transport_io.dart';
// end <additional imports>

final _logger = new Logger('test_transport_io');

// custom <library test_transport_io>
// end <library test_transport_io>
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

      final tps = server.transports;
      print('TPS is $tps');
      tps.listen((TTransport transport) {
        _logger.info('Got transport $transport');
        //transport.sink.write('This is a test');
        for (int i = 0; i < 50000; i++) transport.sink.add([i]);
        _logger.info('Wrote a message');
        transport.sink.flush();
        _logger.info('Did flush');
        transport.sink.close();
        _logger.info('Did close');
      }, onError: (e) => print('OOPS got error $e'));

      // server.listen((TSocket tsocket) async {
      //   _logger.info('Got Tsocket $tsocket');
      // });
      //await server.close();

      _logger.info('Server is done');
    });
  });

// end <main>

}
