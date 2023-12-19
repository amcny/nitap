import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'foryouinfo_model.dart';
export 'foryouinfo_model.dart';

class ForyouinfoWidget extends StatefulWidget {
  const ForyouinfoWidget({
    super.key,
    required this.pass,
  });

  final DocumentReference? pass;

  @override
  _ForyouinfoWidgetState createState() => _ForyouinfoWidgetState();
}

class _ForyouinfoWidgetState extends State<ForyouinfoWidget> {
  late ForyouinfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForyouinfoModel());

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

    return StreamBuilder<ForyouRecord>(
      stream: ForyouRecord.getDocument(widget.pass!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
              ),
            ),
          );
        }
        final foryouinfoForyouRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 375.0,
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: CachedNetworkImage(
                                                  fadeInDuration:
                                                      const Duration(milliseconds: 0),
                                                  fadeOutDuration:
                                                      const Duration(milliseconds: 0),
                                                  imageUrl:
                                                      foryouinfoForyouRecord
                                                          .image,
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: foryouinfoForyouRecord
                                                    .image,
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: foryouinfoForyouRecord.image,
                                          transitionOnUserGestures: true,
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 0),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 0),
                                            imageUrl:
                                                foryouinfoForyouRecord.image,
                                            width: double.infinity,
                                            height: 375.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                    sigmaX: 20.0,
                                                    sigmaY: 20.0,
                                                  ),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 75.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0x1A101010),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 75.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0x06FFFFFF),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              foryouinfoForyouRecord
                                                                  .title,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SelectionArea(
                                            child: Text(
                                          foryouinfoForyouRecord.description,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ].addToEnd(const SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Visibility(
                            visible: foryouinfoForyouRecord.url != '',
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await launchURL(foryouinfoForyouRecord.url);
                                },
                                text: 'Open Link',
                                icon: const Icon(
                                  Icons.open_in_new_rounded,
                                  size: 24.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 55.0,
                                  padding: const EdgeInsets.all(0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 45.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            fillColor: const Color(0x72757575),
                            icon: const Icon(
                              Icons.chevron_left_rounded,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
