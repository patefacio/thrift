part of thrift.server;

class TSimpleServer
  implements TServer {
  TSimpleServer(this._processor, this._serverTransport, [ this._transportFactory,
    this._protocolFactory ]);

  TProcessor get processor => _processor;
  TServerTransport get serverTransport => _serverTransport;
  TTransportFactory get transportFactory => _transportFactory;
  TProtocolFactory get protocolFactory => _protocolFactory;
  bool get isServing => _isServing;
  // custom <class TSimpleServer>

  void serve() {


    throw 'TBD';
  }

  void stop() {

    throw 'TBD';
  }

  // end <class TSimpleServer>
  TProcessor _processor;
  TServerTransport _serverTransport;
  TTransportFactory _transportFactory;
  TProtocolFactory _protocolFactory;
  bool _isServing = false;
}
// custom <part blocking>
// end <part blocking>
