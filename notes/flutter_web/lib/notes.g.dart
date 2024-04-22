import 'package:you_note_dart/note.dart';

// Generated by gen_maters.dart, please don't edit!
// ignore_for_file: library_prefixes, non_constant_identifier_names

import 'package:flutter_web/notes/dev/debug/note.dart' deferred as dev_debug_;
import 'package:flutter_web/notes/dev/devtool/note.dart' deferred as dev_devtool_;
import 'package:flutter_web/notes/dev/devtool/vmservice/note.dart' deferred as dev_devtool_vmservice_;
import 'package:flutter_web/notes/dev/host_mirror/note.dart' deferred as dev_host_mirror_;
import 'package:flutter_web/notes/dev/macos_config/note.dart' deferred as dev_macos_config_;
import 'package:flutter_web/notes/env_info/note.dart' deferred as env_info_;
import 'package:flutter_web/notes/i18n/note.dart' deferred as i18n_;
import 'package:flutter_web/notes/Improve_app/1.overview/note.dart' deferred as Improve_app_overview_;
import 'package:flutter_web/notes/Improve_app/event&listener&lifeycle/note.dart' deferred as Improve_app_event_listener_lifeycle_;
import 'package:flutter_web/notes/Improve_app/note.dart' deferred as Improve_app_;
import 'package:flutter_web/notes/Improve_app/RepaintBoundary/note.dart' deferred as Improve_app_RepaintBoundary_;
import 'package:flutter_web/notes/Improve_app/web_optimization/note.dart' deferred as Improve_app_web_optimization_;
import 'package:flutter_web/notes/layout/box_layout/constraints/note.dart' deferred as layout_box_layout_constraints_;
import 'package:flutter_web/notes/layout/note.dart' deferred as layout_;
import 'package:flutter_web/notes/layout/old/layout/note.dart' deferred as layout_old_layout_;
import 'package:flutter_web/notes/layout/responsive_design/note.dart' deferred as layout_responsive_design_;
import 'package:flutter_web/notes/media&assets&file/assets/note.dart' deferred as media_assets_file_assets_;
import 'package:flutter_web/notes/media&assets&file/file_desktop/note.dart' deferred as media_assets_file_file_desktop_;
import 'package:flutter_web/notes/media&assets&file/file_web/note.dart' deferred as media_assets_file_file_web_;
import 'package:flutter_web/notes/navigation/note.dart' deferred as navigation_;
import 'package:flutter_web/notes/note.dart' deferred as root_;
import 'package:flutter_web/notes/pure_dart/analyzer/note.dart' deferred as pure_dart_analyzer_;
import 'package:flutter_web/notes/pure_dart/async/note.dart' deferred as pure_dart_async_;
import 'package:flutter_web/notes/pure_dart/dart3/note.dart' deferred as pure_dart_dart3_;
import 'package:flutter_web/notes/pure_dart/execption/note.dart' deferred as pure_dart_execption_;
import 'package:flutter_web/notes/pure_dart/safe_interface/note.dart' deferred as pure_dart_safe_interface_;
import 'package:flutter_web/notes/pure_dart/serialization_json/note.dart' deferred as pure_dart_serialization_json_;
import 'package:flutter_web/notes/research/remote_view/note.dart' deferred as research_remote_view_;
import 'package:flutter_web/notes/research/research_parameterized_example/note.dart' deferred as research_research_parameterized_example_;
import 'package:flutter_web/notes/state/1.vanilla_state/note.dart' deferred as state_vanilla_state_;
import 'package:flutter_web/notes/state/note.dart' deferred as state_;
import 'package:flutter_web/notes/state/StatefulBuilder/note.dart' deferred as state_StatefulBuilder_;
import 'package:flutter_web/notes/style&theming/material3/note.dart' deferred as style_theming_material3_;
import 'package:flutter_web/notes/thinking_in_ui/readable_html_vs_dart/note.dart' deferred as thinking_in_ui_readable_html_vs_dart_;
import 'package:flutter_web/notes/widgets/container_widgets/bar/note.dart' deferred as widgets_container_widgets_bar_;
import 'package:flutter_web/notes/widgets/container_widgets/menu/note.dart' deferred as widgets_container_widgets_menu_;
import 'package:flutter_web/notes/widgets/container_widgets/scrollable/Dismissible/note.dart' deferred as widgets_container_widgets_scrollable_Dismissible_;
import 'package:flutter_web/notes/widgets/specific_widgets/button/ButtonStyleButton/note.dart' deferred as widgets_specific_widgets_button_ButtonStyleButton_;
import 'package:flutter_web/notes/widgets/specific_widgets/button/FloatingActionButton/note.dart' deferred as widgets_specific_widgets_button_FloatingActionButton_;
import 'package:flutter_web/notes/widgets/specific_widgets/button/IconButton/note.dart' deferred as widgets_specific_widgets_button_IconButton_;
import 'package:flutter_web/notes/widgets/specific_widgets/button/overview/note.dart' deferred as widgets_specific_widgets_button_overview_;
import 'package:flutter_web/notes/widgets/specific_widgets/icon/note.dart' deferred as widgets_specific_widgets_icon_;
import 'package:flutter_web/notes/widgets/specific_widgets/input/note.dart' deferred as widgets_specific_widgets_input_;
import 'package:flutter_web/notes/widgets/specific_widgets/selectable/note.dart' deferred as widgets_specific_widgets_selectable_;
import 'package:flutter_web/notes/widgets/specific_widgets/slider/note.dart' deferred as widgets_specific_widgets_slider_;
import 'package:flutter_web/notes/widgets/specific_widgets/text/RichText/note.dart' deferred as widgets_specific_widgets_text_RichText_;
import 'package:flutter_web/notes/widgets/specific_widgets/text/Text/note.dart' deferred as widgets_specific_widgets_text_Text_;
import 'package:flutter_web/notes/widgets/specific_widgets/webview/note.dart' deferred as widgets_specific_widgets_webview_;
import 'package:flutter_web/notes/x.note_inside/1.welcome/note.dart' deferred as x_note_inside_welcome_;
import 'package:flutter_web/notes/x.note_inside/how_note_work/note.dart' deferred as x_note_inside_how_note_work_;
import 'package:flutter_web/notes/x.note_inside/mockup_content/note.dart' deferred as x_note_inside_mockup_content_;
import 'package:flutter_web/notes/x.note_inside/note_test_self/nobody/note.dart' deferred as x_note_inside_note_test_self_nobody_;
import 'package:flutter_web/notes/x.note_inside/note_test_self/note.dart' deferred as x_note_inside_note_test_self_;


