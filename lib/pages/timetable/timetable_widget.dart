import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/no_class/no_class_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'timetable_model.dart';
export 'timetable_model.dart';

class TimetableWidget extends StatefulWidget {
  const TimetableWidget({super.key});

  @override
  State<TimetableWidget> createState() => _TimetableWidgetState();
}

class _TimetableWidgetState extends State<TimetableWidget>
    with TickerProviderStateMixin {
  late TimetableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimetableModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['containerOnPageLoadAnimation']!
          .controller
          .forward(from: 0.0);
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

    return StreamBuilder<List<TimetableRecord>>(
      stream: queryTimetableRecord(
        queryBuilder: (timetableRecord) => timetableRecord
            .where(
              'day',
              isEqualTo: _model.day != null && _model.day != ''
                  ? _model.day
                  : dateTimeFormat('EEEE', getCurrentTimestamp),
            )
            .where(
              'secname',
              isEqualTo: FFAppState().secname,
            ),
        singleRecord: true,
      ),
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
        List<TimetableRecord> timetableTimetableRecordList = snapshot.data!;
        final timetableTimetableRecord = timetableTimetableRecordList.isNotEmpty
            ? timetableTimetableRecordList.first
            : null;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Text(
                'Timetable',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final days = FFAppState().days.toList();
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children:
                                    List.generate(days.length, (daysIndex) {
                                  final daysItem = days[daysIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.day = daysItem;
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        setState(
                                            () => hasContainerTriggered = true);
                                        SchedulerBinding.instance
                                            .addPostFrameCallback((_) async =>
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0));
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 100),
                                      curve: Curves.linear,
                                      width: 60.0,
                                      height: 75.0,
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (_model.day == daysItem) {
                                            return FlutterFlowTheme.of(context)
                                                .primary;
                                          } else if (daysItem ==
                                              dateTimeFormat('EEEE',
                                                  getCurrentTimestamp)) {
                                            return FlutterFlowTheme.of(context)
                                                .success;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 8.0,
                                            color: () {
                                              if (_model.day == daysItem) {
                                                return const Color(0x321A73E8);
                                              } else if (daysItem ==
                                                  dateTimeFormat('EEEE',
                                                      getCurrentTimestamp)) {
                                                return const Color(0x3204A24C);
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent3;
                                              }
                                            }(),
                                            offset: const Offset(0.0, 5.0),
                                            spreadRadius: 1.0,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        border: Border.all(
                                          color: const Color(0x67616161),
                                          width: 0.2,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            daysItem.maybeHandleOverflow(
                                                maxChars: 3),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: () {
                                                    if (_model.day ==
                                                        daysItem) {
                                                      return Colors.white;
                                                    } else if (daysItem ==
                                                        dateTimeFormat('EEEE',
                                                            getCurrentTimestamp)) {
                                                      return Colors.white;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                        if (getRemoteConfigBool('ad'))
                          const Align(
                            alignment: AlignmentDirectional(0.0, 0.97),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 10.0, 5.0, 10.0),
                              child: FlutterFlowAdBanner(
                                height: 60.0,
                                showsTestAd: false,
                                iOSAdUnitID:
                                    'ca-app-pub-3991707481593664/6921520622',
                                androidAdUnitID:
                                    'ca-app-pub-3991707481593664/3272729973',
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        timetableTimetableRecord?.day,
                                        'day',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Course',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Instructor',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Time',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]
                                        .divide(const SizedBox(width: 20.0))
                                        .around(const SizedBox(width: 20.0)),
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.5,
                                  indent: 5.0,
                                  endIndent: 5.0,
                                  color: Color(0x67616161),
                                ),
                                Builder(
                                  builder: (context) {
                                    final data = timetableTimetableRecord?.data
                                            .toList() ??
                                        [];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(data.length,
                                          (dataIndex) {
                                        final dataItem = data[dataIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 25.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      dataItem.course,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        dataItem.instructor,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        dataItem.start,
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                      Text(
                                                        dataItem.end,
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .divide(const SizedBox(width: 20.0))
                                                .around(const SizedBox(width: 20.0)),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                              .animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!)
                              .animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation']!,
                                  hasBeenTriggered: hasContainerTriggered),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                  if ((dateTimeFormat('EEEE', getCurrentTimestamp) ==
                          'Saturday') ||
                      (dateTimeFormat('EEEE', getCurrentTimestamp) == 'Sunday'))
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.noClassModel,
                            updateCallback: () => setState(() {}),
                            child: const NoClassWidget(),
                          ),
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 24.0,
                                  borderWidth: 1.0,
                                  buttonSize: 65.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: const Icon(
                                    FFIcons.kttFilled,
                                    color: Colors.white,
                                    size: 26.0,
                                  ),
                                  onPressed: () async {
                                    HapticFeedback.selectionClick();

                                    context.pushNamed(
                                      'Timetable_Pop',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.bottomToTop,
                                          duration: Duration(milliseconds: 265),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ].addToStart(const SizedBox(height: 50.0)),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
