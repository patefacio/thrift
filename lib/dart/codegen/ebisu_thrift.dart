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
  useDartFormatter = true;
  System ebisu = system('thrift')
    ..includeHop = true
    ..license = 'apache'
    ..rootPath = topDir
    ..doc = 'Package with libraries supporting the Thrift protocol'
    ..testLibraries = [
      library('test_protocol'),
      library('test_transport'),
    ]
    ..libraries = [
      library('protocol')
      ..imports = [ 'package:thrift/transport.dart' ]
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
          class_('t_protocol')..isAbstract = true,
          class_('t_protocol_factory')..isAbstract = true,
        ],
        part('binary')
        ..classes = [
          class_('t_binary_protocol')..implement = [ 'TProtocol' ]
          ..members = [
            member('transport')..type = 'TTransport'..access = RO..ctors = ['']
          ],
          class_('t_binary_protocol_factory')
          ..implement = ['TProtocolFactory'],
        ],
        part('compact')
        ..classes = [
          class_('t_compact_protocol')..implement = [ 'TProtocol' ]
          ..members = [
            member('transport')..type = 'TTransport'..access = RO..ctors = ['']
          ]
        ],
        part('json')
        ..classes = [
          class_('t_json_protocol')..implement = [ 'TProtocol' ]
          ..members = [
            member('transport')..type = 'TTransport'..access = RO..ctors = ['']
          ]
        ],
      ],
      library('server')
      ..imports = [
        'package:thrift/protocol.dart',
        'package:thrift/transport.dart',
      ]
      ..parts = [
        part('server')
        ..classes = [
          class_('t_processor')
          ..isAbstract = true,
          class_('t_server_args')
          ..members = ([
            member('processor')..type = 'TProcessor',
            member('server_transport')..type = 'TServerTransport',
            member('input_transport_factory')..type = 'TTransportFactory',
            member('input_protocol_factory')..type = 'TProtocolFactory',
            member('output_transport_factory')..type = 'TTransportFactory',
            member('output_protocol_factory')..type = 'TProtocolFactory',
          ]..forEach((m) => m.isFinal = true)),
          class_('t_server_context')
          ..isAbstract = true,
          class_('t_server_event_handler')
          ..isAbstract = true,
          class_('t_server')
          ..isAbstract = true
          ..members = [
            member('args')..type = 'TServerArgs'..access = RO,
            member('is_serving')..classInit = false..access = RO,
          ]
        ],
        part('blocking')
        ..classes = [
          class_('t_simple_server')
          ..extend = 'TServer'
          ..members = [
            member('server_transport')..type = 'TServerTransport'..access = RO,
            member('is_stopped')..classInit = false..access = RO,
          ]
        ],
        part('non_blocking')
        ..classes = [ class_('t_non_blocking_server') ],
        part('http')
        ..classes = [ class_('t_http_server') ],
      ],
      library('transport')
      ..imports = [
        'io',
      ]
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
          ..implement = ['Exception']
          ..immutable = true
          ..members = [
            member('message')
          ],
          class_('t_transport')..isAbstract = true,
          class_('t_transport_factory'),
          class_('t_server_transport')..isAbstract = true,
        ],
        part('socket_transport')
        ..classes = [
          class_('t_socket')
          ..extend = 'TTransport'
          ..members = [
            member('host'),
            member('port')..type = 'int',
            member('is_open')..access = RO..classInit = false,
            member('socket')..access = IA..type = 'Socket',
          ],
          class_('t_server_socket')
          ..extend = 'TServerTransport'
          ..members = [
            member('server_socket')..access = IA..type = 'ServerSocket',
          ]
        ],
        part('ssl_socket_transport'),
        part('framed_transport'),
      ]

    ];

  ebisu.generate();

}