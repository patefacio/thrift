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

abstract class TTransport implements IOSink, Stream {
  // custom <class TTransport>

  // end <class TTransport>
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

/// Object which provides client transports
abstract class TServerTransport {
  const TServerTransport(this.args);

  final TServerTransportArgs args;
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
