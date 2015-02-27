part of thrift.transport;

class TSocket extends TTransport {
  TSocket(this.host, this.port);

  String host;
  int port;
  bool get isOpen => _isOpen;
  // custom <class TSocket>

  TSocket(this.host, this.port) : this.withTimeout(this.host, this.port, 0);

  TSocket(this.host, this.port, int timeout);

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

class TServerSocket
  implements TServerTransport {
  // custom <class TServerSocket>

  TTransport accept() {

  }

  void close() {
  }

  void listen() {
  }

  // end <class TServerSocket>
  ServerSocket _serverSocket;
}
// custom <part socket_transport>
// end <part socket_transport>
