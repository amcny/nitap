import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'database_model.dart';
export 'database_model.dart';

class DatabaseWidget extends StatefulWidget {
  const DatabaseWidget({super.key});

  @override
  State<DatabaseWidget> createState() => _DatabaseWidgetState();
}

class _DatabaseWidgetState extends State<DatabaseWidget> {
  late DatabaseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatabaseModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).appbar,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).appbar,
          automaticallyImplyLeading: false,
          title: Text(
            'Database',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: const SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.WebBrowser(
              width: double.infinity,
              height: double.infinity,
              initialUrl:
                  'https://drive.google.com/drive/folders/17NQ424HqeLTYIK_w3P8VwpRwNMwGn88q?usp=drive_link',
            ),
          ),
        ),
      ),
    );
  }
}
