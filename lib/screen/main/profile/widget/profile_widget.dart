import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/utils/my_colors.dart';
import 'package:online_shop/utils/my_utils.dart';

class ProfileWidget extends StatelessWidget {
   const ProfileWidget({super.key});



  @override
  Widget build(BuildContext context) {
  var user = FirebaseAuth.instance;

    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  user.currentUser!.email.toString(),
                  style:const TextStyle(),
                ),
                SizedBox(
                  height: height(context) * 0.006,
                ),
                Text(
                  user.currentUser!.phoneNumber!.toString(),
                  style: TextStyle(fontSize: height(context) * 0.03),
                ),
                SizedBox(
                  height: height(context) * 0.006,
                ),
                Text(
                  'Developer mobile',
                  style: TextStyle(
                      color: MyColors.C_A385AA, fontSize: height(context) * 0.022),
                ),
              ],
            ),
            CircleAvatar(
              radius: height(context) * 0.05,
              backgroundImage: const AssetImage(
                'assets/images/photo4.png',
              ),
            ),
          ],
        ),
        SizedBox(
          height: height(context) * 0.04,
        ),
        const Text(
          'about me:',
          style: TextStyle(),
        ),
        SizedBox(
          height: height(context) * 0.01,
        ),
        const Text(
          'Smart boy',
          style: TextStyle(),
        )
      ],
    );
  }
}
