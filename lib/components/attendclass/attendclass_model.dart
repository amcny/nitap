import '/flutter_flow/flutter_flow_util.dart';
import 'attendclass_widget.dart' show AttendclassWidget;
import 'package:flutter/material.dart';

class AttendclassModel extends FlutterFlowModel<AttendclassWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberController;
  String? Function(BuildContext, String?)? numberControllerValidator;
  String? _numberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    numberControllerValidator = _numberControllerValidator;
  }

  @override
  void dispose() {
    numberFocusNode?.dispose();
    numberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
