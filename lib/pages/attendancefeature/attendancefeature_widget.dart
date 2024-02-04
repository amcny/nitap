import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/attendance/attendance_widget.dart';
import '/pages/attendclass/attendclass_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'attendancefeature_model.dart';
export 'attendancefeature_model.dart';

class AttendancefeatureWidget extends StatefulWidget {
  const AttendancefeatureWidget({super.key});

  @override
  State<AttendancefeatureWidget> createState() =>
      _AttendancefeatureWidgetState();
}

class _AttendancefeatureWidgetState extends State<AttendancefeatureWidget> {
  late AttendancefeatureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttendancefeatureModel());

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

    return StreamBuilder<List<AttendanceRecord>>(
      stream: queryAttendanceRecord(
        queryBuilder: (attendanceRecord) => attendanceRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .orderBy('created_time'),
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
        List<AttendanceRecord> attendancefeatureAttendanceRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0.0, -0.2)
                          .resolve(Directionality.of(context)),
                      child: const AttendanceWidget(),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 3.0,
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).appbar,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Attendance',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Builder(
              builder: (context) {
                final table1 = attendancefeatureAttendanceRecordList.toList();
                if (table1.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'assets/images/image.png',
                      width: 300.0,
                      fit: BoxFit.contain,
                    ),
                  );
                }
                return FlutterFlowDataTable<AttendanceRecord>(
                  controller: _model.paginatedDataTableController,
                  data: table1,
                  columnsBuilder: (onSortChanged) => [
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: AutoSizeText(
                          'Course Name',
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                      ),
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: AutoSizeText(
                          'Classes Missed',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                      ),
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: AutoSizeText(
                          'Edit/Delete',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                      ),
                    ),
                  ],
                  dataRowBuilder:
                      (table1Item, table1Index, selected, onSelectChanged) =>
                          DataRow(
                    color: MaterialStateProperty.all(
                      table1Index % 2 == 0
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    cells: [
                      Text(
                        table1Item.courseName,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Text(
                        table1Item.noClasses.toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) => FlutterFlowIconButton(
                              borderRadius: 0.0,
                              borderWidth: 0.0,
                              buttonSize: 46.0,
                              icon: Icon(
                                FFIcons.kadd,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, -0.2)
                                          .resolve(Directionality.of(context)),
                                      child: AttendclassWidget(
                                        classref: table1Item.reference,
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 0.0,
                            borderWidth: 0.0,
                            buttonSize: 46.0,
                            icon: Icon(
                              FFIcons.kdelete,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () async {
                              await table1Item.reference.delete();
                            },
                          ),
                        ],
                      ),
                    ].map((c) => DataCell(c)).toList(),
                  ),
                  emptyBuilder: () => Center(
                    child: Image.asset(
                      'assets/images/image.png',
                      width: 300.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  paginated: false,
                  selectable: false,
                  headingRowHeight: 56.0,
                  dataRowHeight: 56.0,
                  headingRowColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(0.0),
                  addHorizontalDivider: false,
                  addVerticalDivider: false,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
