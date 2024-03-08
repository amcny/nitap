import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'no_class_model.dart';
export 'no_class_model.dart';

class NoClassWidget extends StatefulWidget {
  const NoClassWidget({super.key});

  @override
  State<NoClassWidget> createState() => _NoClassWidgetState();
}

class _NoClassWidgetState extends State<NoClassWidget> {
  late NoClassModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoClassModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 175.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xCB1A73E8), FlutterFlowTheme.of(context).primary],
            stops: const [0.0, 1.0],
            begin: const AlignmentDirectional(-1.0, -1.0),
            end: const AlignmentDirectional(1.0, 1.0),
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Yahoo',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                ),
                Lottie.asset(
                  'assets/lottie_animations/winking-lottie.json',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                  animate: true,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Classes Today',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
