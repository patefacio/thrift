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
  // custom <class TTransport>

  bool get isOpen;
  void open();
  void close();
  void read(ByteData);
  void write(ByteData);
  void flush();

  // end <class TTransport>
}

class TTransportFactory {
  // custom <class TTransportFactory>

  TTransport wrapTransport(TTransport transport) => transport;

  // end <class TTransportFactory>
}

abstract class TServerTransport {
  // custom <class TServerTransport>

  TTransport accept() {
    final TTransport result = _accept();
    if (result == null) {
      throw new TTransportException('_accept() may not return null');
    }
    return result;
  }

  TTransport _accept();

  void close();
  void listen();

  /// *optional* interrupt method
  void interrupt() {}

  // end <class TServerTransport>
}
// custom <part transport>
// end <part transport>
