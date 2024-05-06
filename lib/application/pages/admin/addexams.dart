





// import 'package:examportal/application/core/Sevices/responsive.dart';
// import 'package:examportal/application/core/controllers/addexamcontroller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/instance_manager.dart';

// class AddExam extends StatelessWidget {
//    AddExam({super.key});

//   final ExamController examController = Get.put(ExamController());

//   @override
//   Widget build(BuildContext context) {
//     return  Responsive.isMobile(context) ? Container(

//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.7,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           color: Colors.white,
//         ),
//         child: Column(
          
//           children: [
//             Expanded(
//                flex: 5,
//               child: Container(
//                 color: Colors.amber,
//               ),
//             ),
//             Expanded(
//               flex: 10,
//               child: Container(
//                 color: Colors.amberAccent,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ) : Container(
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.7,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           color: Colors.white,
//         ),
//         child: Row(
          
//           children: [
//             Expanded(
//                flex: 5,
//               child: Container(
//                 // color: Colors.amber,
//                 child: Column(
                  
//                   children: [

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text("Create Exam"),
//                       ],
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         controller: examController.questionTitleController,
//                         decoration: InputDecoration(
//                          hintText: "Enter Exam Name",


//                         )
//                       ),
//                     ),
//                      Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: TextField(
//                           controller: examController.dateController,
//                          decoration: InputDecoration(
//                            hintText: "Enter Exam date",
//                          )
//                        ),
//                      ),

//                      ElevatedButton(onPressed: (){
//                        examController.sendExamDataToBackend();
//                      }, child: Text("Submit"))
//                   ]
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 10,
//               child: Container(
//                 color: Colors.amberAccent,

//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         ElevatedButton(onPressed: (){

//                           examController.addQuestion();
//                         }, child: Text("add question")),
//                       ],

//                     ),

//                        Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 itemCount: examController.questions.length,
//                 itemBuilder: (context, index) {
//                   return QuestionCard(
//                     index: index,
//                     question: examController.questions[index]['question'],
//                     options: examController.questions[index]['options'],
//                     correctOption: examController.questions[index]['correctOption'],
//                     onDelete: () {
//                       examController.deleteQuestion(index);
//                     },
//                     onUpdate: (question, options, correctOption) {
//                       examController.updateQuestion(index, question, options, correctOption as String);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),

                  
//                   ]
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// class QuestionCard extends StatefulWidget {
//   final int index;
//   final String question;
//   final List<String> options;
//   final int correctOption;
//   final VoidCallback onDelete;
//   final Function(String, List<String>, int) onUpdate;

//   QuestionCard({
//     required this.index,
//     required this.question,
//     required this.options,
//     required this.correctOption,
//     required this.onDelete,
//     required this.onUpdate,
//   });

//   @override
//   _QuestionCardState createState() => _QuestionCardState();
// }

// class _QuestionCardState extends State<QuestionCard> {
//   late int _selectedOption;

//   @override
//   void initState() {
//     super.initState();
//     _selectedOption = widget.correctOption;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: TextEditingController(text: widget.question),
//               decoration: InputDecoration(
//                 hintText: 'Enter question',
//               ),
//               onChanged: (value) {
//                 widget.onUpdate(value, widget.options, _selectedOption);
//               },
//             ),
//             SizedBox(height: 16.0),
//             ...widget.options.asMap().entries.map((entry) {
//               final int optionIndex = entry.key;
//               final String optionValue = entry.value;
//               return Row(
//                 children: [
//                   Radio<int>(
//                     value: optionIndex,
//                     groupValue: _selectedOption,
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedOption = value!;
//                         widget.onUpdate(widget.question, widget.options, _selectedOption);
//                       });
//                     },
//                   ),
//                   Expanded(
//                     child: TextField(
//                       controller: TextEditingController(text: optionValue),
//                       decoration: InputDecoration(
//                         hintText: 'Enter option ${optionIndex + 1}',
//                       ),
//                       onChanged: (value) {
//                         final newOptions = List<String>.from(widget.options);
//                         newOptions[optionIndex] = value;
//                         widget.onUpdate(widget.question, newOptions, _selectedOption);
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             }).toList(),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                   onPressed: widget.onDelete,
//                   child: Text('Delete'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:examportal/application/core/Sevices/responsive.dart';
import 'package:examportal/application/core/controllers/addexamcontroller.dart';
import 'package:examportal/application/pages/admin/components/custombutton.dart';
import 'package:examportal/application/pages/admin/components/customtextfield.dart';
import 'package:examportal/application/pages/admin/components/numbertextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// class ExamController extends GetxController {
//   final RxList<Map<String, dynamic>> _questions = <Map<String, dynamic>>[].obs;

//   TextEditingController questionTitleController = TextEditingController();
//   TextEditingController dateController = TextEditingController();

//   List<Map<String, dynamic>> get questions => _questions;

//   void addQuestion() {
//     _questions.add({'question': '', 'options': ['', '', '', ''], 'correctOption': 0});
//   }

//   void deleteQuestion(int index) {
//     _questions.removeAt(index);
//   }

//   void updateQuestion(int index, String question, List<String> options, int correctOption) {
//     _questions[index] = {'question': question, 'options': options, 'correctOption': correctOption};
//   }

