import 'package:examportal/application/constants/const.dart';
import 'package:examportal/application/core/Sevices/MenuAppController.dart';
import 'package:examportal/application/core/Sevices/responsive.dart';
import 'package:examportal/application/core/Sevices/sidebarprovider.dart';
import 'package:examportal/application/pages/admin/components/sidebar.dart';
import 'package:examportal/application/pages/admin/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Mainscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentScreen = context.watch<CurrentScreenProvider>().currentScreen;

    Widget selectedScreen = Home(); // Default to Dashboard

    // Determine which screen to show based on the current selection
    switch (currentScreen) {
      case CurrentScreen.dashboard:
        selectedScreen = Home();
        break;
        // selectedScreen = AddEmployeespage();  
      default:
        selectedScreen = Scaffold(body: Center(child: Text("screen not found")),);
        break;
    }

    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Container(
          color: sidebarcolour,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                    color: Colors.white,),
                  
                    child: selectedScreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}