import '/flutter_flow/flutter_flow_util.dart';
import 'idcard_widget.dart' show IdcardWidget;
import 'package:flutter/material.dart';

class IdcardModel extends FlutterFlowModel<IdcardWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