abstract class BaseNotes {
  static final NoteRoute rootroot = NoteRoute.root();
  static NoteRoute put(String path, LazyNoteBuilder lazyNoteBuilder) {
    return rootroot.put(path, lazyNoteBuilder);
  }
  final research_research_parameterized_example              = put("/research/research_parameterized_example", (context,print) async => await research_research_parameterized_example_.loadLibrary().then((value) => research_research_parameterized_example_.build(context,print)));  
  final research_remote_view                                 = put("/research/remote_view", (context,print) async => await research_remote_view_.loadLibrary().then((value) => research_remote_view_.build(context,print)));  
  final env_info                                             = put("/env_info", (context,print) async => await env_info_.loadLibrary().then((value) => env_info_.build(context,print)));  
  final layout_old_layout                                    = put("/layout/old/layout", (context,print) async => await layout_old_layout_.loadLibrary().then((value) => layout_old_layout_.build(context,print)));  
  final layout_box_layout_constraints                        = put("/layout/box_layout/constraints", (context,print) async => await layout_box_layout_constraints_.loadLibrary().then((value) => layout_box_layout_constraints_.build(context,print)));  
  final layout_responsive_design                             = put("/layout/responsive_design", (context,print) async => await layout_responsive_design_.loadLibrary().then((value) => layout_responsive_design_.build(context,print)));  
  final layout                                               = put("/layout", (context,print) async => await layout_.loadLibrary().then((value) => layout_.build(context,print)));  
  final navigation                                           = put("/navigation", (context,print) async => await navigation_.loadLibrary().then((value) => navigation_.build(context,print)));  
  final state_vanilla_state                                  = put("/state/1.vanilla_state", (context,print) async => await state_vanilla_state_.loadLibrary().then((value) => state_vanilla_state_.build(context,print)));  
  final state                                                = put("/state", (context,print) async => await state_.loadLibrary().then((value) => state_.build(context,print)));  
  final state_StatefulBuilder                                = put("/state/StatefulBuilder", (context,print) async => await state_StatefulBuilder_.loadLibrary().then((value) => state_StatefulBuilder_.build(context,print)));  
  final media_assets_file_file_desktop                       = put("/media&assets&file/file_desktop", (context,print) async => await media_assets_file_file_desktop_.loadLibrary().then((value) => media_assets_file_file_desktop_.build(context,print)));  
  final media_assets_file_file_web                           = put("/media&assets&file/file_web", (context,print) async => await media_assets_file_file_web_.loadLibrary().then((value) => media_assets_file_file_web_.build(context,print)));  
  final media_assets_file_assets                             = put("/media&assets&file/assets", (context,print) async => await media_assets_file_assets_.loadLibrary().then((value) => media_assets_file_assets_.build(context,print)));  
  final style_theming_material3                              = put("/style&theming/material3", (context,print) async => await style_theming_material3_.loadLibrary().then((value) => style_theming_material3_.build(context,print)));  
  final pure_dart_dart3                                      = put("/pure_dart/dart3", (context,print) async => await pure_dart_dart3_.loadLibrary().then((value) => pure_dart_dart3_.build(context,print)));  
  final pure_dart_async                                      = put("/pure_dart/async", (context,print) async => await pure_dart_async_.loadLibrary().then((value) => pure_dart_async_.build(context,print)));  
  final pure_dart_safe_interface                             = put("/pure_dart/safe_interface", (context,print) async => await pure_dart_safe_interface_.loadLibrary().then((value) => pure_dart_safe_interface_.build(context,print)));  
  final pure_dart_execption                                  = put("/pure_dart/execption", (context,print) async => await pure_dart_execption_.loadLibrary().then((value) => pure_dart_execption_.build(context,print)));  
  final pure_dart_serialization_json                         = put("/pure_dart/serialization_json", (context,print) async => await pure_dart_serialization_json_.loadLibrary().then((value) => pure_dart_serialization_json_.build(context,print)));  
  final pure_dart_analyzer                                   = put("/pure_dart/analyzer", (context,print) async => await pure_dart_analyzer_.loadLibrary().then((value) => pure_dart_analyzer_.build(context,print)));  
  final dev_host_mirror                                      = put("/dev/host_mirror", (context,print) async => await dev_host_mirror_.loadLibrary().then((value) => dev_host_mirror_.build(context,print)));  
  final dev_macos_config                                     = put("/dev/macos_config", (context,print) async => await dev_macos_config_.loadLibrary().then((value) => dev_macos_config_.build(context,print)));  
  final dev_devtool_vmservice                                = put("/dev/devtool/vmservice", (context,print) async => await dev_devtool_vmservice_.loadLibrary().then((value) => dev_devtool_vmservice_.build(context,print)));  
  final dev_devtool                                          = put("/dev/devtool", (context,print) async => await dev_devtool_.loadLibrary().then((value) => dev_devtool_.build(context,print)));  
  final dev_debug                                            = put("/dev/debug", (context,print) async => await dev_debug_.loadLibrary().then((value) => dev_debug_.build(context,print)));  
  final root                                                 = put("/", (context,print) async => await root_.loadLibrary().then((value) => root_.build(context,print)));  
  final i18n                                                 = put("/i18n", (context,print) async => await i18n_.loadLibrary().then((value) => i18n_.build(context,print)));  
  final thinking_in_ui_readable_html_vs_dart                 = put("/thinking_in_ui/readable_html_vs_dart", (context,print) async => await thinking_in_ui_readable_html_vs_dart_.loadLibrary().then((value) => thinking_in_ui_readable_html_vs_dart_.build(context,print)));  
  final x_note_inside_how_note_work                          = put("/x.note_inside/how_note_work", (context,print) async => await x_note_inside_how_note_work_.loadLibrary().then((value) => x_note_inside_how_note_work_.build(context,print)));  
  final x_note_inside_mockup_content                         = put("/x.note_inside/mockup_content", (context,print) async => await x_note_inside_mockup_content_.loadLibrary().then((value) => x_note_inside_mockup_content_.build(context,print)));  
  final x_note_inside_welcome                                = put("/x.note_inside/1.welcome", (context,print) async => await x_note_inside_welcome_.loadLibrary().then((value) => x_note_inside_welcome_.build(context,print)));  
  final x_note_inside_note_test_self_nobody                  = put("/x.note_inside/note_test_self/nobody", (context,print) async => await x_note_inside_note_test_self_nobody_.loadLibrary().then((value) => x_note_inside_note_test_self_nobody_.build(context,print)));  
  final x_note_inside_note_test_self                         = put("/x.note_inside/note_test_self", (context,print) async => await x_note_inside_note_test_self_.loadLibrary().then((value) => x_note_inside_note_test_self_.build(context,print)));  
  final widgets_specific_widgets_input                       = put("/widgets/specific_widgets/input", (context,print) async => await widgets_specific_widgets_input_.loadLibrary().then((value) => widgets_specific_widgets_input_.build(context,print)));  
  final widgets_specific_widgets_webview                     = put("/widgets/specific_widgets/webview", (context,print) async => await widgets_specific_widgets_webview_.loadLibrary().then((value) => widgets_specific_widgets_webview_.build(context,print)));  
  final widgets_specific_widgets_slider                      = put("/widgets/specific_widgets/slider", (context,print) async => await widgets_specific_widgets_slider_.loadLibrary().then((value) => widgets_specific_widgets_slider_.build(context,print)));  
  final widgets_specific_widgets_selectable                  = put("/widgets/specific_widgets/selectable", (context,print) async => await widgets_specific_widgets_selectable_.loadLibrary().then((value) => widgets_specific_widgets_selectable_.build(context,print)));  
  final widgets_specific_widgets_button_ButtonStyleButton    = put("/widgets/specific_widgets/button/ButtonStyleButton", (context,print) async => await widgets_specific_widgets_button_ButtonStyleButton_.loadLibrary().then((value) => widgets_specific_widgets_button_ButtonStyleButton_.build(context,print)));  
  final widgets_specific_widgets_button_FloatingActionButton = put("/widgets/specific_widgets/button/FloatingActionButton", (context,print) async => await widgets_specific_widgets_button_FloatingActionButton_.loadLibrary().then((value) => widgets_specific_widgets_button_FloatingActionButton_.build(context,print)));  
  final widgets_specific_widgets_button_IconButton           = put("/widgets/specific_widgets/button/IconButton", (context,print) async => await widgets_specific_widgets_button_IconButton_.loadLibrary().then((value) => widgets_specific_widgets_button_IconButton_.build(context,print)));  
  final widgets_specific_widgets_button_overview             = put("/widgets/specific_widgets/button/overview", (context,print) async => await widgets_specific_widgets_button_overview_.loadLibrary().then((value) => widgets_specific_widgets_button_overview_.build(context,print)));  
  final widgets_specific_widgets_text_RichText               = put("/widgets/specific_widgets/text/RichText", (context,print) async => await widgets_specific_widgets_text_RichText_.loadLibrary().then((value) => widgets_specific_widgets_text_RichText_.build(context,print)));  
  final widgets_specific_widgets_text_Text                   = put("/widgets/specific_widgets/text/Text", (context,print) async => await widgets_specific_widgets_text_Text_.loadLibrary().then((value) => widgets_specific_widgets_text_Text_.build(context,print)));  
  final widgets_specific_widgets_icon                        = put("/widgets/specific_widgets/icon", (context,print) async => await widgets_specific_widgets_icon_.loadLibrary().then((value) => widgets_specific_widgets_icon_.build(context,print)));  
  final widgets_container_widgets_menu                       = put("/widgets/container_widgets/menu", (context,print) async => await widgets_container_widgets_menu_.loadLibrary().then((value) => widgets_container_widgets_menu_.build(context,print)));  
  final widgets_container_widgets_scrollable_Dismissible     = put("/widgets/container_widgets/scrollable/Dismissible", (context,print) async => await widgets_container_widgets_scrollable_Dismissible_.loadLibrary().then((value) => widgets_container_widgets_scrollable_Dismissible_.build(context,print)));  
  final widgets_container_widgets_bar                        = put("/widgets/container_widgets/bar", (context,print) async => await widgets_container_widgets_bar_.loadLibrary().then((value) => widgets_container_widgets_bar_.build(context,print)));  
  final Improve_app_overview                                 = put("/Improve_app/1.overview", (context,print) async => await Improve_app_overview_.loadLibrary().then((value) => Improve_app_overview_.build(context,print)));  
  final Improve_app_web_optimization                         = put("/Improve_app/web_optimization", (context,print) async => await Improve_app_web_optimization_.loadLibrary().then((value) => Improve_app_web_optimization_.build(context,print)));  
  final Improve_app_RepaintBoundary                          = put("/Improve_app/RepaintBoundary", (context,print) async => await Improve_app_RepaintBoundary_.loadLibrary().then((value) => Improve_app_RepaintBoundary_.build(context,print)));  
  final Improve_app                                          = put("/Improve_app", (context,print) async => await Improve_app_.loadLibrary().then((value) => Improve_app_.build(context,print)));  
  final Improve_app_event_listener_lifeycle                  = put("/Improve_app/event&listener&lifeycle", (context,print) async => await Improve_app_event_listener_lifeycle_.loadLibrary().then((value) => Improve_app_event_listener_lifeycle_.build(context,print)));  
}
