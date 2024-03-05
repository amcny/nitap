import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/attendancesub/attendancesub_widget.dart';
import '/components/attendclass/attendclass_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'attendance_model.dart';
export 'attendance_model.dart';

class AttendanceWidget extends StatefulWidget {
  const AttendanceWidget({super.key});

  @override
  State<AttendanceWidget> createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  late AttendanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttendanceModel());

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
        List<AttendanceRecord> attendanceAttendanceRecordList = snapshot.data!;
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
                      child: const AttendancesubWidget(),
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
                final table1 = attendanceAttendanceRecordList.toList();
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
                          ? FlutterFlowTheme.of(context).bwgrey
                          : FlutterFlowTheme.of(context).bwgrey,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
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
                              child: Icon(
                                FFIcons.kedit,
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
                              await table1Item.reference.delete();
                            },
                            child: Icon(
                              FFIcons.kdelete,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
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
                  headingRowColor: FlutterFlowTheme.of(context).appbar,
                  borderRadius: BorderRadius.circular(0.0),
                  addHorizontalDivider: false,
                  addTopAndBottomDivider: false,
                  hideDefaultHorizontalDivider: false,
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
