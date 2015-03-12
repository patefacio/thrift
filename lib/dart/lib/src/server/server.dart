part of thrift.server;

abstract class TProcessor {
  // custom <class TProcessor>
  // end <class TProcessor>
}

abstract class TProcessorFactory {
  // custom <class TProcessorFactory>
  // end <class TProcessorFactory>
}

class TServerFactories {
  final TProcessorFactory processorFactory;
  final TTransportFactory inputTransportFactory;
  final TProtocolFactory inputProtocolFactory;
  final TTransportFactory outputTransportFactory;
  final TProtocolFactory outputProtocolFactory;
  // custom <class TServerFactories>
  // end <class TServerFactories>
}

class TConnectionContext {
  const TConnectionContext(this.inputProtocol, this.outputProtocol);

  final TProtocol inputProtocol;
  final TProtocol outputProtocol;
  // custom <class TConnectionContext>
  // end <class TConnectionContext>
}

class TClientContext {
  TConnectionContext connectionContext;
  // custom <class TClientContext>
  // end <class TClientContext>
}

abstract class TServerEventHandler {
  // custom <class TServerEventHandler>

  void preServe();

  TServerContext createContext(TProtocol input, TProtocol output);
  void deleteContext(
      TServerContext serverContext, TProtocol input, TProtocol output);
  void processContext(
      TServerContext serverContext, TTransport input, TTransport output);

  // end <class TServerEventHandler>
}

abstract class TServer {
  TServerTransport get serverTransport => _serverTransport;
  TServerFactories get factories => _factories;
  bool get isServing => _isServing;
  // custom <class TServer>

  TServer(this._args);

  TProcessor get processor => args.processor;

  void serve();
  void stop();

  // end <class TServer>
  TServerTransport _serverTransport;
  TServerFactories _factories;
  bool _isServing = false;
}
// custom <part server>
// end <part server>
