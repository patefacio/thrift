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

  open();
  close();

  Stream get stream;
  Sink get sink;

  // end <class TTransport>
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
