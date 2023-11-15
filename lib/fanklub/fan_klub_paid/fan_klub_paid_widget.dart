import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/widgets/payment_completed_dialog/payment_completed_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'fan_klub_paid_model.dart';
export 'fan_klub_paid_model.dart';

class FanKlubPaidWidget extends StatefulWidget {
  const FanKlubPaidWidget({
    Key? key,
    required this.apiResult,
    required this.amount,
    required this.size,
  }) : super(key: key);

  final dynamic apiResult;
  final int? amount;
  final String? size;

  @override
  _FanKlubPaidWidgetState createState() => _FanKlubPaidWidgetState();
}

class _FanKlubPaidWidgetState extends State<FanKlubPaidWidget> {
  late FanKlubPaidModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FanKlubPaidModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 3000),
        callback: (timer) async {
          _model.autoApiResult = await FetchPaymentCall.call(
            paymentID: getJsonField(
              widget.apiResult,
              r'''$["paymentId"]''',
            ).toString().toString(),
          );
          if ((_model.autoApiResult?.succeeded ?? true)) {
            if (functions.returnCurrentState(getJsonField(
                  (_model.autoApiResult?.jsonBody ?? ''),
                  r'''$["state"]''',
                ).toString().toString()) ==
                'initiated') {
            } else if (functions.returnCurrentState(getJsonField(
                  (_model.autoApiResult?.jsonBody ?? ''),
                  r'''$["state"]''',
                ).toString().toString()) ==
                'reserved') {
              _model.captureAmountAPI = await CapturePaymentCall.call(
                amount: widget.amount,
                paymentId: getJsonField(
                  widget.apiResult,
                  r'''$["paymentId"]''',
                ).toString().toString(),
              );
              if ((_model.captureAmountAPI?.succeeded ?? true)) {
                _model.instantTimer?.cancel();
                await showAlignedDialog(
                  context: context,
                  isGlobal: true,
                  avoidOverflow: false,
                  targetAnchor: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  followerAnchor: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  builder: (dialogContext) {
                    return Material(
                      color: Colors.transparent,
                      child: WebViewAware(
                          child: GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: PaymentCompletedDialogWidget(),
                      )),
                    );
                  },
                ).then((value) => setState(() {}));

                await currentUserReference!.update(createUsersRecordData(
                  isInFanklub: true,
                ));

                await FanklubRecord.collection
                    .doc()
                    .set(createFanklubRecordData(
                      userId: currentUserReference,
                      name: currentUserDisplayName,
                      email: currentUserEmail,
                      whenJoinedFanklub: getCurrentTimestamp,
                      tshirt: widget.size,
                    ));
              } else {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                        child: AlertDialog(
                      title: Text((_model.captureAmountAPI?.statusCode ?? 200)
                          .toString()),
                      content: Text(
                          'Something went wrong when trying to capture payment. Try again or contact support.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text('Ok'),
                        ),
                      ],
                    ));
                  },
                );
              }
            } else if (functions.returnCurrentState(getJsonField(
                  (_model.autoApiResult?.jsonBody ?? ''),
                  r'''$["state"]''',
                ).toString().toString()) ==
                'cancelledByMerchant') {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                      child: AlertDialog(
                    title: Text('Aflyst betaling'),
                    content: Text('Betalingen er blevet lukket'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  ));
                },
              );
              context.safePop();
            } else if (functions.returnCurrentState(getJsonField(
                  (_model.autoApiResult?.jsonBody ?? ''),
                  r'''$["state"]''',
                ).toString().toString()) ==
                'cancelledBySystem') {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                      child: AlertDialog(
                    title: Text('Lukket betalingen'),
                    content: Text(
                        'Betalingen er lukket på grund af manglende interaktion med MobilePay'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  ));
                },
              );
              context.safePop();
            } else if (functions.returnCurrentState(getJsonField(
                  (_model.autoApiResult?.jsonBody ?? ''),
                  r'''$["state"]''',
                ).toString().toString()) ==
                'cancelledByUser') {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                      child: AlertDialog(
                    title: Text('Cancelled betaling'),
                    content: Text('Du har afvist betalingen i MobilePay appen'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  ));
                },
              );
              context.safePop();
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                      child: AlertDialog(
                    title: Text(
                        (_model.autoApiResult?.statusCode ?? 200).toString()),
                    content: Text(
                        'Something went wrong. Try again or contact support'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  ));
                },
              );
            }
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                    child: AlertDialog(
                  title: Text(
                      (_model.autoApiResult?.statusCode ?? 200).toString()),
                  content: Text(
                      'Something went wrong. Try again or contact support to get help'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ));
              },
            );
            context.safePop();
          }
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                'Færdiggør dit køb',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).secondaryBackground,
                            FlutterFlowTheme.of(context).primaryBackground
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.apiResultb3f =
                                      await FetchPaymentCall.call(
                                    paymentID: getJsonField(
                                      widget.apiResult,
                                      r'''$["paymentId"]''',
                                    ).toString(),
                                  );
                                  if ((_model.apiResultb3f?.succeeded ??
                                      true)) {
                                    if (functions
                                            .returnCurrentState(getJsonField(
                                          (_model.apiResultb3f?.jsonBody ?? ''),
                                          r'''$["state"]''',
                                        ).toString()) ==
                                        'initiated') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            title: Text('Betalingen venter'),
                                            content: Text(
                                                'Du mangler at betale beløbet i MobilePay'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ));
                                        },
                                      );
                                      await launchURL(getJsonField(
                                        (_model.apiResultb3f?.jsonBody ?? ''),
                                        r'''$["mobilePayAppRedirectUri"]''',
                                      ).toString());
                                    } else if (functions
                                            .returnCurrentState(getJsonField(
                                          (_model.apiResultb3f?.jsonBody ?? ''),
                                          r'''$["state"]''',
                                        ).toString()) ==
                                        'reserved') {
                                      _model.apiResultjnm =
                                          await CapturePaymentCall.call(
                                        amount: widget.amount,
                                        paymentId: getJsonField(
                                          widget.apiResult,
                                          r'''$["paymentId"]''',
                                        ).toString(),
                                      );
                                      if ((_model.apiResultjnm?.succeeded ??
                                          true)) {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          isInFanklub: true,
                                        ));

                                        await FanklubRecord.collection
                                            .doc()
                                            .set(createFanklubRecordData(
                                              userId: currentUserReference,
                                              name: currentUserDisplayName,
                                              email: currentUserEmail,
                                              whenJoinedFanklub:
                                                  getCurrentTimestamp,
                                              tshirt: widget.size,
                                            ));
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: true,
                                          avoidOverflow: false,
                                          targetAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: WebViewAware(
                                                  child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child:
                                                    PaymentCompletedDialogWidget(),
                                              )),
                                            );
                                          },
                                        ).then((value) => setState(() {}));

                                        context.safePop();
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                                child: AlertDialog(
                                              title: Text((_model.apiResultjnm
                                                          ?.statusCode ??
                                                      200)
                                                  .toString()),
                                              content: Text(
                                                  'Something went wrong when trying to capture payment. Try again or contact support.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ));
                                          },
                                        );
                                      }
                                    } else if (functions
                                            .returnCurrentState(getJsonField(
                                          (_model.apiResultb3f?.jsonBody ?? ''),
                                          r'''$["state"]''',
                                        ).toString()) ==
                                        'cancelledByMerchant') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            title: Text('Aflyst betaling'),
                                            content: Text(
                                                'Betalingen er blevet lukket'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ));
                                        },
                                      );
                                      context.safePop();
                                    } else if (functions
                                            .returnCurrentState(getJsonField(
                                          (_model.apiResultb3f?.jsonBody ?? ''),
                                          r'''$["state"]''',
                                        ).toString()) ==
                                        'cancelledBySystem') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            title: Text('Lukket betalingen'),
                                            content: Text(
                                                'Betalingen er lukket på grund af manglende interaktion med MobilePay'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ));
                                        },
                                      );
                                      context.safePop();
                                    } else if (functions
                                            .returnCurrentState(getJsonField(
                                          (_model.apiResultb3f?.jsonBody ?? ''),
                                          r'''$["state"]''',
                                        ).toString()) ==
                                        'cancelledByUser') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            title: Text('Cancelled betaling'),
                                            content: Text(
                                                'Du har afvist betalingen i MobilePay appen'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ));
                                        },
                                      );
                                      context.safePop();
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            title: Text(getJsonField(
                                              (_model.apiResultb3f?.jsonBody ??
                                                  ''),
                                              r'''$["state"]''',
                                            ).toString()),
                                            content: Text(
                                                'Something went wrong. Try again or contact support'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ));
                                        },
                                      );
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                            child: AlertDialog(
                                          title: Text((_model.apiResultb3f
                                                      ?.statusCode ??
                                                  200)
                                              .toString()),
                                          content: Text(
                                              'Something went wrong. Try again or contact support to get help'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ));
                                      },
                                    );
                                    context.safePop();
                                  }

                                  setState(() {});
                                },
                                text: 'Har du betalt?',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await launchURL(getJsonField(
                                widget.apiResult,
                                r'''$["mobilePayAppRedirectUri"]''',
                              ).toString());
                            },
                            text: 'Åben MobilePay',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Text(
                            'Betaling mangler - Klik på \"Åben Mobilepay for at gennemføre\"',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.apiResult1wa = await CancelPaymentCall.call(
                            paymentId: getJsonField(
                              widget.apiResult,
                              r'''$["paymentId"]''',
                            ).toString(),
                          );
                          context.safePop();

                          setState(() {});
                        },
                        text: 'Afbryd betaling',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x001E222B),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
