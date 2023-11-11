import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'manage_i_d_card_model.dart';
export 'manage_i_d_card_model.dart';

class ManageIDCardWidget extends StatefulWidget {
  const ManageIDCardWidget({Key? key}) : super(key: key);

  @override
  _ManageIDCardWidgetState createState() => _ManageIDCardWidgetState();
}

class _ManageIDCardWidgetState extends State<ManageIDCardWidget> {
  late ManageIDCardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManageIDCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Manage ID Card',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Save your ID Card Here',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Nunito',
                          fontSize: 20.0,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: AuthUserStreamWidget(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: FlutterFlowExpandedImageView(
                          image: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 0),
                            fadeOutDuration: Duration(milliseconds: 0),
                            imageUrl: valueOrDefault<String>(
                              valueOrDefault(currentUserDocument?.idCard, '') ==
                                          null ||
                                      valueOrDefault(
                                              currentUserDocument?.idCard,
                                              '') ==
                                          ''
                                  ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/student-portal-wmpu59/assets/gzielpg49bwf/upload.png'
                                  : valueOrDefault(
                                      currentUserDocument?.idCard, ''),
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/student-portal-wmpu59/assets/gzielpg49bwf/upload.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                          allowRotation: false,
                          tag: valueOrDefault<String>(
                            valueOrDefault(currentUserDocument?.idCard, '') ==
                                        null ||
                                    valueOrDefault(
                                            currentUserDocument?.idCard, '') ==
                                        ''
                                ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/student-portal-wmpu59/assets/gzielpg49bwf/upload.png'
                                : valueOrDefault(
                                    currentUserDocument?.idCard, ''),
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/student-portal-wmpu59/assets/gzielpg49bwf/upload.png',
                          ),
                          useHeroAnimation: true,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: valueOrDefault<String>(
                      valueOrDefault(currentUserDocument?.idCard, '') == null ||
                              valueOrDefault(currentUserDocument?.idCard, '') ==
                                  ''
                          ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/student-portal-wmpu59/assets/gzielpg49bwf/upload.png'
                          : valueOrDefault(currentUserDocument?.idCard, ''),
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/student-portal-wmpu59/assets/gzielpg49bwf/upload.png',
                    ),
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 0),
                        fadeOutDuration: Duration(milliseconds: 0),
                        imageUrl: valueOrDefault<String>(
                          valueOrDefault(currentUserDocument?.idCard, '') ==
                                      null ||
                                  valueOrDefault(
                                          currentUserDocument?.idCard, '') ==
                                      ''
                              ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/student-portal-wmpu59/assets/gzielpg49bwf/upload.png'
                              : valueOrDefault(currentUserDocument?.idCard, ''),
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/student-portal-wmpu59/assets/gzielpg49bwf/upload.png',
                        ),
                        width: double.infinity,
                        height: 250.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        maxHeight: 250.00,
                        imageQuality: 30,
                        allowPhoto: true,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        textColor: FlutterFlowTheme.of(context).primaryText,
                        pickerFontFamily: 'Poppins',
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        setState(() => _model.isDataUploading = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();

                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          setState(() {
                            _model.uploadedLocalFile =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl = downloadUrls.first;
                          });
                          showUploadMessage(context, 'Success!');
                        } else {
                          setState(() {});
                          showUploadMessage(context, 'Failed to upload data');
                          return;
                        }
                      }

                      await currentUserReference!.update(createUserIdRecordData(
                        idCard: _model.uploadedFileUrl,
                      ));
                      setState(() {});
                    },
                    text: 'Upload ID',
                    icon: FaIcon(
                      FontAwesomeIcons.addressCard,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
