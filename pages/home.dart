import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.translate_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            onPressed: () async {
                              context.pushNamed('Cart');
                            },
                          ),
                        ].divide(SizedBox(width: 20)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Icon(
                                Icons.search_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onFieldSubmitted: (_) async {
                                    _model.searchResults =
                                        await SearchCall.call(
                                      product: _model.textController.text,
                                    );

                                    context.pushNamed(
                                      'results',
                                      queryParameters: {
                                        'searchList': serializeParam(
                                          ((_model.searchResults?.jsonBody ??
                                                          '')
                                                      .toList()
                                                      .map<ItemStruct?>(
                                                          ItemStruct.maybeFromMap)
                                                      .toList()
                                                  as Iterable<ItemStruct?>)
                                              .withoutNulls,
                                          ParamType.DataStruct,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                    );

                                    setState(() {});
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '2me1jbtx' /* Search for products and brands */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20,
                              borderWidth: 1,
                              buttonSize: 40,
                              icon: Icon(
                                Icons.mic,
                                color: FlutterFlowTheme.of(context).primaryText,
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
                                      content: Text(
                                          (_model.apiResult?.bodyText ?? '')),
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
                                    if (UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        ) !=
                                        null) {
                                      FFAppState().updateItemsAtIndex(
                                        UIActionTextCall.productIndex(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        )!,
                                        (e) => e
                                          ..isInCart = true
                                          ..quantity =
                                              UIActionTextCall.quantitiy(
                                            (_model.apiResult?.jsonBody ?? ''),
                                          ),
                                      );
                                      setState(() {});
                                    } else if (UIActionTextCall.product(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            ) !=
                                            null &&
                                        UIActionTextCall.product(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            ) !=
                                            '') {
                                      _model.index =
                                          await actions.getProductIndex(
                                        UIActionTextCall.product(
                                          (_model.apiResult?.jsonBody ?? ''),
                                        ),
                                      );
                                      FFAppState().updateItemsAtIndex(
                                        _model.index!,
                                        (e) => e
                                          ..isInCart = true
                                          ..quantity =
                                              UIActionTextCall.quantitiy(
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
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
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
                                              'Item added to cart successfully'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else if ((UIActionTextCall.container(
                                            (_model.apiResult?.jsonBody ?? ''),
                                          ) ==
                                          'wishlist') ||
                                      (UIActionTextCall.container(
                                            (_model.apiResult?.jsonBody ?? ''),
                                          ) ==
                                          'wish list')) {
                                    if (UIActionTextCall.productIndex(
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
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            ) !=
                                            null &&
                                        UIActionTextCall.product(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            ) !=
                                            '') {
                                      _model.index2 =
                                          await actions.getProductIndex(
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
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
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
                                    } else if (UIActionTextCall.product(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            ) !=
                                            null &&
                                        UIActionTextCall.product(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            ) !=
                                            '') {
                                      _model.index3 =
                                          await actions.getProductIndex(
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
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    FFAppState().transcribedText =
                                        'What do you want to buy today?';
                                    setState(() {});
                                  } else if ((UIActionTextCall.container(
                                            (_model.apiResult?.jsonBody ?? ''),
                                          ) ==
                                          'wishlist') ||
                                      (UIActionTextCall.container(
                                            (_model.apiResult?.jsonBody ?? ''),
                                          ) ==
                                          'wish list')) {
                                    if (UIActionTextCall.productIndex(
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
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            ) !=
                                            null &&
                                        UIActionTextCall.product(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            ) !=
                                            '') {
                                      _model.index4 =
                                          await actions.getProductIndex(
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
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
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
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Please repeat'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
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
                                    'open') {
                                  context.pushNamed(
                                    'Details',
                                    queryParameters: {
                                      'image': serializeParam(
                                        FFAppState()
                                            .items[
                                                UIActionTextCall.productIndex(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            )!]
                                            .image,
                                        ParamType.String,
                                      ),
                                      'name': serializeParam(
                                        FFAppState()
                                            .items[
                                                UIActionTextCall.productIndex(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            )!]
                                            .name,
                                        ParamType.String,
                                      ),
                                      'price': serializeParam(
                                        FFAppState()
                                            .items[
                                                UIActionTextCall.productIndex(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            )!]
                                            .price,
                                        ParamType.double,
                                      ),
                                      'description': serializeParam(
                                        FFAppState()
                                            .items[
                                                UIActionTextCall.productIndex(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            )!]
                                            .description,
                                        ParamType.String,
                                      ),
                                      'isFavorite': serializeParam(
                                        FFAppState()
                                            .items[
                                                UIActionTextCall.productIndex(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            )!]
                                            .isFavorite,
                                        ParamType.bool,
                                      ),
                                      'isInCart': serializeParam(
                                        FFAppState()
                                            .items[
                                                UIActionTextCall.productIndex(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            )!]
                                            .isInCart,
                                        ParamType.bool,
                                      ),
                                      'index': serializeParam(
                                        FFAppState()
                                            .items[
                                                UIActionTextCall.productIndex(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            )!]
                                            .index,
                                        ParamType.int,
                                      ),
                                      'quantity': serializeParam(
                                        FFAppState()
                                            .items[
                                                UIActionTextCall.productIndex(
                                              (_model.apiResult?.jsonBody ??
                                                  ''),
                                            )!]
                                            .quantity,
                                        ParamType.int,
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
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                FFAppState().transcribedText =
                                    'What do you want to buy today?';
                                setState(() {});

                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Builder(
                          builder: (context) {
                            final categories = FFAppState().categories.toList();
                            return Wrap(
                              spacing: 30,
                              runSpacing: 10,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(categories.length,
                                  (categoriesIndex) {
                                final categoriesItem =
                                    categories[categoriesIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(75),
                                      child: Image.network(
                                        categoriesItem.image,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Text(
                                        categoriesItem.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 12,
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ],
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
