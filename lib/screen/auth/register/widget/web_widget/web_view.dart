import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/screen/auth/register/widget/web_widget/web_widgegt.dart';
import 'package:online_shop/utils/my_icons.dart';
import 'package:online_shop/utils/my_utils.dart';

class WebWiew extends StatefulWidget {
  const WebWiew({super.key});

  @override
  State<WebWiew> createState() => _WebWiewState();
}

class _WebWiewState extends State<WebWiew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>WebWidget(box: 'apple',)));
          }, child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: height(context)*0.01),
            child: SvgPicture.asset(MyIcons.apple),
          )),

          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>WebWidget(box: 'google',)));
          }, child:Padding(
            padding: EdgeInsets.symmetric(horizontal: height(context)*0.01),
            child: SvgPicture.asset(MyIcons.google),
          ),),

          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>WebWidget(box: 'twitter',)));
          }, child:Padding(
            padding: EdgeInsets.symmetric(horizontal: height(context)*0.01),
            child: SvgPicture.asset(MyIcons.twitter),
          )),

          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>WebWidget(box: 'facebook',)));
          }, child:Padding(
            padding: EdgeInsets.symmetric(horizontal: height(context)*0.01),
            child: SvgPicture.asset(MyIcons.facebook),
          ),),
         ],
      ),
    );
  }
}
