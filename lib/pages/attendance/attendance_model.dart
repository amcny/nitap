import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'attendance_widget.dart' show AttendanceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {
    courseControllerValidator = _courseControllerValidator;
  }

  void dispose() {
    courseFocusNode?.dispose();
    courseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
