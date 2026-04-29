

import 'package:darsak/core/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
        children: [
          Icon(Icons.home_rounded,),
          Icon(Icons.home,),
          Icon(Icons.home_filled,),
          Icon(Icons.home_outlined,),
          Icon(Icons.home_sharp,),
          Container(child: SvgPicture.asset('biology'.toSvg,)),

        ],
      ),
    );
  }
}