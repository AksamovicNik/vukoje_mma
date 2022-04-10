import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vukoje_mma/model/admob_helper.dart';
import 'package:vukoje_mma/widgets/banner_ad_widget.dart';
import 'package:vukoje_mma/widgets/media_card.dart';

final _firestore = FirebaseFirestore.instance;

class NewsTab extends StatefulWidget {
  const NewsTab({Key? key}) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;
  Map<String, BannerAd> ads = <String, BannerAd>{};
  

  @override
  void initState() {
    super.initState();
    // nativeAd = NativeAd(adUnitId: adUnitId, factoryId: factoryId, listener: listener, request: request)
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdmobHelper.bannerAdUnitId,
      listener: BannerAdListener(onAdLoaded: (_) {
        setState(() {
          _isBannerAdReady = true;
        });
      }, onAdClosed: (ad) {
        ad.dispose();
      }, onAdFailedToLoad: (ad, error) {
        print('Failed to Load A Banner Ad${error.message}');
        _isBannerAdReady = false;
        ad.dispose();
      }),
      request: const AdRequest(),
    );
    _bannerAd.load();
  }



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('news')
            .orderBy("timeStamp", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink,
              ),
            );
          }
          final int cardLength = snapshot.data!.docs.length;

          return ListView.separated(
              separatorBuilder: (context, index) {
                if (index % 2 == 0 && index != 0) {
                  return bannerAdWidget(_bannerAd);
                }
                return const SizedBox();
              },
              shrinkWrap: true,
              cacheExtent: MediaQuery.of(context).size.height * 0.1,
              addAutomaticKeepAlives: false,
              itemCount: cardLength,
              reverse: false,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemBuilder: (_, index) {
                final DocumentSnapshot _card = snapshot.data!.docs[index];
                final cardDescription = _card['description'] ?? 'value';
                final cardLink = _card['link'] ?? 'value';

                final Widget mediaCard = MediaCard(
                  description: cardDescription,
                  link: cardLink,
                );
                return mediaCard;
                // adCards.add(adCard);
              });
        });
  }
}
