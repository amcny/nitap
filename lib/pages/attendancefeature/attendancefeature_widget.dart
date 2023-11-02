import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/attendance/attendance_widget.dart';
import '/pages/attendclass/attendclass_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'attendancefeature_model.dart';
export 'attendancefeature_model.dart';

class AttendancefeatureWidget extends StatefulWidget {
  const AttendancefeatureWidget({Key? key}) : super(key: key);

  @override
  _AttendancefeatureWidgetState createState() =>
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () async {
            await showAlignedDialog(
              context: context,
              isGlobal: true,
              avoidOverflow: false,
              targetAnchor: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              followerAnchor: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              builder: (dialogContext) {
                return Material(
                  color: Colors.transparent,
                  child: WebViewAware(
                      child: Container(
                    height: 245.0,
                    width: 345.0,
                    child: AttendanceWidget(),
                  )),
                );
              },
            ).then((value) => setState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 3.0,
          child: Icon(
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
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: StreamBuilder<List<AttendanceRecord>>(
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
              return Center(
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: SpinKitThreeBounce(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                ),
              );
            }
            List<AttendanceRecord> dataTableAttendanceRecordList =
                snapshot.data!;
            if (dataTableAttendanceRecordList.isEmpty) {
              return Center(
                child: Image.asset(
                  'assets/images/dot.png',
                  width: 200.0,
                  fit: BoxFit.contain,
                ),
              );
            }
            return DataTable2(
              columns: [
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: Text(
                      'Course Name',
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ),
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: Text(
                      'Classes Missed',
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ),
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: Text(
                      'Edit/Delete',
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ),
              ],
              rows: dataTableAttendanceRecordList
                  .mapIndexed((dataTableIndex, dataTableAttendanceRecord) => [
                        Text(
                          dataTableAttendanceRecord.courseName,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          valueOrDefault<String>(
                            dataTableAttendanceRecord.noClasses.toString(),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showAlignedDialog(
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: WebViewAware(
                                            child: Container(
                                          height: 245.0,
                                          width: 345.0,
                                          child: AttendclassWidget(
                                            classref: dataTableAttendanceRecord
                                                .reference,
                                          ),
                                        )),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Icon(
                                  Icons.edit_calendar_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await dataTableAttendanceRecord.reference
                                    .delete();
                              },
                              child: Icon(
                                Icons.delete_sweep_outlined,
                                color: FlutterFlowTheme.of(context).error,
                                size: 24.0,
                              ),
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                      ].map((c) => DataCell(c)).toList())
                  .map((e) => DataRow(cells: e))
                  .toList(),
              headingRowColor: MaterialStateProperty.all(
                FlutterFlowTheme.of(context).secondaryBackground,
              ),
              headingRowHeight: 56.0,
              dataRowColor: MaterialStateProperty.all(
                FlutterFlowTheme.of(context).secondaryBackground,
              ),
              dataRowHeight: 56.0,
              border: TableBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              dividerThickness: 1.0,
              columnSpacing: 40.0,
              showBottomBorder: true,
              minWidth: 49.0,
            );
          },
        ),
      ),
    );
  }
}
