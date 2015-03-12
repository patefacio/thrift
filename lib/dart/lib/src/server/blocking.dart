part of thrift.server;

class TSimpleServer extends TServer {
  TServerTransport get serverTransport => _serverTransport;
  bool get isStopped => _isStopped;
  // custom <class TSimpleServer>

  TSimpleServer(TServerArgs args) : super(args);

  void serve() {
    _serverTransport.listen();

    while (!isStopped) {
      final client = _serverTransport.accept();
      if (client != null) {}
    }

    throw 'TBD';
  }

  void stop() {
    _isStopped = true;
    _serverTransport.interrupt();
    throw 'TBD';
  }

  // end <class TSimpleServer>
  TServerTransport _serverTransport;
  bool _isStopped = false;
}
// custom <part blocking>
// end <part blocking>
