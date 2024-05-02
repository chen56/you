// // Generated by https://github.com/chen56/you
//  - This file setup routes tree and strong type `routes` reference
//  - This file should be version controlled and should not be manually edited
//
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: library_prefixes
// ignore_for_file: non_constant_identifier_names

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:you_flutter/router.dart';
import 'package:flutter_web/routes/page.dart';
import 'package:you_flutter/note.dart';
import 'package:flutter_web/routes/notes/page.dart' as _notes_page;
import 'package:flutter_web/routes/notes/layout.dart';
import 'package:flutter_web/routes/notes/research/parameterized/page.dart' as _parameterized_page;
import 'package:flutter_web/routes/notes/research/remote_view/page.dart' as _remote_view_page;
import 'package:flutter_web/routes/notes/env_info/page.dart' as _env_info_page;
import 'package:flutter_web/routes/notes/layout/page.dart' as _layout_page;
import 'package:flutter_web/routes/notes/layout/old/layout/page.dart' as _layout_page2;
import 'package:flutter_web/routes/notes/layout/box_layout/constraints/page.dart' as _constraints_page;
import 'package:flutter_web/routes/notes/layout/responsive_design/page.dart' as _responsive_design_page;
import 'package:flutter_web/routes/notes/navigation/page.dart' as _navigation_page;
import 'package:flutter_web/routes/notes/state/page.dart' as _state_page;
import 'package:flutter_web/routes/notes/state/1.vanilla_state/page.dart' as _1_vanilla_state_page;
import 'package:flutter_web/routes/notes/state/StatefulBuilder/page.dart' as _StatefulBuilder_page;
import 'package:flutter_web/routes/notes/media&assets&file/file_desktop/page.dart' as _file_desktop_page;
import 'package:flutter_web/routes/notes/media&assets&file/file_web/page.dart' as _file_web_page;
import 'package:flutter_web/routes/notes/media&assets&file/assets/page.dart' as _assets_page;
import 'package:flutter_web/routes/notes/style&theming/material3/page.dart' as _material3_page;
import 'package:flutter_web/routes/notes/pure_dart/dart3/page.dart' as _dart3_page;
import 'package:flutter_web/routes/notes/pure_dart/async/page.dart' as _async_page;
import 'package:flutter_web/routes/notes/pure_dart/safe_interface/page.dart' as _safe_interface_page;
import 'package:flutter_web/routes/notes/pure_dart/execption/page.dart' as _execption_page;
import 'package:flutter_web/routes/notes/pure_dart/serialization_json/page.dart' as _serialization_json_page;
import 'package:flutter_web/routes/notes/pure_dart/analyzer/page.dart' as _analyzer_page;
import 'package:flutter_web/routes/notes/dev/host_mirror/page.dart' as _host_mirror_page;
import 'package:flutter_web/routes/notes/dev/macos_config/page.dart' as _macos_config_page;
import 'package:flutter_web/routes/notes/dev/devtool/page.dart' as _devtool_page;
import 'package:flutter_web/routes/notes/dev/devtool/vmservice/page.dart' as _vmservice_page;
import 'package:flutter_web/routes/notes/dev/debug/page.dart' as _debug_page;
import 'package:flutter_web/routes/notes/i18n/page.dart' as _i18n_page;
import 'package:flutter_web/routes/notes/thinking_in_ui/readable_html_vs_dart/page.dart' as _readable_html_vs_dart_page;
import 'package:flutter_web/routes/notes/x.note_inside/how_note_work/page.dart' as _how_note_work_page;
import 'package:flutter_web/routes/notes/x.note_inside/mockup_content/page.dart' as _mockup_content_page;
import 'package:flutter_web/routes/notes/x.note_inside/1.welcome/page.dart' as _1_welcome_page;
import 'package:flutter_web/routes/notes/x.note_inside/note_test_self/page.dart' as _note_test_self_page;
import 'package:flutter_web/routes/notes/x.note_inside/note_test_self/nobody/page.dart' as _nobody_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/input/page.dart' as _input_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/webview/page.dart' as _webview_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/slider/page.dart' as _slider_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/selectable/page.dart' as _selectable_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/button/ButtonStyleButton/page.dart' as _ButtonStyleButton_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/button/FloatingActionButton/page.dart' as _FloatingActionButton_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/button/IconButton/page.dart' as _IconButton_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/button/overview/page.dart' as _overview_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/text/RichText/page.dart' as _RichText_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/text/Text/page.dart' as _Text_page;
import 'package:flutter_web/routes/notes/widgets/specific_widgets/icon/page.dart' as _icon_page;
import 'package:flutter_web/routes/notes/widgets/container_widgets/menu/page.dart' as _menu_page;
import 'package:flutter_web/routes/notes/widgets/container_widgets/scrollable/Dismissible/page.dart' as _Dismissible_page;
import 'package:flutter_web/routes/notes/widgets/container_widgets/bar/page.dart' as _bar_page;
import 'package:flutter_web/routes/notes/Improve_app/page.dart' as _Improve_app_page;
import 'package:flutter_web/routes/notes/Improve_app/1.overview/page.dart' as _1_overview_page;
import 'package:flutter_web/routes/notes/Improve_app/web_optimization/page.dart' as _web_optimization_page;
import 'package:flutter_web/routes/notes/Improve_app/RepaintBoundary/page.dart' as _RepaintBoundary_page;
import 'package:flutter_web/routes/notes/Improve_app/event&listener&lifeycle/page.dart' as _event_listener_lifeycle_page;

