import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'nodetails_model.dart';
export 'nodetails_model.dart';

class NodetailsWidget extends StatefulWidget {
  const NodetailsWidget({super.key});

  @override
  State<NodetailsWidget> createState() => _NodetailsWidgetState();
}

class _NodetailsWidgetState extends State<NodetailsWidget> {
  late NodetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NodetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, -0.3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/404.svg',
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.4,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'No Information Found',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