//   void sendExamDataToBackend() {
//     Map<String, dynamic> examData = {
//       'name': questionTitleController.text,
//       'date': dateController.text,
//       'questions': questions.toList(),
//     };

//     // Implement the logic to send exam data to the backend
//     print('Sending exam data to backend: $examData');
    

//     // Clear the exam data after sending it to the backend
//     _questions.clear();
//     questionTitleController.clear();
//     dateController.clear();
//   }
// }

class AddExam extends StatelessWidget {
  final ExamController examController = Get.put(ExamController());

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Container(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      color: Colors.amberAccent,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Column(

                        children: [
                          Column(
                          
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Create Exam"),
                                ],
                              ),

                              SizedBox(height: 50.0),
                              Padding(
                            padding: const EdgeInsets.all(8),
                            child: CustomTextField2(
                              controller: examController.questionTitleController,
                            
                               labelText: 'Enter Exam Name',
                            ),
                          ),

                          SizedBox(height: 4.0),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: CustomTextField2(
                              controller: examController.dateController,
                               labelText: 'Enter Exam date', 

                            ),
                          ),
                            ],
                          ),
                          
                          Spacer(),
                         
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20,right: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomElevatedButton(
                                          onPressed: () {
                                            examController.sendExamDataToBackend();
                                          },
                                          text: 'Submit',
                                          color: Colors.greenAccent,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
SizedBox(height: 10.0),
                               Padding(
                             padding: const EdgeInsets.only(left:20,right: 20),
                             child: Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButton(
                                      onPressed: () {
                                       Get.back();
                                      },
                                      text: 'Discard',
                                      color: Colors.redAccent,
                                      ),
                                ),
                              ],
                                                       ),
                           ),
                            ],
                          ),

                           SizedBox(height: 20.0),
                          
                           
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: CustomElevatedButton(
                                    onPressed: () {
                                      examController.addQuestion();
                                    },
                                    text: ' Add Questions',
                                    ),
                              ),
                            ],
                          ),

                          
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                itemCount: examController.questions.length,
                                itemBuilder: (context, index) {
                                  return QuestionCard(
                                    index: index,
                                    question: examController.questions[index]['question'],
                                    options: examController.questions[index]['options'],
                                    correctOption: examController.questions[index]['correctOption'],
                                    onDelete: () {
                                      examController.deleteQuestion(index);
                                    },
                                    onUpdate: (question, options, correctOption) {
                                      examController.updateQuestion(index, question, options, correctOption, );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class QuestionCard extends StatefulWidget {
  final int index;
  final String question;
  final List<String> options;
  final String correctOption;
  final VoidCallback onDelete;
  final Function(String, List<String>, String) onUpdate;

  QuestionCard({
    required this.index,
    required this.question,
    required this.options,
    required this.correctOption,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  late TextEditingController questionController;
  late List<TextEditingController> optionControllers;
  late TextEditingController correctOptionController;

  @override
  void initState() {
    super.initState();
    questionController = TextEditingController(text: widget.question);
    optionControllers = List.generate(
      widget.options.length,
      (index) => TextEditingController(text: widget.options[index]),
    );
    correctOptionController = TextEditingController(text: widget.correctOption);
  }


@override
Widget build(BuildContext context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [

                Text("Question ${widget.index + 1}"),
                 Row(
                   children: [
                     Row(
                       children: [
                        Text("Mark : "),
                         SizedBox(
                           width: 50,
                           child: NumberTextField(
                             controller: TextEditingController(),
                            //  arrowsHeight: 10,
                            //  arrowsWidth: 10,
                            //  min: 1,
                            //  max: 10,
                            // borderWidth: 100,
                             contentPadding: EdgeInsets.only(top: 18),
                           ),
                         ),
                       ],
                     ),
                      Row(
                   children: [
                    Text("Time: "),
                     SizedBox(
                       width: 50,
                       child: NumberTextField(
                        borderWidth: 0,
                        // focusNode: FocusNode(),
                        // step:1 ,
                         controller: TextEditingController(),
                        //  arrowsHeight: 10,
                        //  arrowsWidth: 10,
                        //  min: 1,
                        //  max: 10,
                        // borderWidth: 100,
                         contentPadding: EdgeInsets.only(top: 18),
                       ),
                     ),
                   ],
                 ),
                   ],
                 ),
                 
               ],
             ),
            CustomTextArea(
               hintText: 'Enter questions',
              controller: questionController,
          //  title: 'Question${widget.index + 1} ', hintText: 'Enter questions', time: '30', mark: '1',
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: widget.options.asMap().entries
                        .where((entry) => entry.key % 2 == 0)
                        .map((entry) {
                      final int optionIndex = entry.key;
                      final String optionValue = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: CustomTextField2(
                          controller: optionControllers[optionIndex],
                          
                        
                         labelText: 'Enter option ${optionIndex + 1}',
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    children: widget.options.asMap().entries
                        .where((entry) => entry.key % 2 == 1)
                        .map((entry) {
                      final int optionIndex = entry.key;
                      final String optionValue = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: CustomTextField2(
                          controller: optionControllers[optionIndex],
                          labelText: 'Enter option ${optionIndex + 1}',
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            CustomTextField2(
              controller: correctOptionController,
             labelText: 'Enter correct answer',
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: widget.onDelete,
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}