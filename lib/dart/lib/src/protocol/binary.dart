part of thrift.protocol;

class TBinaryProtocol implements TProtocol {
  // custom <class TBinaryProtocol>

  TBinaryProtocol(this._transport)
      : _typedData = new Uint8List(8),
        _byteData = new ByteData.view(_typedData);

  Future<bool> readBool() => readByte().then((b) => b != 0);

  Future<int> readByte() =>
      trans.readByte().then((i) => i > 0x7f ? (0 - ((i - 1) ^ 0xff)) : i);

  Future<double> readDouble() => trans
      .readAll(_typedData.buffer, 0, 8)
      .then((_) => _typedData.buffer.asFloat64List()[0]);

  Future<TField> readFieldBegin();
  Future readFieldEnd();
  Future<int> readI16();
  Future<int> readI32();
  Future<int> readI64();
  Future<TList> readListBegin();
  Future readListEnd();
  Future<TMap> readMapBegin();
  Future readMapEnd();
  Future<TMessage> readMessageBegin();
  Future readMessageEnd();
  Future<TSet> readSetBegin();
  Future readSetEnd();
  Future<String> readString();
  Future<TStruct> readStructBegin();
  Future readStructEnd();
  Future reset();

  Future writeBinary(ByteBuffer);
  Future writeBool(bool);
  Future writeByte(int);
  Future writeDouble(double);
  Future writeFieldBegin(TField);
  Future writeFieldEnd();
  Future writeI16(int);
  Future writeI32(int);
  Future writeI64(int);
  Future writeListBegin(TList);
  Future writeListEnd();
  Future writeMapBegin(TMap);
  Future writeMapEnd();
  Future writeMessageBegin(TMessage);
  Future writeMessageEnd();
  Future writeSetBegin(TSet);
  Future writeSetEnd();
  Future writeString();
  Future writeStructBegin(TStruct);
  Future writeStructEnd();

  // end <class TBinaryProtocol>
  TTransport _transport;
  TypedData _typedData;
  ByteData _byteData;
}

class TBinaryProtocolFactory implements TProtocolFactory {
  // custom <class TBinaryProtocolFactory>

  TProtocol createProtocol(TTransport) => throw 'TODO';

  // end <class TBinaryProtocolFactory>
}
// custom <part binary>
// end <part binary>
