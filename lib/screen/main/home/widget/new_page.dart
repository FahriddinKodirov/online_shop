import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/utils/my_utils.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) * 0.014),
      child: Container(
          color: const Color(0xFFFFFFFF),
          height: height(context) * 0.69,
          width: width(context),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[400]!, width: 1.4)),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/photo.png'),
                    ),
                  ),
                ),
                title: const Text('Jeck',style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: const Text('21h ago'),
                trailing: SvgPicture.asset(
                  'assets/icons/vector.svg',
                  width: width(context) * 0.1,
                ),
              ),
              SizedBox(
                height: height(context)*0.5,
                child: Image.asset(
                  'assets/images/photo.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: height(context) * 0.022,
              ),
              Padding(
                padding: EdgeInsets.only(left: width(context) * 0.05),
                child: Row(
                  children: [
                    Container(
                      height: height(context) * 0.036,
                      width: width(context) * 0.19,
                      decoration: BoxDecoration(
                          color: const Color(0xFFD6204E).withOpacity(0.2),
                          borderRadius:
                              BorderRadius.circular(height(context) * 0.2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.favorite,
                            color: Color(0xFFD6204E),
                          ),
                          Text('123')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width(context) * 0.05,
                    ),
                    Container(
                      height: height(context) * 0.036,
                      width: width(context) * 0.19,
                      decoration: BoxDecoration(
                          color: const Color(0xFFA898AB0).withOpacity(0.2),
                          borderRadius:
                              BorderRadius.circular(height(context) * 0.2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.comment,
                            color: Color(0xFFA898AB0),
                          ),
                          Text('123')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width(context) * 0.4,
                    ),
                    SvgPicture.asset('assets/icons/telegram.svg')
                  ],
                ),
              )
            ],
          )),
    );
  }
}
