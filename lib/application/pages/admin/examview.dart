import 'package:examportal/application/core/controllers/addexamcontroller.dart';
import 'package:examportal/application/data/exammodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// class Examview extends StatelessWidget {
//    Examview({super.key});
//     final examcontroller = Get.put(ExamController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => 
    

//       ListView.builder(
//   itemCount: examcontroller.exams.length,
//   itemBuilder: (context, index) {
//     final exam = examcontroller.exams[index];
//     return Card(
//       child: ListTile(
//         key: Key(exam.id!), // Assuming id is unique
//         title: Text(exam.name ?? ''),
//         subtitle: Text(exam.date ?? ''),
//       ),
//     );
//   },
// ),

//     );
//   }
// }


// class Examview extends StatelessWidget {
//   Examview({Key? key}) : super(key: key);

//   final examcontroller = Get.put(ExamController());

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(40),
//       child: Obx(
//         () => GridView.builder(
          
//        // scrollDirection: Axis.horizontal,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 5, // You can change this value based on your needs
//             crossAxisSpacing: 30.0,
//             mainAxisSpacing: 30.0,
//              childAspectRatio: 1.5,
            
//           ),
//           itemCount: examcontroller.exams.length,
//           itemBuilder: (context, index) {
      
//             final exam = examcontroller.exams[index];
//             return Container(
//             //  width:  500,
//             //  height: 100,
//              color: Colors.amber,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text(exam.name ?? ''),
//                     ],
//                   )
//                 ]
//                 // title: Text(exam.name ?? ''),
//                 // subtitle: Text(exam.date ?? ''),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



class Examview extends StatelessWidget {
  Examview({Key? key}) : super(key: key);

  final examcontroller = Get.put(ExamController());

  final List<Color> _colors = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Obx(
        () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 30.0,
            childAspectRatio: 1.5,
          ),
          itemCount: examcontroller.exams.length,
          itemBuilder: (context, index) {
            final exam = examcontroller.exams[index];
            final colorIndex = index % _colors.length; // Circular pattern
            return InkWell(
              onTap: () {
                
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _colors[colorIndex].withOpacity( 0.5),
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(color: Colors.black, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                    )
                  ]
                ),
                
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(exam.name ?? '' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.white),),
              
                          Text("Time : 1hr",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
                        ],
                      ),
                    ),
                         SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(exam.date ?? '',style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white),),
                              Text("Total Marks : 100",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white),),
                            ]
                          ),
              
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right),color: Colors.white,),
                        ]
                      ),
                    )
                  ]
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
