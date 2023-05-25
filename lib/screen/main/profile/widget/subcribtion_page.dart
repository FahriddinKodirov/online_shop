import 'package:flutter/material.dart';
import 'package:online_shop/utils/my_colors.dart';
import 'package:online_shop/utils/my_utils.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: height(context) * 0.09,
          width: width(context) * 0.43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height(context) * 0.01),
            color: MyColors.C_A385AA,
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1234',
                style: TextStyle(
                    color: Colors.white, fontSize: height(context) * 0.025),
              ),
              const Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
        ),
        Container(
          height: height(context) * 0.09,
          width: width(context) * 0.43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height(context) * 0.01),
            color: MyColors.C_A385AA.withOpacity(0.5),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1234',
                style: TextStyle(
                    color: Colors.white, fontSize: height(context) * 0.025),
              ),
              const Text(
                'Friends',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
