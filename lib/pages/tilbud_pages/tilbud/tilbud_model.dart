import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/custom_drawer/custom_drawer_widget.dart';
import 'tilbud_widget.dart' show TilbudWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TilbudModel extends FlutterFlowModel<TilbudWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CustomDrawer component.
  late CustomDrawerModel customDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customDrawerModel = createModel(context, () => CustomDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    customDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
