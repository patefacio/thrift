library thrift.protocol;

import 'dart:typed_data';
import 'package:logging/logging.dart';
import 'package:thrift/transport.dart';
// custom <additional imports>
// end <additional imports>

part 'src/protocol/protocol.dart';
part 'src/protocol/binary.dart';
part 'src/protocol/compact.dart';
part 'src/protocol/json.dart';

final _logger = new Logger('protocol');

// custom <library protocol>
// end <library protocol>
