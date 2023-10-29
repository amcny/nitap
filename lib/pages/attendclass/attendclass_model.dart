import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'attendclass_widget.dart' show AttendclassWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AttendclassModel extends FlutterFlowModel<AttendclassWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for course widget.
  FocusNode? courseFocusNode;
  TextEditingController? courseController;
  String? Function(BuildContext, String?)? courseControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    courseFocusNode?.dispose();
    courseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
