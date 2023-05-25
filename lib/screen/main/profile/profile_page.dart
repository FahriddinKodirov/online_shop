import 'package:flutter/material.dart';
import 'package:online_shop/screen/main/profile/widget/photo_page.dart';
import 'package:online_shop/screen/main/profile/widget/profile_widget.dart';
import 'package:online_shop/screen/main/profile/widget/subcribtion_page.dart';
import 'package:online_shop/utils/my_colors.dart';
import 'package:online_shop/utils/my_utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Profile',style: TextStyle(color:MyColors.C_A385AA),),
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width(context)*0.04),
            child: const Icon(
              Icons.settings_rounded,
              color: MyColors.C_A385AA,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(height(context) * 0.018),
        child: Container(
          height: height(context),
          width: width(context),
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(height(context) * 0.03)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 ProfileWidget(),
                SizedBox(
                  height: height(context) * 0.035,
                ),
                const SubscriptionPage(),
                SizedBox(
                  height: height(context) * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const PhotoPage()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_outlined,
                        size: height(context) * 0.04,
                      ),
                      SizedBox(
                        width: width(context) * 0.03,
                      ),
                      const Text(
                        'My Post',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                      height: height(context) * 0.02,
                    ),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: [
                     Image.asset('assets/images/photo.png',width: height(context)*0.25,),
                     Image.asset('assets/images/photo2.png',width: height(context)*0.2,),
                    ],),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: [
                     Image.asset('assets/images/photo3.png',width: height(context)*0.2,),
                     Image.asset('assets/images/photo4.png',width: height(context)*0.25,),
                    ],)
                // CarouselGrid(
                //   height: 285,
                //   width: 400,
                //   listUrlImages: imageList,
                //   iconBack: const Icon(
                //     Icons.arrow_back,
                //     color: Colors.white,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> imageList = [
  'assets/images/photo.png',
  'assets/images/photo.png',
  'assets/images/photo.png',
  'assets/images/photo.png',
];