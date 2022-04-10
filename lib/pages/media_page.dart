import 'package:flutter/material.dart';
import 'package:vukoje_mma/pages/media_page_tabs/news_tab.dart';

class MediaPage extends StatefulWidget {
  static String id = 'MediaPage_route';

  const MediaPage({Key? key}) : super(key: key);

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: TabBar(
                labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                unselectedLabelColor: Colors.red,
                padding: const EdgeInsets.fromLTRB(1, 5, 1, 5),
                indicator: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 3, offset: Offset(0, 2))
                ], borderRadius: BorderRadius.circular(10), color: Colors.green),
                controller: controller,
                tabs: [
                  Tab(
                    child: Text('News'),
                  ),
                  Tab(
                    child: Text('Highlights'),
                  ),
                  Tab(
                    child: Text('Podcast'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 13,
                child: TabBarView(
              controller: controller,
                  children: [
                    NewsTab(),
                    Container(),
                    Container(),
                  ],
            ))
          ],
        ),
      ),
    );
  }
}
