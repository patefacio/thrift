part of thrift.transport;

class TSocket extends TTransport {
  String host;
  int port;
  bool get isOpen => _isOpen;
  // custom <class TSocket>

  TSocket(String host, int port) : this.withTimeout(host, port, 0);

  TSocket.withTimeout(this.host, this.port, int timeout);

  void open() {
    assert(!isOpen);
    assert(_socket == null);

    throw 'TODO';
  }

  void close() => throw 'TODO';
  void read(ByteData) => throw 'TODO';
  void write(ByteData) => throw 'TODO';
  void flush() => throw 'TODO';

  // end <class TSocket>
  bool _isOpen = false;
  Socket _socket;
}

class TServerSocket extends TServerTransport {
  // custom <class TServerSocket>

  void close() => throw 'TODO';

  void listen() => throw 'TODO';

  void interrupt() => throw 'TODO';

  TTransport _accept() => throw 'TODO';

  // end <class TServerSocket>
  ServerSocket _serverSocket;
}
// custom <part socket_transport>
// end <part socket_transport>