mixin RoutesMixin {
  final RouteNode root = ToPage('routes', page: build).route(children: [
    ToNote('notes', page: _notes_page.build, layout: layout).route(children: [
      ToNote('research').route(children: [
        ToNote('bash_note').route(),
        ToNote('parameterized', page: _parameterized_page.build).route(),
        ToNote('remote_view', page: _remote_view_page.build).route(),
      ]),
      ToNote('env_info', page: _env_info_page.build).route(),
      ToNote('layout', page: _layout_page.build).route(children: [
        ToNote('old').route(children: [
          ToNote('layout', page: _layout_page2.build).route(),
        ]),
        ToNote('box_layout').route(children: [
          ToNote('constraints', page: _constraints_page.build).route(),
        ]),
        ToNote('responsive_design', page: _responsive_design_page.build).route(),
        ToNote('1.welcome').route(),
      ]),
      ToNote('navigation', page: _navigation_page.build).route(children: [
        ToNote('navigator_v1').route(),
        ToNote('navigator_v2').route(),
      ]),
      ToNote('state', page: _state_page.build).route(children: [
        ToNote('1.vanilla_state', page: _1_vanilla_state_page.build).route(),
        ToNote('StatefulBuilder', page: _StatefulBuilder_page.build).route(),
      ]),
      ToNote('media&assets&file').route(children: [
        ToNote('file_desktop', page: _file_desktop_page.build).route(),
        ToNote('file_web', page: _file_web_page.build).route(),
        ToNote('assets', page: _assets_page.build).route(),
      ]),
      ToNote('style&theming').route(children: [
        ToNote('material3', page: _material3_page.build).route(),
        ToNote('Material').route(),
      ]),
      ToNote('pure_dart').route(children: [
        ToNote('dart3', page: _dart3_page.build).route(),
        ToNote('async', page: _async_page.build).route(),
        ToNote('safe_interface', page: _safe_interface_page.build).route(),
        ToNote('execption', page: _execption_page.build).route(),
        ToNote('serialization_json', page: _serialization_json_page.build).route(),
        ToNote('analyzer', page: _analyzer_page.build).route(),
      ]),
      ToNote('dev').route(children: [
        ToNote('host_mirror', page: _host_mirror_page.build).route(),
        ToNote('macos_config', page: _macos_config_page.build).route(),
        ToNote('devtool', page: _devtool_page.build).route(children: [
          ToNote('vmservice', page: _vmservice_page.build).route(),
        ]),
        ToNote('debug', page: _debug_page.build).route(),
      ]),
      ToNote('i18n', page: _i18n_page.build).route(),
      ToNote('thinking_in_ui').route(children: [
        ToNote('readable_html_vs_dart', page: _readable_html_vs_dart_page.build).route(),
      ]),
      ToNote('x.note_inside').route(children: [
        ToNote('how_note_work', page: _how_note_work_page.build).route(),
        ToNote('note_api_thinking').route(),
        ToNote('mockup_content', page: _mockup_content_page.build).route(),
        ToNote('1.welcome', page: _1_welcome_page.build).route(),
        ToNote('note_test_self', page: _note_test_self_page.build).route(children: [
          ToNote('nobody', page: _nobody_page.build).route(),
        ]),
      ]),
      ToNote('widgets').route(children: [
        ToNote('specific_widgets').route(children: [
          ToNote('input', page: _input_page.build).route(),
          ToNote('webview', page: _webview_page.build).route(),
          ToNote('slider', page: _slider_page.build).route(),
          ToNote('selectable', page: _selectable_page.build).route(),
          ToNote('button').route(children: [
            ToNote('ButtonStyleButton', page: _ButtonStyleButton_page.build).route(),
            ToNote('FloatingActionButton', page: _FloatingActionButton_page.build).route(),
            ToNote('IconButton', page: _IconButton_page.build).route(),
            ToNote('overview', page: _overview_page.build).route(),
          ]),
          ToNote('Divider').route(),
          ToNote('text').route(children: [
            ToNote('RichText', page: _RichText_page.build).route(),
            ToNote('Text', page: _Text_page.build).route(),
          ]),
          ToNote('icon', page: _icon_page.build).route(),
        ]),
        ToNote('container_widgets').route(children: [
          ToNote('drawer').route(),
          ToNote('Card').route(),
          ToNote('app').route(),
          ToNote('dialog').route(),
          ToNote('menu', page: _menu_page.build).route(),
          ToNote('scrollable').route(children: [
            ToNote('Dismissible', page: _Dismissible_page.build).route(),
            ToNote('DraggableScrollableSheet').route(),
          ]),
          ToNote('page_view').route(),
          ToNote('bar', page: _bar_page.build).route(),
        ]),
      ]),
      ToNote('Improve_app', page: _Improve_app_page.build).route(children: [
        ToNote('1.overview', page: _1_overview_page.build).route(),
        ToNote('error_handle').route(),
        ToNote('web_optimization', page: _web_optimization_page.build).route(),
        ToNote('RepaintBoundary', page: _RepaintBoundary_page.build).route(),
        ToNote('event&listener&lifeycle', page: _event_listener_lifeycle_page.build).route(),
      ]),
    ]),
  ]);
  late final RouteNode routes_root = root.find('/')!;
  late final RouteNode routes_notes = root.find('/notes')!;
  late final RouteNode routes_notes_research_parameterized = root.find('/notes/research/parameterized')!;
  late final RouteNode routes_notes_research_remote_view = root.find('/notes/research/remote_view')!;
  late final RouteNode routes_notes_env_info = root.find('/notes/env_info')!;
  late final RouteNode routes_notes_layout = root.find('/notes/layout')!;
  late final RouteNode routes_notes_layout_old_layout = root.find('/notes/layout/old/layout')!;
  late final RouteNode routes_notes_layout_box_layout_constraints = root.find('/notes/layout/box_layout/constraints')!;
  late final RouteNode routes_notes_layout_responsive_design = root.find('/notes/layout/responsive_design')!;
  late final RouteNode routes_notes_navigation = root.find('/notes/navigation')!;
  late final RouteNode routes_notes_state = root.find('/notes/state')!;
  late final RouteNode routes_notes_state_vanilla_state = root.find('/notes/state/1.vanilla_state')!;
  late final RouteNode routes_notes_state_StatefulBuilder = root.find('/notes/state/StatefulBuilder')!;
  late final RouteNode routes_notes_media_assets_file_file_desktop = root.find('/notes/media&assets&file/file_desktop')!;
  late final RouteNode routes_notes_media_assets_file_file_web = root.find('/notes/media&assets&file/file_web')!;
  late final RouteNode routes_notes_media_assets_file_assets = root.find('/notes/media&assets&file/assets')!;
  late final RouteNode routes_notes_style_theming_material3 = root.find('/notes/style&theming/material3')!;
  late final RouteNode routes_notes_pure_dart_dart3 = root.find('/notes/pure_dart/dart3')!;
  late final RouteNode routes_notes_pure_dart_async = root.find('/notes/pure_dart/async')!;
  late final RouteNode routes_notes_pure_dart_safe_interface = root.find('/notes/pure_dart/safe_interface')!;
  late final RouteNode routes_notes_pure_dart_execption = root.find('/notes/pure_dart/execption')!;
  late final RouteNode routes_notes_pure_dart_serialization_json = root.find('/notes/pure_dart/serialization_json')!;
  late final RouteNode routes_notes_pure_dart_analyzer = root.find('/notes/pure_dart/analyzer')!;
  late final RouteNode routes_notes_dev_host_mirror = root.find('/notes/dev/host_mirror')!;
  late final RouteNode routes_notes_dev_macos_config = root.find('/notes/dev/macos_config')!;
  late final RouteNode routes_notes_dev_devtool = root.find('/notes/dev/devtool')!;
  late final RouteNode routes_notes_dev_devtool_vmservice = root.find('/notes/dev/devtool/vmservice')!;
  late final RouteNode routes_notes_dev_debug = root.find('/notes/dev/debug')!;
  late final RouteNode routes_notes_i18n = root.find('/notes/i18n')!;
  late final RouteNode routes_notes_thinking_in_ui_readable_html_vs_dart = root.find('/notes/thinking_in_ui/readable_html_vs_dart')!;
  late final RouteNode routes_notes_x_note_inside_how_note_work = root.find('/notes/x.note_inside/how_note_work')!;
  late final RouteNode routes_notes_x_note_inside_mockup_content = root.find('/notes/x.note_inside/mockup_content')!;
  late final RouteNode routes_notes_x_note_inside_welcome = root.find('/notes/x.note_inside/1.welcome')!;
  late final RouteNode routes_notes_x_note_inside_note_test_self = root.find('/notes/x.note_inside/note_test_self')!;
  late final RouteNode routes_notes_x_note_inside_note_test_self_nobody = root.find('/notes/x.note_inside/note_test_self/nobody')!;
  late final RouteNode routes_notes_widgets_specific_widgets_input = root.find('/notes/widgets/specific_widgets/input')!;
  late final RouteNode routes_notes_widgets_specific_widgets_webview = root.find('/notes/widgets/specific_widgets/webview')!;
  late final RouteNode routes_notes_widgets_specific_widgets_slider = root.find('/notes/widgets/specific_widgets/slider')!;
  late final RouteNode routes_notes_widgets_specific_widgets_selectable = root.find('/notes/widgets/specific_widgets/selectable')!;
  late final RouteNode routes_notes_widgets_specific_widgets_button_ButtonStyleButton = root.find('/notes/widgets/specific_widgets/button/ButtonStyleButton')!;
  late final RouteNode routes_notes_widgets_specific_widgets_button_FloatingActionButton = root.find('/notes/widgets/specific_widgets/button/FloatingActionButton')!;
  late final RouteNode routes_notes_widgets_specific_widgets_button_IconButton = root.find('/notes/widgets/specific_widgets/button/IconButton')!;
  late final RouteNode routes_notes_widgets_specific_widgets_button_overview = root.find('/notes/widgets/specific_widgets/button/overview')!;
  late final RouteNode routes_notes_widgets_specific_widgets_text_RichText = root.find('/notes/widgets/specific_widgets/text/RichText')!;
  late final RouteNode routes_notes_widgets_specific_widgets_text_Text = root.find('/notes/widgets/specific_widgets/text/Text')!;
  late final RouteNode routes_notes_widgets_specific_widgets_icon = root.find('/notes/widgets/specific_widgets/icon')!;
  late final RouteNode routes_notes_widgets_container_widgets_menu = root.find('/notes/widgets/container_widgets/menu')!;
  late final RouteNode routes_notes_widgets_container_widgets_scrollable_Dismissible = root.find('/notes/widgets/container_widgets/scrollable/Dismissible')!;
  late final RouteNode routes_notes_widgets_container_widgets_bar = root.find('/notes/widgets/container_widgets/bar')!;
  late final RouteNode routes_notes_Improve_app = root.find('/notes/Improve_app')!;
  late final RouteNode routes_notes_Improve_app_overview = root.find('/notes/Improve_app/1.overview')!;
  late final RouteNode routes_notes_Improve_app_web_optimization = root.find('/notes/Improve_app/web_optimization')!;
  late final RouteNode routes_notes_Improve_app_RepaintBoundary = root.find('/notes/Improve_app/RepaintBoundary')!;
  late final RouteNode routes_notes_Improve_app_event_listener_lifeycle = root.find('/notes/Improve_app/event&listener&lifeycle')!;
}

class Routes with RoutesMixin {}
