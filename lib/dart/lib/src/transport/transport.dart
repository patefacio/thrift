part of thrift.transport;

enum TExceptionType {
tetUnknown,
tetNotOpen,
tetAlreadyOpen,
tetTimedOut,
tetEndOfFile
}

class TTransportException
  implements Exception {
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

abstract class TTransportFactory {
  // custom <class TTransportFactory>

  TTransport wrapTransport(TTransport);

  // end <class TTransportFactory>
}

abstract class TServerTransport {
  // custom <class TServerTransport>

  TTransport accept();
  void close();
  void listen();

  // end <class TServerTransport>
}
// custom <part transport>
// end <part transport>
