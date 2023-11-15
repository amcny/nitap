import '/flutter_flow/flutter_flow_util.dart';
import 'manage_i_d_card_widget.dart' show ManageIDCardWidget;
import 'package:flutter/material.dart';

class ManageIDCardModel extends FlutterFlowModel<ManageIDCardWidget> {
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
