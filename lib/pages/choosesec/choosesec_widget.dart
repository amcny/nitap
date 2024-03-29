import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'choosesec_model.dart';
export 'choosesec_model.dart';

class ChoosesecWidget extends StatefulWidget {
  const ChoosesecWidget({super.key});

  @override
  State<ChoosesecWidget> createState() => _ChoosesecWidgetState();
}

class _ChoosesecWidgetState extends State<ChoosesecWidget> {
  late ChoosesecModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoosesecModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).appbar,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).appbar,
        automaticallyImplyLeading: false,
        title: Text(
          'Choose Section',
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
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Please Choose your Year & Section',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                ],
              ),
            ),
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(null),
                  options: const [
                    'II - Sec A',
                    'II - Sec B',
                    'III - Sec A',
                    'III - Sec B',
                    'IV - Sec A',
                    'IV - Sec B'
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue = val),
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 55.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                  hintText: 'Please select...',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).bwgrey,
                  elevation: 1.0,
                  borderColor: FlutterFlowTheme.of(context).accent3,
                  borderWidth: 1.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_model.formKey.currentState == null ||
                      !_model.formKey.currentState!.validate()) {
                    return;
                  }
                  FFAppState().update(() {
                    FFAppState().secname = _model.dropDownValue!;
                  });

                  context.goNamed('homepage');
                },
                text: 'Save Changes',
                options: FFButtonOptions(
                  width: 190.0,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
