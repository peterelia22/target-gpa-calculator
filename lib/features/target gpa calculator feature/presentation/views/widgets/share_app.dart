import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Share.share(
          'Check out this awesome target GPA calculator app! Download it here: https://www.amazon.com/gp/product/B0DH5C1W4W',
        );
      },
      icon: const Icon(
        FontAwesomeIcons.shareFromSquare,
        color: Colors.white,
      ),
    );
  }
}
