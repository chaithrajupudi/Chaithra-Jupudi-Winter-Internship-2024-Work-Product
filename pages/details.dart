import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'details_model.dart';
export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.isFavorite,
    required this.isInCart,
    required this.index,
    required this.quantity,
  });

  final String? image;
  final String? name;
  final double? price;
  final String? description;
  final bool? isFavorite;
  final bool? isInCart;
  final int? index;
  final int? quantity;

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget>
    with TickerProviderStateMixin {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _model.scrollingColumn,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 1270,
                              ),
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: Wrap(
                                  spacing: 16,
                                  runSpacing: 16,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.center,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 570,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 330,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(4),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  widget.image!,
                                                  width: 300,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              widget.name,
                                              'Item',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'yjx399dt' /* ₹ */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  widget.price?.toString(),
                                                  '10',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              widget.description,
                                              'description',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 12)),
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
                  Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                      child: FlutterFlowIconButton(
                        borderRadius: 20,
                        borderWidth: 1,
                        buttonSize: 40,
                        fillColor: FlutterFlowTheme.of(context).primaryText,
                        icon: Icon(
                          Icons.mic,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                          if (UIActionTextCall.action(
                                (_model.apiResult?.jsonBody ?? ''),
                              ) ==
                              'add') {
                            if (UIActionTextCall.container(
                                  (_model.apiResult?.jsonBody ?? ''),
                                ) ==
                                'cart') {
                              if (UIActionTextCall.product(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) ==
                                  'this') {
                                FFAppState().updateItemsAtIndex(
                                  widget.index!,
                                  (e) => e
                                    ..isInCart = true
                                    ..quantity = UIActionTextCall.quantitiy(
                                      (_model.apiResult?.jsonBody ?? ''),
                                    ),
                                );
                                setState(() {});
                              } else if (UIActionTextCall.productIndex(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) !=
                                  null) {
                                FFAppState().updateItemsAtIndex(
                                  UIActionTextCall.productIndex(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  )!,
                                  (e) => e
                                    ..isInCart = true
                                    ..quantity = UIActionTextCall.quantitiy(
                                      (_model.apiResult?.jsonBody ?? ''),
                                    ),
                                );
                                setState(() {});
                              } else if (UIActionTextCall.product(
                                        (_model.apiResult?.jsonBody ?? ''),
                                      ) !=
                                      null &&
                                  UIActionTextCall.product(
                                        (_model.apiResult?.jsonBody ?? ''),
                                      ) !=
                                      '') {
                                _model.index = await actions.getProductIndex(
                                  UIActionTextCall.product(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ),
                                );
                                FFAppState().updateItemsAtIndex(
                                  _model.index!,
                                  (e) => e
                                    ..isInCart = true
                                    ..quantity = UIActionTextCall.quantitiy(
                                      (_model.apiResult?.jsonBody ?? ''),
                                    ),
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
                                    content:
                                        Text('Item added to cart successfully'),
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
                            } else if (UIActionTextCall.container(
                                  (_model.apiResult?.jsonBody ?? ''),
                                ) ==
                                'wishlist') {
                              if (UIActionTextCall.product(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) ==
                                  'this') {
                                FFAppState().updateItemsAtIndex(
                                  widget.index!,
                                  (e) => e..isFavorite = true,
                                );
                                setState(() {});
                              } else if (UIActionTextCall.productIndex(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) !=
                                  null) {
                                FFAppState().updateItemsAtIndex(
                                  UIActionTextCall.productIndex(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  )!,
                                  (e) => e..isFavorite = true,
                                );
                                setState(() {});
                              } else if (UIActionTextCall.product(
                                        (_model.apiResult?.jsonBody ?? ''),
                                      ) !=
                                      null &&
                                  UIActionTextCall.product(
                                        (_model.apiResult?.jsonBody ?? ''),
                                      ) !=
                                      '') {
                                _model.index2 = await actions.getProductIndex(
                                  UIActionTextCall.product(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ),
                                );
                                FFAppState().updateItemsAtIndex(
                                  _model.index2!,
                                  (e) => e..isFavorite = true,
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
                                        'Item added to wishlist successfully'),
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
                              'remove') {
                            if (UIActionTextCall.container(
                                  (_model.apiResult?.jsonBody ?? ''),
                                ) ==
                                'cart') {
                              if (UIActionTextCall.product(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) ==
                                  'this') {
                                FFAppState().updateItemsAtIndex(
                                  widget.index!,
                                  (e) => e
                                    ..isInCart = false
                                    ..quantity = 0,
                                );
                                setState(() {});
                              } else if (UIActionTextCall.productIndex(
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
                              } else if (UIActionTextCall.product(
                                        (_model.apiResult?.jsonBody ?? ''),
                                      ) !=
                                      null &&
                                  UIActionTextCall.product(
                                        (_model.apiResult?.jsonBody ?? ''),
                                      ) !=
                                      '') {
                                _model.index3 = await actions.getProductIndex(
                                  UIActionTextCall.product(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ),
                                );
                                FFAppState().updateItemsAtIndex(
                                  _model.index3!,
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
                            } else if (UIActionTextCall.product(
                                  (_model.apiResult?.jsonBody ?? ''),
                                ) ==
                                'wishlist') {
                              if (UIActionTextCall.product(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) ==
                                  'this') {
                                FFAppState().updateItemsAtIndex(
                                  widget.index!,
                                  (e) => e..isFavorite = false,
                                );
                                setState(() {});
                              } else if (UIActionTextCall.productIndex(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ) !=
                                  null) {
                                FFAppState().updateItemsAtIndex(
                                  UIActionTextCall.productIndex(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  )!,
                                  (e) => e..isFavorite = false,
                                );
                                setState(() {});
                              } else if (UIActionTextCall.product(
                                        (_model.apiResult?.jsonBody ?? ''),
                                      ) !=
                                      null &&
                                  UIActionTextCall.product(
                                        (_model.apiResult?.jsonBody ?? ''),
                                      ) !=
                                      '') {
                                _model.index4 = await actions.getProductIndex(
                                  UIActionTextCall.product(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  ),
                                );
                                FFAppState().updateItemsAtIndex(
                                  _model.index4!,
                                  (e) => e..isFavorite = false,
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
                                        'Item removed from wishlist successfully'),
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
                              await _model.scrollingColumn?.animateTo(
                                0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            } else if (UIActionTextCall.direction(
                                  (_model.apiResult?.jsonBody ?? ''),
                                ) ==
                                'down') {
                              await _model.scrollingColumn?.animateTo(
                                _model
                                    .scrollingColumn!.position.maxScrollExtent,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(13, 0, 13, 13),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            if (FFAppState().items[widget.index!].isFavorite) {
                              return FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().updateItemsAtIndex(
                                    widget.index!,
                                    (e) => e..isFavorite = false,
                                  );
                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'plgkubqe' /* Wishlisted */,
                                ),
                                icon: Icon(
                                  Icons.favorite,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 180,
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
                              );
                            } else {
                              return FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().updateItemsAtIndex(
                                    widget.index!,
                                    (e) => e..isFavorite = true,
                                  );
                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  '62rupudp' /* Wishlist */,
                                ),
                                icon: Icon(
                                  Icons.favorite_border,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 180,
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
                              );
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (FFAppState().items[widget.index!].isInCart) {
                              return FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().updateItemsAtIndex(
                                    widget.index!,
                                    (e) => e..isInCart = false,
                                  );
                                  setState(() {});
                                  FFAppState().updateItemsAtIndex(
                                    widget.index!,
                                    (e) => e..quantity = 0,
                                  );
                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  '4cz89lw5' /* Added to cart */,
                                ),
                                icon: Icon(
                                  Icons.shopping_cart_sharp,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 180,
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
                              );
                            } else {
                              return FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().updateItemsAtIndex(
                                    widget.index!,
                                    (e) => e..isInCart = true,
                                  );
                                  setState(() {});
                                  FFAppState().updateItemsAtIndex(
                                    widget.index!,
                                    (e) => e..quantity = 1,
                                  );
                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'iepz57zb' /* Add to cart */,
                                ),
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 180,
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
                              );
                            }
                          },
                        ),
                      ],
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
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
    );
  }
}
