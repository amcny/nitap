import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'deptlist_widget.dart' show DeptlistWidget;
import 'package:flutter/material.dart';

class DeptlistModel extends FlutterFlowModel<DeptlistWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearFacultyCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
