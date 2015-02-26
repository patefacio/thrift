part of thrift.transport;

enum TExceptionType {
tetUnknown,
tetNotOpen,
tetAlreadyOpen,
tetTimedOut,
tetEndOfFile
}

class TTransportException extends Exception {
  // custom <class TTransportException>
  // end <class TTransportException>
}

abstract class TTransport {
  // custom <class TTransport>

  bool get isOpen;
  void open();
  void close();
  void read(ByteData);
  void write(ByteData);
  void flush();

  // end <class TTransport>
}
// custom <part transport>
// end <part transport>
