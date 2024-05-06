
// import 'package:examportal/application/core/Sevices/responsive.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

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

// class AddExam1 extends StatelessWidget {
//   final ExamController examController = Get.put(ExamController());

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Exam Title:'),
//           TextField(
//             controller: examController.questionTitleController,
//             decoration: InputDecoration(
//               hintText: 'Enter Exam Title',
//             ),
//           ),
//           SizedBox(height: 16.0),
//           Text('Exam Date:'),
//           TextField(
//             controller: examController.dateController,
//             decoration: InputDecoration(
//               hintText: 'Enter Exam Date',
//             ),
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               examController.sendExamDataToBackend();
//             },
//             child: Text('Submit Exam'),
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               examController.addQuestion();
//             },
//             child: Text('Add Question'),
//           ),
//           SizedBox(height: 16.0),
//           Expanded(
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
//                       examController.updateQuestion(index, question, options, correctOption);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// class AddExam extends StatelessWidget {
//   final ExamController examController = Get.put(ExamController());

//   @override
//   Widget build(BuildContext context) {
//     return Responsive.isMobile(context)
//         ? Container(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.7,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: Container(
//                       color: Colors.amber,
//                     ),
//                   ),
//                   Expanded(
//                     flex: 10,
//                     child: Container(
//                       color: Colors.amberAccent,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         : Container(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.7,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: Container(
//                       child: Column(
//                         children: [
//                           Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text("Create Exam"),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: TextField(
//                                   controller: examController.questionTitleController,
//                                   decoration: InputDecoration(
//                                     hintText: "Enter Exam Name",
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: TextField(
//                                   controller: examController.dateController,
//                                   decoration: InputDecoration(
//                                     hintText: "Enter Exam date",
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Spacer(),
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20, right: 20),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       child: CustomElevatedButton(
//                                         onPressed: () {
//                                           examController.sendExamDataToBackend();
//                                         },
//                                         text: 'Submit',
//                                         color: Colors.greenAccent,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 10.0),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20, right: 20),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       child: CustomElevatedButton(
//                                         onPressed: () {
//                                           Get.back();
//                                         },
//                                         text: 'Discard',
//                                         color: Colors.redAccent,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 20.0),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 10,
//                     child: Container(
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: CustomElevatedButton(
//                                   onPressed: () {
//                                     examController.addQuestion();
//                                   },
//                                   text: ' Add Questions',
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Expanded(
//                             child: Obx(
//                               () => ListView.builder(
//                                 itemCount: examController.questions.length,
//                                 itemBuilder: (context, index) {
//                                   return buildQuestionCard(index, examController.questions[index]);
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }

//   Widget buildQuestionCard(int index, Map<String, dynamic> questionData) {
//     return QuestionCard(
//       index: index,
//       question: questionData['question'],
//       options: questionData['options'],
//       correctOption: questionData['correctOption'],
//       onDelete: () {
//         examController.deleteQuestion(index);
//       },
//       onUpdate: (question, options, correctOption) {
//         examController.updateQuestion(index, question, options, correctOption);
//       },
//       onAddOption: () {
//         examController.addOption(index);
//       },
//     );
//   }
// }

// class QuestionCard extends StatefulWidget {
//   final int index;
//   final String question;
//   final List<String> options;
//   final String correctOption;
//   final VoidCallback onDelete;
//   final Function(String, List<String>, String) onUpdate;
//   final VoidCallback onAddOption;

//   QuestionCard({
//     required this.index,
//     required this.question,
//     required this.options,
//     required this.correctOption,
//     required this.onDelete,
//     required this.onUpdate,
//     required this.onAddOption,
//   });

//   @override
//   _QuestionCardState createState() => _QuestionCardState();
// }

// class _QuestionCardState extends State<QuestionCard> {
//   late TextEditingController questionController;
//   late List<TextEditingController> optionControllers;
//   late TextEditingController correctOptionController;

//   @override
//   void initState() {
//     super.initState();
//     questionController = TextEditingController(text: widget.question);
//     optionControllers = List.generate(
//       widget.options.length,
//       (index) => TextEditingController(text: widget.options[index]),
//     );
//     correctOptionController = TextEditingController(text: widget.correctOption);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 controller: questionController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter question',
//                 ),
//                 onChanged: (value) {
//                   widget.onUpdate(value, widget.options, correctOptionController.text);
//                 },
//                 maxLines: null,
//               ),
//               SizedBox(height: 16.0),
//               ...optionControllers.asMap().entries.map((entry) {
//                 final int optionIndex = entry.key;
//                 final TextEditingController controller = entry.value;
//                 return Column(
//                   children: [
//                     TextField(
//                       controller: controller,
//                       decoration: InputDecoration(
//                         hintText: 'Enter option ${optionIndex + 1}',
//                       ),
//                       onChanged: (value) {
//                         final newOptions = List<String>.from(widget.options);
//                         newOptions[optionIndex] = value;
//                         widget.onUpdate(widget.question, newOptions, correctOptionController.text);
//                       },
//                       maxLines: null,
//                     ),
//                   ],
//                 );
//               }).toList(),
//               SizedBox(height: 16.0),
//               TextField(
//                 controller: correctOptionController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter correct answer',
//                 ),
//                 onChanged: (value) {
//                   widget.onUpdate(widget.question, widget.options, value);
//                 },
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: widget.onAddOption,
//                     child: Text('Add Option'),
//                   ),
//                   ElevatedButton(
//                     onPressed: widget.onDelete,
//                     child: Text('Delete Question'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';



// class QuestionCard extends StatefulWidget {
//   final int index;
//   final Map<String, dynamic> questionData;
//   final VoidCallback onDelete;
//   final Function(String, List<String>, int) onUpdate;
//   final VoidCallback onAddOption;
//   final Function(int) onDeleteOption;

//   QuestionCard({
//     required this.index,
//     required this.questionData,
//     required this.onDelete,
//     required this.onUpdate,
//     required this.onAddOption,
//     required this.onDeleteOption,
//   });

//   @override
//   _QuestionCardState createState() => _QuestionCardState();
// }

// class _QuestionCardState extends State<QuestionCard> {
//   late TextEditingController questionController;
//   late List<TextEditingController> optionControllers;
//   late TextEditingController correctOptionController;

//   @override
//   void initState() {
//     super.initState();
//     questionController = TextEditingController(text: widget.questionData['question']);
//     optionControllers = List.generate(
//       widget.questionData['options'].length,
//       (index) => TextEditingController(text: widget.questionData['options'][index]),
//     );
//     correctOptionController = TextEditingController(text: widget.questionData['correctOption'].toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       padding: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextField(
//             controller: questionController,
//             onChanged: (value) {
//               widget.onUpdate(value, widget.questionData['options'], int.parse(correctOptionController.text));
//             },
//             decoration: InputDecoration(
//               hintText: 'Enter question',
//             ),
//           ),
//           SizedBox(height: 8.0),
//           ...optionControllers.asMap().entries.map((entry) {
//             final int optionIndex = entry.key;
//             final TextEditingController controller = entry.value;
//             return Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: controller,
//                     onChanged: (value) {
//                       final newOptions = List<String>.from(widget.questionData['options']);
//                       newOptions[optionIndex] = value;
//                       widget.onUpdate(questionController.text, newOptions, int.parse(correctOptionController.text));
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'Enter option ${optionIndex + 1}',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     widget.onDeleteOption(optionIndex);
//                     setState(() {
//                       optionControllers.removeAt(optionIndex);
//                     });
//                   },
//                 ),
//               ],
//             );
//           }).toList(),
//           ElevatedButton(
//             onPressed: widget.onAddOption,
//             child: Text('Add Option'),
//           ),
//           SizedBox(height: 8.0),
//           TextField(
//             controller: correctOptionController,
//             onChanged: (value) {
//               widget.onUpdate(questionController.text, widget.questionData['options'], int.parse(value));
//             },
//             decoration: InputDecoration(
//               hintText: 'Enter correct option index',
//             ),
//           ),
//           SizedBox(height: 8.0),
//           ElevatedButton(
//             onPressed: widget.onDelete,
//             child: Text('Delete Question'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddExamWidget extends StatelessWidget {
//   final ExamController examController = Get.put(ExamController());

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Create Exam'),
//           TextField(
//             controller: examController.questionTitleController,
//             decoration: InputDecoration(
//               hintText: "Enter Exam Name",
//             ),
//           ),
//           TextField(
//             controller: examController.dateController,
//             decoration: InputDecoration(
//               hintText: "Enter Exam date",
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               examController.sendExamDataToBackend();
//             },
//             child: Text('Submit'),
//           ),
//           SizedBox(height: 20.0),
//           ElevatedButton(
//             onPressed: () {
//               Get.back();
//             },
//             child: Text('Discard'),
//           ),
//           SizedBox(height: 20.0),
//           ElevatedButton(
//             onPressed: () {
//               examController.addQuestion();
//             },
//             child: Text('Add Question'),
//           ),
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 itemCount: examController.questions.length,
//                 itemBuilder: (context, index) {
//                   return QuestionCard(
//                     index: index,
//                     questionData: examController.questions[index],
//                     onDelete: () {
//                       examController.deleteQuestion(index);
//                     },
//                     onUpdate: (question, options, correctOption) {
//                       examController.updateQuestion(index, question, options, correctOption as String);
//                     },
//                     onAddOption: () {
//                       examController.addOption(index);
//                     },
//                     onDeleteOption: (optionIndex) {
//                       examController.deleteOption(index, optionIndex);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExamController1 extends GetxController {
  var _exams = <ExamModel>[].obs;

  List<ExamModel> get exams => _exams;

  TextEditingController questionTitleController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<Map<String, dynamic>> _questions = <Map<String, dynamic>>[].obs;

  List<Map<String, dynamic>> get questions => _questions;

  void addOption(int questionIndex) {
    _questions[questionIndex]['options'].add('');
  }

  void deleteOption(int questionIndex, int optionIndex) {
    _questions[questionIndex]['options'].removeAt(optionIndex);
  }

  void addQuestion() {
    _questions.add({
      'question': '',
      'options': ['', '', '', ''],
      'correctOption': '',
      'time': '30',
      'marks': 1,
    });
  }

  void deleteQuestion(int index) {
    _questions.removeAt(index);
  }

  void updateQuestion(
    int index,
    String question,
    List<String> options,
    String correctOption,
    String time,
    int marks,
  ) {
    _questions[index] = {
      'question': question,
      'options': options,
      'correctOption': correctOption,
      'time': time,
      'marks': marks,
    };
  }

  Future<void> sendExamDataToBackend() async {
    Map<String, dynamic> examData = {
      'name': questionTitleController.text,
      'date': dateController.text,
      'questions': questions.toList(),
    };

    final apiUrl = 'http://localhost:4000/exams'; // Replace with your backend API URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(examData),
      );

      if (response.statusCode == 201) {
        print('Exam data sent successfully');
        _questions.clear();
        questionTitleController.clear();
        dateController.clear();
      } else {
        print('Failed to send exam data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending exam data: $error');
    }
  }

  Future<void> fetchExams() async {
    final apiUrl = 'http://localhost:4000/exams'; // Replace with your backend API URL
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<ExamModel> exams = responseData.map((data) => ExamModel.fromJson(data)).toList();
        _exams.assignAll(exams);
      } else {
        print('Failed to fetch exams. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching exams: $error');
    }
  }

  @override
  void onInit() {
    fetchExams();
    super.onInit();
  }
}

