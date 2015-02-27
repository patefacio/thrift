part of thrift.server;

abstract class TProcessor {
  // custom <class TProcessor>
  // end <class TProcessor>
}

class TServerArgs {
  final TProcessor processor;
  final TServerTransport serverTransport;
  final TTransportFactory inputTransportFactory;
  final TProtocolFactory inputProtocolFactory;
  final TTransportFactory outputTransportFactory;
  final TProtocolFactory outputProtocolFactory;
  // custom <class TServerArgs>

  TServerArgs(this.processor, this.serverTransport,
      [TTransportFactory inputTransportFactory,
      TProtocolFactory inputProtocolFactory,
      TTransportFactory outputTransportFactory,
      TProtocolFactory outputProtocolFactory])
      : this.inputTransportFactory = inputTransportFactory == null
          ? new TTransportFactory()
          : inputTransportFactory,
        this.outputTransportFactory = outputTransportFactory == null
            ? new TTransportFactory()
            : outputTransportFactory,
        this.inputProtocolFactory = inputProtocolFactory == null
            ? new TBinaryProtocolFactory()
            : inputProtocolFactory,
        this.outputProtocolFactory = outputProtocolFactory == null
            ? new TBinaryProtocolFactory()
            : outputProtocolFactory;

  // end <class TServerArgs>
}

abstract class TServerContext {
  // custom <class TServerContext>
  // end <class TServerContext>
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
  TServerArgs get args => _args;
  bool get isServing => _isServing;
  // custom <class TServer>

  TServer(this._args);

  TProcessor get processor => args.processor;

  void serve();
  void stop();

  // end <class TServer>
  TServerArgs _args;
  bool _isServing = false;
}
// custom <part server>
// end <part server>
