part of thrift.transport;

class TSocket extends TTransport {
  // custom <class TSocket>

  TSocket(this._socket);

  get port => _socket.port;
  get host => _socket.address.host;

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

  listen(accept(TTransport)) {
    _logger.info('Listening on server socket $_serverSocket');
    _serverSocket.listen((Socket socket) {
      _logger.info('Got client socket ${socket.address}');
      accept(new TSocket(socket));
    });
  }

  void interrupt() => throw 'TODO';

  TTransport _accept() => throw 'TODO';

  // end <class TServerSocket>
  ServerSocket _serverSocket;
}
// custom <part socket_transport>
// end <part socket_transport>
