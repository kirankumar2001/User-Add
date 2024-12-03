import 'package:flutter/material.dart';
import 'package:web_api_app/view/utils/color.dart';

import '../../../utils/text_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool? centerTitle;
  CustomAppbar({super.key, required this.title, this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Clr.mainColor,
      iconTheme: const IconThemeData(color: Clr.white),
      centerTitle: centerTitle,
      title: Text(
        title,
        style: TxtStyles.titleWFonts,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
