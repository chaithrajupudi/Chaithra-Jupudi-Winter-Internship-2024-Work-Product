import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'payment_options_model.dart';
export 'payment_options_model.dart';

class PaymentOptionsWidget extends StatefulWidget {
  const PaymentOptionsWidget({
    super.key,
    required this.totalPrice,
  });

  final String? totalPrice;

  @override
  State<PaymentOptionsWidget> createState() => _PaymentOptionsWidgetState();
}

class _PaymentOptionsWidgetState extends State<PaymentOptionsWidget>
    with TickerProviderStateMixin {
  late PaymentOptionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentOptionsModel());

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F9F9),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'k07o6dnk' /* Total:  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'icw77p0q' /* ₹ */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.totalPrice,
                                          '1',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 5)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'i9m7wh0o' /* Payment Gateways */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.credit_card_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '4qmje5je' /* Credit card */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 10)),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('confirmation');

                                          await actions.updateCartStatus(
                                            FFAppState().items.toList(),
                                          );
                                        },
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.creditCard,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'y1o5luv0' /* Debit card */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 10)),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('confirmation');

                                          await actions.updateCartStatus(
                                            FFAppState().items.toList(),
                                          );
                                        },
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.desktop_mac_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'wldwleil' /* Net Banking */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 10)),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('confirmation');

                                          await actions.updateCartStatus(
                                            FFAppState().items.toList(),
                                          );
                                        },
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons
                                                .account_balance_wallet_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'sai7zauh' /* Gateway wallet */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 10)),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('confirmation');

                                          await actions.updateCartStatus(
                                            FFAppState().items.toList(),
                                          );
                                        },
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.sensor_occupied,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'y1kiqlv6' /* UPI */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 10)),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('confirmation');

                                          await actions.updateCartStatus(
                                            FFAppState().items.toList(),
                                          );
                                        },
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 20)),
                          ),
                        ),
                      ],
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
                            FFAppState().transcribedText =
                                'What payment method do you want to use?';
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
                            if (UIActionTextCall.action(
                                  (_model.apiResult?.jsonBody ?? ''),
                                ) ==
                                'screen') {
                              if (UIActionTextCall.screen(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) ==
                                  'cart') {
                                context.pushNamed('Cart');
                              } else if (UIActionTextCall.screen(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) ==
                                  'wishlist') {
                                context.pushNamed('Wishlist');
                              } else if (UIActionTextCall.screen(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) ==
                                  'home') {
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
                            } else if (UIActionTextCall.action(
                                  (_model.apiResult?.jsonBody ?? ''),
                                ) ==
                                'go') {
                              if (UIActionTextCall.direction(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) ==
                                  'back') {
                                context.safePop();
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
                            } else if ((UIActionTextCall.action(
                                      (_model.apiResult?.jsonBody ?? ''),
                                    ) ==
                                    'payment') &&
                                ((UIActionTextCall.paymentMethod(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        ) ==
                                        'credit card') ||
                                    (UIActionTextCall.paymentMethod(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        ) ==
                                        'debit card') ||
                                    (UIActionTextCall.paymentMethod(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        ) ==
                                        'UPI') ||
                                    (UIActionTextCall.paymentMethod(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        ) ==
                                        'net banking') ||
                                    (UIActionTextCall.paymentMethod(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        ) ==
                                        'gateway wallet'))) {
                              context.pushNamed(
                                'Details',
                                queryParameters: {
                                  'image': serializeParam(
                                    FFAppState()
                                        .items[UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        )!]
                                        .image,
                                    ParamType.String,
                                  ),
                                  'name': serializeParam(
                                    FFAppState()
                                        .items[UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        )!]
                                        .name,
                                    ParamType.String,
                                  ),
                                  'price': serializeParam(
                                    FFAppState()
                                        .items[UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        )!]
                                        .price,
                                    ParamType.double,
                                  ),
                                  'description': serializeParam(
                                    FFAppState()
                                        .items[UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        )!]
                                        .description,
                                    ParamType.String,
                                  ),
                                  'isFavorite': serializeParam(
                                    FFAppState()
                                        .items[UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        )!]
                                        .isFavorite,
                                    ParamType.bool,
                                  ),
                                  'isInCart': serializeParam(
                                    FFAppState()
                                        .items[UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        )!]
                                        .isInCart,
                                    ParamType.bool,
                                  ),
                                  'index': serializeParam(
                                    FFAppState()
                                        .items[UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        )!]
                                        .index,
                                    ParamType.int,
                                  ),
                                  'quantity': serializeParam(
                                    FFAppState()
                                        .items[UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        )!]
                                        .quantity,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );

                              context.pushNamed('confirmation');
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
