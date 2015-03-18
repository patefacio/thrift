part of thrift.transport;

enum TExceptionType {
  tetUnknown,
  tetNotOpen,
  tetAlreadyOpen,
  tetTimedOut,
  tetEndOfFile
}

class TTransportException implements Exception {
  const TTransportException(this.message);

  final String message;
  // custom <class TTransportException>
  // end <class TTransportException>
}

abstract class TTransport {
  bool get isOpen => _isOpen;
  // custom <class TTransport>

  Future open();
  Future close();

  Future<int> readByte() =>
      readAll(_byteData).then((_) => _byteData.getInt8(0));
  Future<int> readAll(ByteData target, [int offsetInBytes = 0, int length]);
  Future<int> tryRead(ByteData target, [int offsetInBytes = 0, int length]);
  Future write(ByteData source, [int offsetInBytes = 0, int length]);
  Future flush();

  Stream get stream;
  Sink get sink;

  // end <class TTransport>
  bool _isOpen = false;
  ByteData _byteData = new Uint8List(1).buffer.asByteData();
}

class TMemoryTransport implements TTransport {
  List<int> get outData => _outData;
  Utf8Codec codec = const Utf8Codec();
  // custom <class TMemoryTransport>

  open() => new Future(() => null);
  close() => new Future(() => null);

  Future write(ByteData byteData, [int offsetInBytes = 0, int length]) {
    if (length == null) length = byteData.length - offsetInBytes;
    final end = offsetInBytes + length;
    for (int i = offsetInBytes; i < end; ++i) {
      outData.add(byteData.getInt8(i));
    }
  }

  // end <class TMemoryTransport>
  List<int> _outData = [];
}

class TLoopbackTransport extends TTransport {
  Queue<int> get outData => _outData;
  // custom <class TLoopbackTransport>

  open() {
    _isOpen = true;
    return new Future(() => null);
  }

  close() {
    _isOpen = false;
    return new Future(() => null);
  }

  Future<int> tryRead(ByteData target, [int offsetInBytes = 0, int length]) {
    assert(_isOpen);
    if (length == null) length = target.length - offsetInBytes;
    assert(target.length >= offsetInBytes + length);
    final end = offsetInBytes + length;
    int i = offsetInBytes;
    for (; i < end && _outData.isNotEmpty; ++i) {
      target.setInt8(i, _outData.removeFirst());
    }
    return new Future.value(i - offsetInBytes);
  }

  Future<int> readAll(ByteData target, [int offsetInBytes = 0, int length]) {
    assert(_isOpen);
    if (length == null) length = target.length - offsetInBytes;
    assert(target.length >= offsetInBytes + length);
    final end = offsetInBytes + length;
    int bytesToRead = end - offsetInBytes;

    return Future.doWhile(() {
      if (_outData.length < bytesToRead) {
        return new Future.delayed(new Duration(microseconds: 100),
            () => _outData.length < bytesToRead);
      }
      return false;
    }).then((var _) async {
      final bytesRead = await tryRead(target, offsetInBytes, bytesToRead);
      assert(bytesRead == bytesToRead);
      return bytesRead;
    });
  }

  Future write(ByteData source, [int offsetInBytes = 0, int length]) {
    assert(_isOpen);
    if (length == null) length = source.length - offsetInBytes;
    assert(source.length >= offsetInBytes + length);
    final end = offsetInBytes + length;
    for (int i = offsetInBytes; i < end; ++i) {
      _outData.add(source.getInt8(i));
    }
  }

  // end <class TLoopbackTransport>
  Queue<int> _outData = new Queue<int>();
}

abstract class TTransportTransformer implements TTransport {
  const TTransportTransformer(this.original);

  final TTransport original;
  // custom <class TTransportTransformer>

  // end <class TTransportTransformer>
}

class TTransportFactory {
  // custom <class TTransportFactory>

  TTransport wrapTransport(TTransport transport) => transport;

  // end <class TTransportFactory>
}

/// Common arguments for server transports
class TServerTransportArgs {
  const TServerTransportArgs(this.backlog, this.clientTimeout);

  /// Value of 0 idicates the default will be used
  final int backlog;
  final int clientTimeout;
  // custom <class TServerTransportArgs>
  // end <class TServerTransportArgs>
}

/// Object which provides client transports, that is a Stream of Streams
abstract class TServerTransport {
  const TServerTransport(this.args);

  final TServerTransportArgs args;
  // custom <class TServerTransport>

  Stream<TTransport> get transports;

  TTransport accept() {
    final TTransport result = _accept();
    if (result == null) {
      throw new TTransportException('_accept() may not return null');
    }
    return result;
  }

  /// *optional* interrupt method
  void interrupt() {}

  // end <class TServerTransport>
}
// custom <part transport>
// end <part transport>
