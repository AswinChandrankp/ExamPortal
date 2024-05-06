


import 'package:flutter/material.dart';

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomTextField2({
     
    required this.controller,
    required this.labelText,
  }) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
           gapPadding: 10,
            borderSide: BorderSide(color: Colors.black54,width: 0),
            borderRadius: BorderRadius.circular(5.5),
      
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54,width: .5),
            borderRadius: BorderRadius.circular(5.5),
          ),
          // prefixIcon: Icon(
          //   Icons.person,
          //   color: Colors.red,
          // ),
          filled: false,
          // fillColor: Colors.white,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}





class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String title;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(title,style: TextStyle(color: Colors.black87),) ,
            ),
          ],
        ),
        SizedBox(
          height: 40, // Set the height to 30
          child: TextFormField(
            controller: controller,
             textAlign: TextAlign.start, 
            decoration: InputDecoration(
              
              focusedBorder: OutlineInputBorder(
                gapPadding: 10,
                borderSide: BorderSide(color: Colors.black54, width: 0),
                borderRadius: BorderRadius.circular(5.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: .5),
                borderRadius: BorderRadius.circular(5.5),
              ),
              // prefixIcon: Icon(
              //   Icons.person,
              //   color: Colors.red,
              // ),
              filled: false,
               
              // fillColor: Colors.white,
              labelText: labelText ,
              labelStyle: TextStyle(color: Colors.black54,fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}






class CustomTextArea extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final  title;


  const CustomTextArea({
     this.title,
    required this.hintText,
    required this.controller,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(bottom: 10),
        //       child: Text(title),
        //     ),

        //     Padding(
        //         padding: const EdgeInsets.only(bottom: 10),
        //       child: Row(
        //         children: [
                  
        //           // Text( "Time :  ${time}s"),
        //           // SizedBox(width: 3,),
        //           // Text( "Mark :  ${mark}")
        //         ]
        //       ),
        //     )
        //   ],
        // ),
        SizedBox(
          height: 150, 
          child: TextField(

            controller: controller,
            // decoration: InputDecoration(
            //    focusedBorder: OutlineInputBorder(
            //     gapPadding: 10,
            //     borderSide: BorderSide(color: Colors.black, width: 0),
            //     borderRadius: BorderRadius.circular(5.5),
            //   ),
            //   hintText: hintText,
            //   border: OutlineInputBorder(
            //        gapPadding: 10,
            //     // borderSide: BorderSide(color: Colors.black, width: 0),
            //     borderSide: BorderSide(color: Colors.black, width: .5),
            //     borderRadius: BorderRadius.circular(5.5),
            //   ),
            // ),

               decoration: InputDecoration(
              
              focusedBorder: OutlineInputBorder(
                gapPadding: 10,
                borderSide: BorderSide(color: Colors.black45, width: 0),
                borderRadius: BorderRadius.circular(5.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45, width: .5),
                borderRadius: BorderRadius.circular(5.5),
              ),
              // prefixIcon: Icon(
              //   Icons.person,
              //   color: Colors.red,
              // ),
              filled: false,
              // fillColor: Colors.white,
            
              labelStyle: TextStyle(color: Colors.black),
            ),
            maxLines: 30, // Allows for multiline input
          ),
        ),
      ],
    );
  }
}
