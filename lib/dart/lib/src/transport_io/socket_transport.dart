part of thrift.transport_io;

class TSocket extends TTransport {
  // custom <class TSocket>

  TSocket(this._socket);

  get port => _socket.port;
  get host => _socket.address.host;

  @override
  Sink get sink => _socket;
  @override
  Stream get stream => _socket;

  toString() => 'TSocket(host:$host, port: $port)';

  // end <class TSocket>
  Socket _socket;
}

/// Object which provides client transports using sockets
class TServerSocket extends TServerTransport {
  /// Standard server socket providing client sockets to be wrapped as
  /// transports.
  ServerSocket get serverSocket => _serverSocket;
  // custom <class TServerSocket>

  static Future<TServerSocket> bind(address, int port,
      {int backlog: 0, int clientTimeout: 0}) => ServerSocket
      .bind(address, port, backlog: backlog)
      .then((ServerSocket serverSocket) => new TServerSocket._(
          new TServerTransportArgs(backlog, clientTimeout), serverSocket));

  TServerSocket._(args, this._serverSocket) : super(args);

  close() {
    _logger.info('Closing socket $_serverSocket');
    return _serverSocket.close();
  }

  Stream<TTransport> get transports {
    _logger.info('Listening on server socket $_serverSocket');
    return _serverSocket.map((Socket socket) {
      final result = new TSocket(socket);
      _logger.info('Got client socket ${result}');
      return result;
    });
  }

  void interrupt() => throw 'TODO';

  TTransport _accept() => throw 'TODO';

  // end <class TServerSocket>
  ServerSocket _serverSocket;
}
// custom <part socket_transport>
// end <part socket_transport>
