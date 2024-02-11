import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _iconpackFamily = 'Iconpack';
  static const String _iconsFamily = 'Icons';
  static const String _fileFamily = 'File';

  // iconpack
  static const IconData kprofileFilled =
      IconData(0xe900, fontFamily: _iconpackFamily);
  static const IconData kdbFilled =
      IconData(0xe901, fontFamily: _iconpackFamily);
  static const IconData kttFilled =
      IconData(0xe902, fontFamily: _iconpackFamily);
  static const IconData khomeFilled =
      IconData(0xe903, fontFamily: _iconpackFamily);
  static const IconData kdbOutline =
      IconData(0xe904, fontFamily: _iconpackFamily);
  static const IconData khomeOutline =
      IconData(0xe905, fontFamily: _iconpackFamily);
  static const IconData kprofileOutline =
      IconData(0xe906, fontFamily: _iconpackFamily);
  static const IconData kttOutline =
      IconData(0xe907, fontFamily: _iconpackFamily);

  // Icons
  static const IconData kmail = IconData(0xe800, fontFamily: _iconsFamily);
  static const IconData kdelete = IconData(0xe801, fontFamily: _iconsFamily);
  static const IconData kedit = IconData(0xe802, fontFamily: _iconsFamily);
  static const IconData kinfo = IconData(0xe803, fontFamily: _iconsFamily);

  // File
  static const IconData kfile = IconData(0xe800, fontFamily: _fileFamily);
}
