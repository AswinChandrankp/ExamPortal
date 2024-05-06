
import 'dart:js_util';

import 'package:examportal/application/constants/const.dart';
import 'package:examportal/application/core/Sevices/sidebarprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';


import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';



class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentScreen =
        Provider.of<CurrentScreenProvider>(context).currentScreen;

    return Container(
      width: 300,
      // shape: LinearBorder.none,
      // backgroundColor: sidebarcolour,
      color: sidebarcolour,
      child: ListView(
        padding: EdgeInsets.only(left: 10,right: 10),
        
        children: [
          
          Container(
            width: 300,
            height: 100,
            child: Center(child: Text("Logo")),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,bottom:20,),
            child: Divider(thickness: 1,),
          ),
       DrawerListTile(title: "Home", isActive: currentScreen == CurrentScreen.dashboard, press: () {
         Provider.of<CurrentScreenProvider>(context, listen: false).setCurrentScreen(CurrentScreen.dashboard);
       })
        ],
        
      
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    this.svgSrc,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  final String title;
  final String? svgSrc;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
         color: isActive ? Color(0xFF070358): null,
      ),
      padding: EdgeInsets.only(),
      height: 41,
     
      child: ListTile(
        
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: svgSrc != null
            ? Padding(
                padding: const EdgeInsets.all(9.0),
                child: SvgPicture.asset(
                  svgSrc!,
                  color: isActive ? Colors.blue : Color.fromRGBO(219, 218, 222, 1),
                  height: 20,
                ),
              )
            : null,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: isActive ? Colors.white : Color.fromRGBO(219, 218, 222, 1),
          ),
        ),
      ),
    );
  }
}
