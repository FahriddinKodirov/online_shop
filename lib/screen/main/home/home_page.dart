import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/screen/main/home/widget/new_page.dart';
import 'package:online_shop/screen/main/home/widget/post_page.dart';
import 'package:online_shop/screen/main/search/widget/post_page.dart';
import 'package:online_shop/utils/my_colors.dart';
import 'package:online_shop/utils/my_icons.dart';
import 'package:online_shop/utils/my_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 1,
        title: const Text(
          'Weblog',
          style: TextStyle(color: MyColors.C_A385AA),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width(context) * 0.03),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const NewPostPage()));
              },
              child: SvgPicture.asset(MyIcons.appbarPlus)),
          ),
          Padding(
            padding: EdgeInsets.only(right: width(context) * 0.03),
            child: SvgPicture.asset(MyIcons.appbarComent),
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(top: height(context) * 0.007),
          child: Column(
            children: [
              Expanded(child: 
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder:(context, index) {
                  return const NewPage();
              },))
            ],
          )),
    );
  }
}
