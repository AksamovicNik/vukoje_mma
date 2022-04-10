import 'package:flutter/material.dart';

class MediaCard extends StatelessWidget {
  final String? description;
  final String? link;

  const MediaCard({Key? key, this.description, this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(description!),
        SizedBox(height: MediaQuery.of(context).size.height *0.2),
        Text(link!),
        Divider(thickness: 3,)
      ],
    );
  }
}
