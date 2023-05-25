import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/screen/main/home/home_page.dart';
import 'package:online_shop/screen/main/notification/notification_page.dart';
import 'package:online_shop/screen/main/profile/profile_page.dart';
import 'package:online_shop/screen/main/search/search_page.dart';
import 'package:online_shop/screen/main/watch/watch_page.dart';
import 'package:online_shop/utils/my_colors.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int index = 0;
  final List _list = const [
    HomePage(), 
    SearchPage(), 
    WatchPage(), 
    NotificationPage(),
    ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: _list[index],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 8,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          fixedColor: Colors.black,
          backgroundColor: Colors.white,
          unselectedItemColor: MyColors.C_A385AA,
          items:  [
            BottomNavigationBarItem(
                icon:
                  SvgPicture.asset('assets/icons/home.svg',color: Colors.black,),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/search1.svg'),

                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/watch.svg'),

                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/notification.svg'),

                label: ''),
            BottomNavigationBarItem(
                icon: 
                  SvgPicture.asset('assets/icons/user.svg'),
                label: ''),
          ]),
    );
  }
}
