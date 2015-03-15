library thrift.transport_io;

import 'dart:async';
import 'dart:io';
import 'package:logging/logging.dart';
import 'package:thrift/transport.dart';
// custom <additional imports>

export 'package:thrift/transport.dart';

// end <additional imports>

part 'src/transport_io/socket_transport.dart';
part 'src/transport_io/ssl_socket_transport.dart';

final _logger = new Logger('transport_io');

// custom <library transport_io>
// end <library transport_io>
