import 'dart:ui';
import 'package:bigaze/ui/page/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/theme/color/soothingcolors.dart';

class CoolAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const CoolAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(2, 13, 13, 13).withAlpha(200),
      shadowColor: SoothingColors.purpleGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(30, 20),
            bottomRight: Radius.elliptical(30, 20)),
      ),
      elevation: 3,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        ),
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/AppIcons/android/mipmap-xhdpi/bigaze.png',
                width: 50,
                height: 50,
              ),
              const Text(
                "BiGaze",
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(2, 13, 13, 13).withAlpha(200),
      shadowColor: SoothingColors.purpleGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(30, 20),
          bottomRight: Radius.elliptical(30, 20),
        ),
      ),
      elevation: 3,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        ),
      ),
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          // Navigate to the home page when app bar is tapped
          Navigator.pop(context);
        },
        child: Text(
          title,
        ),
      ),
    );
  }
}

// Proctor app bar
class ProctorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ProctorAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(2, 13, 13, 13).withAlpha(100),
      shadowColor: SoothingColors.purpleGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(30, 20),
          bottomRight: Radius.elliptical(30, 20),
        ),
      ),
      elevation: 3,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: Color.fromARGB(255, 224, 174, 246)),
      ),
    );
  }
}
