import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'wishlist_model.dart';
export 'wishlist_model.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({super.key});

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget>
    with TickerProviderStateMixin {
  late WishlistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WishlistModel());

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
              'afw2gi5o' /* Wishlist */,
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _model.columnController,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Builder(
                      builder: (context) {
                        final items = FFAppState()
                            .items
                            .where((e) => e.isFavorite)
                            .toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: items.length,
                          itemBuilder: (context, itemsIndex) {
                            final itemsItem = items[itemsIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Color(0x411D2429),
                                      offset: Offset(
                                        0.0,
                                        1,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 1, 1, 1),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.network(
                                            itemsItem.image,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 4, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 170,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  itemsItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 20,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            icon: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20,
                                            ),
                                            onPressed: () async {
                                              FFAppState().updateItemsAtIndex(
                                                itemsItem.index,
                                                (e) => e..isFavorite = false,
                                              );
                                              setState(() {});
                                            },
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '2ytthx2i' /* ₹  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 4, 8),
                                                child: Text(
                                                  itemsItem.price.toString(),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
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
                ],
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
            Align(
              alignment: AlignmentDirectional(1, 1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 48),
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
                    await Future.delayed(const Duration(milliseconds: 6000));
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
                          'wishlist') {
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
                          _model.listViewController!.position.maxScrollExtent,
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
          ],
        ),
      ),
    );
  }
}
