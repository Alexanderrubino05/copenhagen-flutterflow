import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/widgets/payment_completed_dialog/payment_completed_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'have_paid_page_widget.dart' show HavePaidPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HavePaidPageModel extends FlutterFlowModel<HavePaidPageWidget> {
  ///  Local state fields for this page.

  int? loopValue = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (createPayment)] action in HavePaidPage widget.
  ApiCallResponse? createPayment;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (fetchPayment)] action in HavePaidPage widget.
  ApiCallResponse? autoApiResult;
  // Stores action output result for [Backend Call - API (capturePayment)] action in HavePaidPage widget.
  ApiCallResponse? captureAmountAPI;
  // Stores action output result for [Backend Call - API (fetchPayment)] action in Button widget.
  ApiCallResponse? apiResultb3f;
  // Stores action output result for [Backend Call - API (capturePayment)] action in Button widget.
  ApiCallResponse? apiResultjnm;
  // Stores action output result for [Backend Call - API (cancelPayment)] action in Button widget.
  ApiCallResponse? apiResult1wa;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
