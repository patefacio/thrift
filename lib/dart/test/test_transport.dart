library thrift.test.test_transport;

import 'package:args/args.dart';
import 'package:logging/logging.dart';
import 'package:unittest/unittest.dart';
// custom <additional imports>

import 'dart:async';
import 'dart:typed_data';
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
  group('memory transport', () {
    group('basics', () {
      final pi = 3.14159;
      final buffSize = 1024;
      final loopback = () async => (new TLoopbackTransport()..open());
      final writeData =
          () => new Uint8List(buffSize).buffer.asByteData()..setFloat64(0, pi);
      final readData = () => new Uint8List(buffSize).buffer.asByteData();

      test('write 16 bytes read back', () async {
        final lb = await loopback();
        final rd = readData();
        await lb.write(writeData(), 0, 16);
        /// pi written in 16 bytes 0 padded
        expect(lb.outData,
            [64, 9, 33, -7, -16, 27, -122, 110, 0, 0, 0, 0, 0, 0, 0, 0]);
        final bytesRead = await lb.tryRead(rd, 0, 16);
        expect(bytesRead, 16);
        expect(rd.getFloat64(0), pi);
      });

      test('readAll will wait for data', () async {
        final lb = await loopback();
        final rd = readData();
        final wd = writeData();
        final read = lb.readAll(rd, 0, 16);
        new Future.delayed(new Duration(milliseconds: 10))
            .then((_) => lb.write(wd, 0, 16));
        await read;

        expect(rd.getFloat64(0), pi);
        return read;
      });

      test('readByte', () async {
        final lb = await loopback();
        final wd = writeData();
        new Future.delayed(new Duration(milliseconds: 1))
            .then((_) => lb.write(wd, 0, 3));
        final b1 = await lb.readByte();
        final b2 = await lb.readByte();
        final b3 = await lb.readByte();
        expect(wd.getInt8(0), b1);
        expect(wd.getInt8(1), b2);
        expect(wd.getInt8(2), b3);
      });
    });
  });

// end <main>

}
