import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            backgroundColor: FlutterFlowTheme.of(context).appbar,
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
            backgroundColor: FlutterFlowTheme.of(context).appbar,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).appbar,
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
              elevation: 0.45,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if ((dateTimeFormat('EEEE', getCurrentTimestamp) ==
                            'Saturday') ||
                        (dateTimeFormat('EEEE', getCurrentTimestamp) ==
                            'Sunday'))
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Choose a day to see the time table',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final days =
                              functions.generateFutureDates(5).toList();
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(days.length, (daysIndex) {
                              final daysItem = days[daysIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.day =
                                        dateTimeFormat('EEEE', daysItem);
                                  });
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation'] !=
                                      null) {
                                    setState(
                                        () => hasContainerTriggered = true);
                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'containerOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.linear,
                                  width: 60.0,
                                  height: 75.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (_model.day ==
                                          dateTimeFormat('EEEE', daysItem)) {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else if (dateTimeFormat(
                                              'EEEE', daysItem) ==
                                          dateTimeFormat(
                                              'EEEE', getCurrentTimestamp)) {
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
                                          if (_model.day ==
                                              dateTimeFormat(
                                                  'EEEE', daysItem)) {
                                            return const Color(0x4D1A73E8);
                                          } else if (dateTimeFormat(
                                                  'EEEE', daysItem) ==
                                              dateTimeFormat('EEEE',
                                                  getCurrentTimestamp)) {
                                            return const Color(0x4C2DB83D);
                                          } else {
                                            return const Color(0x0DFFFFFF);
                                          }
                                        }(),
                                        offset: const Offset(0.0, 2.0),
                                        spreadRadius: 1.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                      color: const Color(0x40616161),
                                      width: 0.2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        dateTimeFormat('dd', daysItem),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: () {
                                                if (_model.day ==
                                                    dateTimeFormat(
                                                        'EEEE', daysItem)) {
                                                  return Colors.white;
                                                } else if (dateTimeFormat(
                                                        'EEEE', daysItem) ==
                                                    dateTimeFormat('EEEE',
                                                        getCurrentTimestamp)) {
                                                  return Colors.white;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText;
                                                }
                                              }(),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Text(
                                        dateTimeFormat('EEEE', daysItem)
                                            .maybeHandleOverflow(maxChars: 3),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: () {
                                                if (_model.day ==
                                                    dateTimeFormat(
                                                        'EEEE', daysItem)) {
                                                  return Colors.white;
                                                } else if (dateTimeFormat(
                                                        'EEEE', daysItem) ==
                                                    dateTimeFormat('EEEE',
                                                        getCurrentTimestamp)) {
                                                  return Colors.white;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
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
                      const Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 0.0),
                        child: FlutterFlowAdBanner(
                          height: 60.0,
                          showsTestAd: false,
                          iOSAdUnitID: 'ca-app-pub-3991707481593664/6921520622',
                          androidAdUnitID:
                              'ca-app-pub-3991707481593664/3272729973',
                        ),
                      ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final data =
                              timetableTimetableRecord?.data.toList() ?? [];
                          if (data.isEmpty) {
                            return Center(
                              child: SvgPicture.asset(
                                'assets/images/tt_noclass.svg',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                fit: BoxFit.contain,
                              ),
                            );
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(data.length, (dataIndex) {
                              final dataItem = data[dataIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          dataItem.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 50.0,
                                              child: StyledVerticalDivider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                lineStyle:
                                                    DividerLineStyle.dotted,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          dataItem.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 3.0)),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 1.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 85.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 4.5,
                                                    height: double.infinity,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xA11A73E8),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  12.0,
                                                                  8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: Text(
                                                                dataItem.course
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 30,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                dataItem
                                                                    .instructor
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 33,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          15.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).addToEnd(const SizedBox(height: 20.0)),
                          );
                        },
                      ),
                    )
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!)
                        .animateOnActionTrigger(
                            animationsMap['containerOnActionTriggerAnimation']!,
                            hasBeenTriggered: hasContainerTriggered),
                  ],
                ),
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            ),
          ),
        );
      },
    );
  }
}
