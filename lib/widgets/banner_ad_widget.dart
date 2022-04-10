import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Widget bannerAdWidget(adView) {
  //napraviti banner kroz stateful builder da se ne bi pokazivao isti uvek, vec da se napravi novi. Ako se pokazuje isti, onda izbacuje error!
  return StatefulBuilder(
    builder: (context, setState) => Container(
      child: AdWidget(ad: adView),
      height: adView.size.height.toDouble(),
      width: adView.size.width.toDouble(),
      alignment: Alignment.center,
    ),
  );
}