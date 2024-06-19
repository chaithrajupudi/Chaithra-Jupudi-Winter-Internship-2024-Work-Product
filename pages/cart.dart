import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
export 'cart_model.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> with TickerProviderStateMixin {
  late CartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartModel());

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
          title: Text(
            FFLocalizations.of(context).getText(
              'v7ndzzqp' /* My Cart */,
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
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final items = FFAppState()
                                .items
                                .where((e) => e.isInCart)
                                .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: items.length,
                              itemBuilder: (context, itemsIndex) {
                                final itemsItem = items[itemsIndex];
                                return Visibility(
                                  visible: itemsItem.quantity > 0,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 16),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color: Color(0x44111417),
                                            offset: Offset(
                                              0.0,
                                              2,
                                            ),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  width: 2,
                                                ),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Image.network(
                                                  itemsItem.image,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      itemsItem.name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '2mgwfho7' /* Qty: */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderRadius: 20,
                                                          borderWidth: 1,
                                                          buttonSize: 40,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .minus,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 12,
                                                          ),
                                                          onPressed: () async {
                                                            FFAppState()
                                                                .updateItemsAtIndex(
                                                              itemsIndex,
                                                              (e) => e
                                                                ..incrementQuantity(
                                                                    -1),
                                                            );
                                                            setState(() {});
                                                            if (itemsItem
                                                                    .quantity ==
                                                                0) {
                                                              FFAppState()
                                                                  .updateItemsAtIndex(
                                                                itemsIndex,
                                                                (e) => e
                                                                  ..isInCart =
                                                                      false,
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              FFAppState()
                                                                  .updateItemsAtIndex(
                                                                itemsItem.index,
                                                                (e) => e
                                                                  ..incrementQuantity(
                                                                      -1),
                                                              );
                                                              setState(() {});
                                                            }
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            itemsItem.quantity
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  fontSize: 14,
                                                                  letterSpacing:
                                                                      0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderRadius: 20,
                                                          borderWidth: 1,
                                                          buttonSize: 40,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .plus,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 12,
                                                          ),
                                                          onPressed: () async {
                                                            FFAppState()
                                                                .updateItemsAtIndex(
                                                              itemsItem.index,
                                                              (e) => e
                                                                ..incrementQuantity(
                                                                    1),
                                                            );
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 20,
                                                  borderWidth: 1,
                                                  buttonSize: 40,
                                                  icon: Icon(
                                                    Icons.close_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24,
                                                  ),
                                                  onPressed: () async {
                                                    FFAppState()
                                                        .updateItemsAtIndex(
                                                      itemsItem.index,
                                                      (e) =>
                                                          e..isInCart = false,
                                                    );
                                                    setState(() {});
                                                  },
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'o5dik22r' /* ₹ */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                    Text(
                                                      itemsItem.price
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 50)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              controller: _model.listViewController,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F9F9),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'nryi4c27' /* Price breakup */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFAppState()
                                                      .items
                                                      .where((e) => e.isInCart)
                                                      .toList()
                                                      .length
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            Color(0xFFA9A9A9),
                                                        letterSpacing: 0,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6rpp61rd' /* Product(s) */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            Color(0xFFA9A9A9),
                                                        letterSpacing: 0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 3)),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 12)),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          's28txprs' /* Total MRP */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'i88eytq3' /* ₹ */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              functions.totalPrice(
                                                  FFAppState().items.toList()),
                                              '1',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'tq4i19af' /* Total */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'bszfdqai' /* ₹ */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 15,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.totalPrice(
                                                      FFAppState()
                                                          .items
                                                          .toList()),
                                                  '1',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 15,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'paymentOptions',
                                          queryParameters: {
                                            'totalPrice': serializeParam(
                                              functions.totalPrice(
                                                  FFAppState().items.toList()),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'uckqslac' /* Proceed */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 20,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 24, 0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: Color(0xFFF4B400),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontSize: 14,
                                              letterSpacing: 0,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 55),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: FlutterFlowTheme.of(context).primaryText,
                      icon: Icon(
                        Icons.mic,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                              content: Text((_model.apiResult?.bodyText ?? '')),
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
                            'remove') {
                          if (UIActionTextCall.container(
                                (_model.apiResult?.jsonBody ?? ''),
                              ) ==
                              'cart') {
                            if (UIActionTextCall.productIndex(
                                  (_model.apiResult?.jsonBody ?? ''),
                                ) !=
                                null) {
                              FFAppState().updateItemsAtIndex(
                                UIActionTextCall.productIndex(
                                  (_model.apiResult?.jsonBody ?? ''),
                                )!,
                                (e) => e
                                  ..isInCart = false
                                  ..quantity = 0,
                              );
                              setState(() {});
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

                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(
                                      'Item removed from cart successfully'),
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
                            FFAppState().transcribedText =
                                'What do you want to buy today?';
                            setState(() {});
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
                            'scroll') {
                          if (UIActionTextCall.direction(
                                (_model.apiResult?.jsonBody ?? ''),
                              ) ==
                              'up') {
                            await _model.listViewController?.animateTo(
                              0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else if (UIActionTextCall.direction(
                                (_model.apiResult?.jsonBody ?? ''),
                              ) ==
                              'down') {
                            await _model.listViewController?.animateTo(
                              _model
                                  .listViewController!.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text('please repeat'),
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
                        } else if (UIActionTextCall.action(
                              (_model.apiResult?.jsonBody ?? ''),
                            ) ==
                            'proceed') {
                          context.pushNamed(
                            'paymentOptions',
                            queryParameters: {
                              'totalPrice': serializeParam(
                                functions
                                    .totalPrice(FFAppState().items.toList()),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
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
