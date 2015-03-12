library thrift.server;

import 'package:logging/logging.dart';
import 'package:thrift/protocol.dart';
import 'package:thrift/transport.dart';
// custom <additional imports>
// end <additional imports>

part 'src/server/server.dart';
part 'src/server/blocking.dart';
part 'src/server/non_blocking.dart';
part 'src/server/http.dart';

final _logger = new Logger('server');

// custom <library server>
// end <library server>
