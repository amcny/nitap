import '/components/nodetails_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exam_widget.dart' show ExamWidget;
import 'package:flutter/material.dart';

class ExamModel extends FlutterFlowModel<ExamWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for nodetails component.
  late NodetailsModel nodetailsModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nodetailsModel = createModel(context, () => NodetailsModel());
  }

  @override
  void dispose() {
    nodetailsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
