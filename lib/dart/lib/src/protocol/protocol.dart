part of thrift.protocol;

enum TType {
  ttStop,
  ttTrue,
  ttFalse,
  ttByte,
  ttI16,
  ttI32,
  ttI64,
  ttDouble,
  ttBinary,
  ttList,
  ttSet,
  ttMap,
  ttStruct
}

enum TMessageType {
  tmtInvalidMessage,
  tmtCall,
  tmtReply,
  tmtException,
  tmtOneway
}

class TList {
  const TList(this.type, this.size);

  final TType type;
  final int size;
  // custom <class TList>
  // end <class TList>
}

class TMap {
  const TMap(this.keyType, this.valueType, this.size);

  final TType keyType;
  final TType valueType;
  final int size;
  // custom <class TMap>
  // end <class TMap>
}

class TMessage {
  const TMessage(this.name, this.type, this.seqid);

  final String name;
  final TMessageType type;
  final int seqid;
  // custom <class TMessage>
  // end <class TMessage>
}

class TStruct {
  const TStruct(this.name);

  final String name;
  // custom <class TStruct>
  // end <class TStruct>
}

class TSet {
  const TSet(this.type, this.size);

  final TType type;
  final int size;
  // custom <class TSet>
  // end <class TSet>
}

class TField {
  const TField(this.id, this.name, this.type);

  final int id;
  final String name;
  final int type;
  // custom <class TField>
  // end <class TField>
}

abstract class TProtocol {
  // custom <class TProtocol>

  TTransport get transport;

  Future<bool> readBool();
  Future<int> readByte();
  Future<double> readDouble();
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

  // end <class TProtocol>
}

abstract class TProtocolFactory {
  // custom <class TProtocolFactory>

  TProtocol createProtocol(TTransport);

  // end <class TProtocolFactory>
}
// custom <part protocol>
// end <part protocol>
