import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'facultypage_widget.dart' show FacultypageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FacultypageModel extends FlutterFlowModel<FacultypageWidget> {
  /// Query cache managers for this widget.

  final _facultyManager = StreamRequestManager<List<FacultyRecord>>();
  Stream<List<FacultyRecord>> faculty({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<FacultyRecord>> Function() requestFn,
  }) =>
      _facultyManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFacultyCache() => _facultyManager.clear();
  void clearFacultyCacheKey(String? uniqueKey) =>
      _facultyManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearFacultyCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
