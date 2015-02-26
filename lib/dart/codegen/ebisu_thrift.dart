import "dart:io";
import "package:path/path.dart" as path;
import "package:id/id.dart";
import "package:ebisu/ebisu.dart";
import "package:ebisu/ebisu_dart_meta.dart";
import "package:logging/logging.dart";

void main() {
  Logger.root.onRecord.listen((LogRecord r) =>
      print("${r.loggerName} [${r.level}]:\t${r.message}"));
  String here = path.absolute(Platform.script.path);
  final topDir = path.dirname(path.dirname(here));
  System ebisu = system('thrift')
    ..includeHop = true
    ..license = 'apache'
    ..rootPath = topDir
    ..doc = 'Package with libraries supporting the Thrift protocol'
    ..libraries = [
      library('protocol')
      ..imports = [ 'package:thrift/protocol.dart' ]
      ..parts = [
        part('protocol')
        ..enums = [
          enum_('t_type')
          ..values = [
            'tt_stop', 'tt_true', 'tt_false', 'tt_byte', 'tt_i16', 'tt_i32',
            'tt_i64', 'tt_double', 'tt_binary', 'tt_list', 'tt_set', 'tt_map', 'tt_struct',
          ].map((v) => idFromString(v)).toList(),
          enum_('t_message_type')
          ..values = [
            'tmt_invalid_message', 'tmt_call', 'tmt_reply', 'tmt_exception', 'tmt_oneway',
          ].map((v) => idFromString(v)).toList(),
        ]
        ..classes = [
          class_('t_list')
          ..immutable = true
          ..members = [
            member('type')..type = 'TType',
            member('size')..type = 'int',
          ],
          class_('t_map')
          ..immutable = true
          ..members = [
            member('key_type')..type = 'TType',
            member('value_type')..type = 'TType',
            member('size')..type = 'int',
          ],
          class_('t_message')
          ..immutable = true
          ..members = [
            member('name'),
            member('type')..type = 'TMessageType',
            member('seqid')..type = 'int',
          ],
          class_('t_struct')
          ..immutable = true
          ..members = [ member('name') ],
          class_('t_set')
          ..immutable = true
          ..members = [
            member('type')..type = 'TType',
            member('size')..type = 'int',
          ],
          class_('t_field')
          ..immutable = true
          ..members = [
            member('id')..type = 'int',
            member('name'),
            member('type')..type = 'int',
          ],
          class_('t_protocol_base')
          ..isAbstract = true
          ..members = [
            member('trans')..type = 'TTransport'..ctors = ['']
          ],
        ],
        part('binary')
        ..classes = [ class_('t_binary_protocol')..implement = [ 'TProtocolBase' ] ],
        part('compact')
        ..classes = [ class_('t_compact_protocol')..implement = [ 'TProtocolBase' ] ],
        part('json')
        ..classes = [ class_('t_json_protocol')..implement = [ 'TProtocolBase' ] ],
      ],
      library('server')
      ..parts = [
        part('blocking')
        ..classes = [ class_('t_server') ],
        part('non_blocking')
        ..classes = [ class_('t_non_blocking_server') ],
        part('http')
        ..classes = [ class_('t_http_server') ],
      ],
      library('transport')
      ..parts = [
        part('transport')
        ..enums = [
          enum_('t_exception_type')
          ..values = [
            'tet_unknown', 'tet_not_open', 'tet_already_open', 'tet_timed_out', 'tet_end_of_file',
          ].map((v) => idFromString(v)).toList(),
        ]
        ..classes = [
          class_('t_transport_exception')
          ..extend = 'Exception',
          class_('t_transport')..isAbstract = true
        ],
        part('socket_transport')
        ..classes = [
          class_('t_socket')
          ..extend = 'TTransport'
          ..members = [
            member('host')..ctors = [''],
            member('port')..type = 'int'..ctors = [''],
          ],
        ],
        part('ssl_socket_transport'),
        part('framed_transport'),
      ]

    ];

  ebisu.generate();

}