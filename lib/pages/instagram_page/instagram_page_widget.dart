import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'instagram_page_model.dart';
export 'instagram_page_model.dart';

class InstagramPageWidget extends StatefulWidget {
  const InstagramPageWidget({Key? key}) : super(key: key);

  @override
  _InstagramPageWidgetState createState() => _InstagramPageWidgetState();
}

class _InstagramPageWidgetState extends State<InstagramPageWidget> {
  late InstagramPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstagramPageModel());

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).secondary,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Instagram',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 18.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowWebView(
                  content:
                      '<!-- Place <div> tag where you want the feed to appear -->\n<div id=\"curator-feed-default-feed-layout\"><a href=\"https://curator.io\" target=\"_blank\" class=\"crt-logo crt-tag\">Powered by Curator.io</a></div>\n\n<!-- The Javascript can be moved to the end of the html page before the </body> tag -->\n<script type=\"text/javascript\">\n/* curator-feed-default-feed-layout */\n(function(){\nvar i,e,d=document,s=\"script\";i=d.createElement(\"script\");i.async=1;i.charset=\"UTF-8\";\ni.src=\"https://cdn.curator.io/published/66bef0b8-a238-45ab-9951-51ccb4b07df8.js\";\ne=d.getElementsByTagName(s)[0];e.parentNode.insertBefore(i, e);\n})();\n</script>',
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                  html: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
