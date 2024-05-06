import 'package:examportal/application/core/Sevices/MenuAppController.dart';
import 'package:examportal/application/core/Sevices/responsive.dart';
import 'package:examportal/application/pages/admin/addexam1.dart';
import 'package:examportal/application/pages/admin/addexams.dart';
import 'package:examportal/application/pages/admin/components/custombutton.dart';
import 'package:examportal/application/pages/admin/examview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          Header(),
          // SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,bottom:20,),
            child: Divider(thickness: 1,),
            
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomElevatedButton(onPressed: (){
                  //  showDialog(
                    
                  //               context: context,
                  //               builder: (BuildContext context) {
                  //                 return Dialog(
                  //                   child: AddExam(),
                  //                 );
                  //               },
                  //             );
                
                  if (Responsive.isMobile(context)) {
                      // For mobile devices, show a full-screen dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddExam()),
                
                        
                      );
                    
                    } else {
                      // For tablets or desktops, navigate to a different screen
                      
                
                
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: AddExam(),
                          );
                        },
                      );
                    }
                 
                
                          
                }, text: 'Add Exam',color: Colors.greenAccent,padding: EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 10),
                ),
              ),
            ]
          ),

          Expanded(child: Examview())
        ]
      ),

    );
  }
}



class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.all(Radius.circular(10)),
    //       boxShadow: [
    //   BoxShadow(
       
    //     color: Color.fromARGB(255, 171, 210, 242).withOpacity(.5),
    //     blurRadius: 25.0, // soften the shadow
    //     spreadRadius: 0.0, //extend the shadow
    //     offset: Offset(
    //       5.0, // Move to right 10  horizontally
    //       5.0, // Move to bottom 10 Vertically
    //     ),
    //   ),
    // ]
    
    ) ,                          
  
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: context.read<MenuAppController>().controlMenu,
              
            ),

            Text("Home"),
          if (!Responsive.isMobile(context)) Spacer() ,  
          // Spacer(), // Corrected Spacer usage
      
          
          Spacer(),
        ],
      ),

      
    );
  }
}