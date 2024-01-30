import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'attendance_widget.dart' show AttendanceWidget;
import 'package:flutter/material.dart';

class AttendanceModel extends FlutterFlowModel<AttendanceWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for course widget.
  FocusNode? courseFocusNode;
  TextEditingController? courseController;
  String? Function(BuildContext, String?)? courseControllerValidator;
  String? _courseControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AttendanceRecord? addedClasses;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    courseControllerValidator = _courseControllerValidator;
  }

  @override
  void dispose() {
    courseFocusNode?.dispose();
    courseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
