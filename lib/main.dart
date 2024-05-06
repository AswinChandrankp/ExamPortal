import 'package:examportal/application/core/Sevices/MenuAppController.dart';
import 'package:examportal/application/core/Sevices/sidebarprovider.dart';
import 'package:examportal/application/core/Sevices/theme_sevices.dart';
import 'package:examportal/application/pages/admin/Homescreen.dart';
import 'package:examportal/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => ThemeServiceProvider()),
        ChangeNotifierProvider(create: (_) => CurrentScreenProvider()),
        ChangeNotifierProvider(create: (_) => MenuAppController()),
      ],
      child: const MyApp(),
    ),
  );
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
      builder: ((context, themeService, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          title: 'Exam Portal',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: Mainscreen(),
        );
      }),
    );
  }
}


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Quiz App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: QuizzesPage(),
//     );
//   }
// }

// class QuizzesPage extends StatelessWidget {
//   final QuizController quizController = Get.put(QuizController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quizzes'),
//       ),
//       body: Obx(() => ListView.builder(
//             itemCount: quizController.quizzes.length,
//             itemBuilder: (context, index) {
//               final quiz = quizController.quizzes[index];
//               return ListTile(
//                 title: Text(quiz.title!),
//                 subtitle: Text(quiz.description!),
//                 onTap: () {
//                   Get.to(QuestionsPage(quizIndex: index));
//                 },
//               );
//             },
//           )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(AddQuizPage());
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class QuestionsPage extends StatelessWidget {
//   final int quizIndex;
//   QuestionsPage({required this.quizIndex});

//   final QuizController quizController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     final quiz = quizController.quizzes[quizIndex];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(quiz.title!),
//       ),
//       body: ListView.builder(
//         itemCount: quiz.questions!.length,
//         itemBuilder: (context, index) {
//           final question = quiz.questions![index];
//           return ListTile(
//             title: Text(question.question!),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: question.options!
//                   .asMap()
//                   .entries
//                   .map(
//                     (entry) => CheckboxListTile(
//                       title: Text(entry.value.text!),
//                       value: entry.value.isCorrect!,
//                       onChanged: (value) {
//                         quizController.toggleOption(
//                           quizIndex,
//                           index,
//                           entry.key,
//                           value!,
//                         );
//                       },
//                     ),
//                   )
//                   .toList(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class AddQuizPage extends StatelessWidget {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   final QuizController quizController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Quiz'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: titleController,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//               ),
//             ),
//             TextFormField(
//               controller: descriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await quizController.addQuiz(
//                     Quiz(
//                       title: titleController.text,
//                       description: descriptionController.text,
//                       questions: [],
//                     ),
//                   );
//                   Get.back();
//                 } catch (e) {
//                   print('Error adding quiz: $e');
//                 }
//               },
//               child: Text('Save Quiz'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class QuizController extends GetxController {
//   final quizzes = <Quiz>[].obs;

//   Future<void> fetchQuizzes() async {
//     final response = await http.get(Uri.parse('http://your-backend-url/quizzes'));
//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body);
//       quizzes.assignAll(responseData.map((data) => Quiz.fromJson(data)).toList());
//     } else {
//       throw Exception('Failed to fetch quizzes');
//     }
//   }

//   Future<void> addQuiz(Quiz quiz) async {
//     final response = await http.post(
//       Uri.parse('http://your-backend-url/quizzes'),
//       body: json.encode(quiz.toJson()),
//       headers: {'Content-Type': 'application/json'},
//     );
//     if (response.statusCode == 201) {
//       quizzes.add(quiz);
//     } else {
//       throw Exception('Failed to add quiz');
//     }
//   }

//   void toggleOption(int quizIndex, int questionIndex, int optionIndex, bool value) {
//     quizzes[quizIndex].questions![questionIndex].options![optionIndex].isCorrect = value;
//   }
// }

// class Quiz {
//   final String? id;
//   final String? title;
//   final String? description;
//   final List<Question>? questions;

//   Quiz({this.id, this.title, this.description, this.questions});

//   factory Quiz.fromJson(Map<String, dynamic> json) {
//     return Quiz(
//       id: json['_id'],
//       title: json['title'],
//       description: json['description'],
//       questions: (json['questions'] as List<dynamic>?)
//           ?.map((question) => Question.fromJson(question))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'description': description,
//       'questions': questions?.map((question) => question.toJson()).toList(),
//     };
//   }
// }

// class Question {
//   final String? question;
//   final List<Option>? options;

//   Question({this.question, this.options});

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       question: json['question'],
//       options: (json['options'] as List<dynamic>?)
//           ?.map((option) => Option.fromJson(option))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'question': question,
//       'options': options?.map((option) => option.toJson()).toList(),
//     };
//   }
// }

// class Option {
//   final String? text;
//   bool? isCorrect;

//   Option({this.text, this.isCorrect});

//   factory Option.fromJson(Map<String, dynamic> json) {
//     return Option(
//       text: json['text'],
//       isCorrect: json['isCorrect'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'text': text,
//       'isCorrect': isCorrect,
//     };
//   }
// }
