part of thrift.server;

abstract class TProcessor {
  // custom <class TProcessor>
  // end <class TProcessor>
}

abstract class TServer {
  // custom <class TServer>

  TProcessor get processor;
  TServerTransport get serverTransport;

  void serve();
  void stop();
  bool get isServing;

  // end <class TServer>
}
// custom <part server>
// end <part server>