class ExamModel {
  final String name;
  final String date;
  final List<Map<String, dynamic>> questions;

  ExamModel({
    required this.name,
    required this.date,
    required this.questions,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      name: json['name'],
      date: json['date'],
      questions: List<Map<String, dynamic>>.from(json['questions']),
    );
  }
}

class AddExam1 extends StatelessWidget {
  final ExamController1 examController = Get.put(ExamController1());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              examController.addQuestion();
            },
            child: Text('Add Question'),
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
                    time: examController.questions[index]['time'],
                    marks: examController.questions[index]['marks'],
                    onDelete: () {
                      examController.deleteQuestion(index);
                    },
                    onUpdate: (question, options, correctOption, time, marks) {
                      examController.updateQuestion(index, question, options, correctOption, time, marks);
                    },
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              examController.sendExamDataToBackend();
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  final int index;
  final String question;
  final List<String> options;
  final String correctOption;
  final String time;
  final int marks;
  final VoidCallback onDelete;
  final Function(String, List<String>, String, String, int) onUpdate;

  QuestionCard({
    required this.index,
    required this.question,
    required this.options,
    required this.correctOption,
    required this.time,
    required this.marks,
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
  late TextEditingController timeController;
  late TextEditingController marksController;

  @override
  void initState() {
    super.initState();
    questionController = TextEditingController(text: widget.question);
    optionControllers = List.generate(
      widget.options.length,
      (index) => TextEditingController(text: widget.options[index]),
    );
    correctOptionController = TextEditingController(text: widget.correctOption);
    timeController = TextEditingController(text: widget.time);
    marksController = TextEditingController(text: widget.marks.toString());
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
              TextField(
                controller: questionController,
                decoration: InputDecoration(
                  hintText: 'Enter question',
                ),
                onChanged: (value) {
                  widget.onUpdate(value, widget.options, widget.correctOption, widget.time, widget.marks);
                },
                maxLines: null,
              ),
              SizedBox(height: 16.0),
              ...widget.options.asMap().entries.map((entry) {
                final int optionIndex = entry.key;
                final String optionValue = entry.value;
                return Column(
                  children: [
                    TextField(
                      controller: optionControllers[optionIndex],
                      decoration: InputDecoration(
                        hintText: 'Enter option ${optionIndex + 1}',
                      ),
                      onChanged: (value) {
                        final newOptions = List<String>.from(widget.options);
                        newOptions[optionIndex] = value;
                        widget.onUpdate(widget.question, newOptions, widget.correctOption, widget.time, widget.marks);
                      },
                      maxLines: null,
                    ),
                  ],
                );
              }).toList(),
              SizedBox(height: 16.0),
              TextField(
                controller: correctOptionController,
                decoration: InputDecoration(
                  hintText: 'Enter correct answer',
                ),
                onChanged: (value) {
                  widget.onUpdate(widget.question, widget.options, value, widget.time, widget.marks);
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: timeController,
                decoration: InputDecoration(
                  hintText: 'Enter time (in minutes)',
                ),
                onChanged: (value) {
                  widget.onUpdate(widget.question, widget.options, widget.correctOption, value, widget.marks);
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: marksController,
                decoration: InputDecoration(
                  hintText: 'Enter marks',
                ),
                onChanged: (value) {
                  widget.onUpdate(widget.question, widget.options, widget.correctOption, widget.time, int.tryParse(value) ?? 0);
                },
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
