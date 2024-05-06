import 'dart:convert';

import 'package:examportal/api/api.dart';
import 'package:examportal/application/data/exammodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



// examcontroller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:examportal/application/core/models/exammodel.dart';

class ExamController extends GetxController {
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
    _questions.add({'question': '', 'options': ['', '', '', ''], 'correctOption': ''});
  }

  void deleteQuestion(int index) {
    _questions.removeAt(index);
  }

  void updateQuestion(int index, String question, List<String> options, String correctOption) {
    _questions[index] = {'question': question, 'options': options, 'correctOption': correctOption};
  }

  Future<void> sendExamDataToBackend() async {
    // Prepare exam data
    Map<String, dynamic> examData = {
      'name': questionTitleController.text,
      'date': dateController.text,
      'questions': questions.toList(),
    };

    // Backend API URL
    final apiUrl = 'http://localhost:4000/exams'; // Replace with your backend API URL

    try {
      // Send exam data to backend
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(examData),
      );

      // Check if the request was successful
      if (response.statusCode == 201) {
        print('Exam data sent successfully');
        // Clear exam data after sending it to the backend
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
