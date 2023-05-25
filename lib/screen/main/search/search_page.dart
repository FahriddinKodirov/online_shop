import 'package:flutter/material.dart';
import 'package:online_shop/screen/main/search/widget/live_page.dart';
import 'package:online_shop/screen/main/search/widget/people_page.dart';
import 'package:online_shop/screen/main/search/widget/picture_page.dart';
import 'package:online_shop/screen/main/search/widget/post_page.dart';
import 'package:online_shop/utils/my_colors.dart';
import 'package:online_shop/utils/my_utils.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: height(context)*0.1,
          elevation: 1,
          backgroundColor: const Color(0xFFFFFFFF),
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: height(context)*0.03),
          child: Padding(
            padding: EdgeInsets.only(right: width(context)*0.04,left: width(context)*0.04, top: width(context)*0.06,bottom: height(context)*0.02),
            child: TextField(
              decoration: profileGetInputDecoration(context,label: 'Search'),
            ),
          ),
        ),
        bottom: const TabBar(
            indicatorColor: MyColors.C_A385AA,
            tabs:  [
            Tab(
              icon: Text('People',style: TextStyle(color: Colors.black),)
            ),
            Tab(
              icon: Text('Post',style: TextStyle(color: Colors.black),)
            ),
            Tab(
              icon: Text('Picture',style: TextStyle(color: Colors.black),)
            ),
            
            Tab(
              icon: Text('Live',style: TextStyle(color: Colors.black),)
            ),
            
          ]),
        ),
        body: const TabBarView(children:  [
          PeoplePage(),
          PostPage(),
          PicturePage(),
          LivePage(),
        ]),
      ),
    );
  }
}