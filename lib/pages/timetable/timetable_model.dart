import '/flutter_flow/flutter_flow_util.dart';
import '/pages/no_class/no_class_widget.dart';
import 'timetable_widget.dart' show TimetableWidget;
import 'package:flutter/material.dart';

class TimetableModel extends FlutterFlowModel<TimetableWidget> {
  ///  Local state fields for this page.

  String? day = '';

  ///  State fields for stateful widgets in this page.

  // Model for no_class component.
  late NoClassModel noClassModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    noClassModel = createModel(context, () => NoClassModel());
  }

  @override
  void dispose() {
    noClassModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
