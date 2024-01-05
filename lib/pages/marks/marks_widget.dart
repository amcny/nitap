import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/marksno/marksno_widget.dart';
import '/pages/markssub/markssub_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'marks_model.dart';
export 'marks_model.dart';

class MarksWidget extends StatefulWidget {
  const MarksWidget({super.key});

  @override
  _MarksWidgetState createState() => _MarksWidgetState();
}

class _MarksWidgetState extends State<MarksWidget> {
  late MarksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarksModel());

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: const AlignmentDirectional(0.0, -0.2)
                        .resolve(Directionality.of(context)),
                    child: GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: const MarkssubWidget(),
                    ),
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
            'Marks',
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
          child: StreamBuilder<List<MarksRecord>>(
            stream: queryMarksRecord(
              queryBuilder: (marksRecord) => marksRecord
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
              List<MarksRecord> dataTableMarksRecordList = snapshot.data!;
              if (dataTableMarksRecordList.isEmpty) {
                return Center(
                  child: Image.asset(
                    'assets/images/image.png',
                    width: 270.0,
                    fit: BoxFit.contain,
                  ),
                );
              }
              return DataTable2(
                columns: [
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: AutoSizeText(
                        'Course\nName',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        'Min-1',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        'MID',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        'Min-2',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        'END',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: AutoSizeText(
                        'Edit/Delete',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ),
                ],
                rows: dataTableMarksRecordList
                    .mapIndexed((dataTableIndex, dataTableMarksRecord) => [
                          Text(
                            dataTableMarksRecord.courseName,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            dataTableMarksRecord.minor1,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            dataTableMarksRecord.mid,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            dataTableMarksRecord.minor2,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            dataTableMarksRecord.end,
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
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, -0.2)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: MarksnoWidget(
                                              marksref: dataTableMarksRecord
                                                  .reference,
                                            ),
                                          ),
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
                                  await dataTableMarksRecord.reference.delete();
                                },
                                child: Icon(
                                  Icons.delete_sweep_outlined,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                        ].map((c) => DataCell(c)).toList())
                    .map((e) => DataRow(cells: e))
                    .toList(),
                headingRowColor: MaterialStateProperty.all(
                  FlutterFlowTheme.of(context).primaryBackground,
                ),
                headingRowHeight: 58.0,
                dataRowColor: MaterialStateProperty.all(
                  FlutterFlowTheme.of(context).secondaryBackground,
                ),
                dataRowHeight: 56.0,
                border: TableBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                dividerThickness: 1.0,
                columnSpacing: 15.0,
                showBottomBorder: true,
                minWidth: 49.0,
              );
            },
          ),
        ),
      ),
    );
  }
}
