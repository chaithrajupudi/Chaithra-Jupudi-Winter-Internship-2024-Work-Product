import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'confirmation_model.dart';
export 'confirmation_model.dart';

class ConfirmationWidget extends StatefulWidget {
  const ConfirmationWidget({super.key});

  @override
  State<ConfirmationWidget> createState() => _ConfirmationWidgetState();
}

class _ConfirmationWidgetState extends State<ConfirmationWidget>
    with TickerProviderStateMixin {
  late ConfirmationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmationModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.5, 1.5),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'd6s5oplf' /* Booking confirmation */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22,
                  letterSpacing: 0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0xFF0F9D58),
                              size: 180,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'ucz8yeup' /* Expected Delievery Date: */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F9D58),
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                functions.deliveryDate(),
                                '13 June, 2024',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F9D58),
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('Home');
                                },
                                text: FFLocalizations.of(context).getText(
                                  '6uyx8zay' /* Go back to home */,
                                ),
                                icon: Icon(
                                  Icons.home,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: Color(0xFFF4B400),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 69),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          fillColor: FlutterFlowTheme.of(context).primaryText,
                          icon: Icon(
                            Icons.mic,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24,
                          ),
                          onPressed: () async {
                            FFAppState().isTextTranscribed = true;
                            setState(() {});
                            await actions.speechToText2();
                            await Future.delayed(
                                const Duration(milliseconds: 6000));
                            FFAppState().isTextTranscribed = false;
                            setState(() {});
                            _model.apiResult = await UIActionTextCall.call(
                              transcribedText: FFAppState().transcribedText,
                            );
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('API result'),
                                  content:
                                      Text((_model.apiResult?.bodyText ?? '')),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if ((UIActionTextCall.action(
                                      (_model.apiResult?.jsonBody ?? ''),
                                    ) ==
                                    'go') &&
                                (UIActionTextCall.screen(
                                      (_model.apiResult?.jsonBody ?? ''),
                                    ) ==
                                    'home')) {
                              context.pushNamed('HomePage');
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Please repeat'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            FFAppState().transcribedText = 'Listening...';
                            setState(() {});

                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                if (FFAppState().isTextTranscribed)
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(
                                0,
                                2,
                              ),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Icon(
                                Icons.mic,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 40,
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Text(
                                FFAppState().transcribedText,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
