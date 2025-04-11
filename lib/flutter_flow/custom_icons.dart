import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _iconPackFamily = 'IconPack';
  static const String _navbarIconsFamily = 'NavbarIcons';
  static const String _icons0Family = 'Icons0';
  static const String _profileIconsFamily = 'ProfileIcons';
  static const String _profileNoAvatarFamily = 'ProfileNoAvatar';
  static const String _snackBarIconsFamily = 'SnackBarIcons';
  static const String _audioPlayerIconsFamily = 'AudioPlayerIcons';
  static const String _homePageIconsFamily = 'HomePageIcons';
  static const String _loadingFamily = 'Loading';

  // IconPack
  static const IconData kchangeHistory =
      IconData(0xe800, fontFamily: _iconPackFamily);
  static const IconData kdetails =
      IconData(0xe802, fontFamily: _iconPackFamily);

  // NavbarIcons
  static const IconData knavbarMiddle =
      IconData(0xe800, fontFamily: _navbarIconsFamily);
  static const IconData knbLeft =
      IconData(0xe801, fontFamily: _navbarIconsFamily);
  static const IconData knbRight =
      IconData(0xe802, fontFamily: _navbarIconsFamily);

  // Icons0
  static const IconData kvideocamera =
      IconData(0xe806, fontFamily: _icons0Family);
  static const IconData ktextaa = IconData(0xe807, fontFamily: _icons0Family);
  static const IconData kspeakersimplehigh =
      IconData(0xe808, fontFamily: _icons0Family);

  // ProfileIcons
  static const IconData ktelegram =
      IconData(0xe800, fontFamily: _profileIconsFamily);
  static const IconData klink =
      IconData(0xe801, fontFamily: _profileIconsFamily);
  static const IconData ksupport =
      IconData(0xe802, fontFamily: _profileIconsFamily);
  static const IconData kprofileSettings =
      IconData(0xe803, fontFamily: _profileIconsFamily);
  static const IconData kinfo =
      IconData(0xe804, fontFamily: _profileIconsFamily);
  static const IconData klogOut =
      IconData(0xe805, fontFamily: _profileIconsFamily);

  // ProfileNoAvatar
  static const IconData knoAvatar =
      IconData(0xe806, fontFamily: _profileNoAvatarFamily);

  // SnackBarIcons
  static const IconData kalert =
      IconData(0xe807, fontFamily: _snackBarIconsFamily);
  static const IconData kcheckcircle =
      IconData(0xe808, fontFamily: _snackBarIconsFamily);

  // AudioPlayerIcons
  static const IconData kaudioNext =
      IconData(0xe80a, fontFamily: _audioPlayerIconsFamily);
  static const IconData kaudioPrev =
      IconData(0xe80b, fontFamily: _audioPlayerIconsFamily);

  // HomePageIcons
  static const IconData khits =
      IconData(0xe80c, fontFamily: _homePageIconsFamily);
  static const IconData knewIcon =
      IconData(0xe80d, fontFamily: _homePageIconsFamily);
  static const IconData kpopular =
      IconData(0xe80e, fontFamily: _homePageIconsFamily);

  // Loading
  static const IconData kloading = IconData(0xe80f, fontFamily: _loadingFamily);
}
