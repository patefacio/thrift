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

abstract class TProtocolBase {
  TProtocolBase(this.trans);

  TTransport trans;
  // custom <class TProtocolBase>

  bool readBool();
  int readByte();
  double readDouble();
  TField readFieldBegin();
  void readFieldEnd();
  int readI16();
  int readI32();
  int readI64();
  TList readListBegin();
  void readListEnd();
  TMap readMapBegin();
  void readMapEnd();
  TMessage readMessageBegin();
  void readMessageEnd();
  TSet readSetBegin();
  void readSetEnd();
  String readString();
  TStruct readStructBegin();
  void readStructEnd();
  void reset();

  void writeBinary(ByteBuffer);
  void writeBool(bool);
  void writeByte(int);
  void writeDouble(double);
  void writeFieldBegin(TField);
  void writeFieldEnd();
  void writeI16(int);
  void writeI32(int);
  void writeI64(int);
  void writeListBegin(TList);
  void writeListEnd();
  void writeMapBegin(TMap);
  void writeMapEnd();
  void writeMessageBegin(TMessage);
  void writeMessageEnd();
  void writeSetBegin(TSet);
  void writeSetEnd();
  void writeString();
  void writeStructBegin(TStruct);
  void writeStructEnd();


  // end <class TProtocolBase>
}
// custom <part protocol>
// end <part protocol>
