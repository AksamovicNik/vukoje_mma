import 'dart:io';

class AdmobHelper{
  static String get bannerAdUnitId {
    if (Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS){
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('unsupported Platform');
    }
  }

  static String get interstitialAdUnitId{
    if (Platform.isAndroid){
      return 'cca-app-pub-3940256099942544/1033173712';
    } else if (Platform.isIOS){
      return 'ca-app-pub-3940256099942544/4411468910';
    } else {
      throw UnsupportedError('unsupported Platform');
    }
  }
}