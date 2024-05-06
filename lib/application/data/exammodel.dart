// class exammodel {
//   String? sId;
//   String? title;
//   String? description;
//   List<Questions>? questions;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

//   exammodel(
//       {this.sId,
//       this.title,
//       this.description,
//       this.questions,
//       this.createdAt,
//       this.updatedAt,
//       this.iV});

//   exammodel.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//     description = json['description'];
//     if (json['questions'] != null) {
//       questions = <Questions>[];
//       json['questions'].forEach((v) {
//         questions!.add(new Questions.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     if (this.questions != null) {
//       data['questions'] = this.questions!.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

// class Questions {
//   String? question;
//   List<Options>? options;
//   int? marks;
//   int? time;
//   String? sId;

//   Questions({this.question, this.options, this.marks, this.time, this.sId});

//   Questions.fromJson(Map<String, dynamic> json) {
//     question = json['question'];
//     if (json['options'] != null) {
//       options = <Options>[];
//       json['options'].forEach((v) {
//         options!.add(new Options.fromJson(v));
//       });
//     }
//     marks = json['marks'];
//     time = json['time'];
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['question'] = this.question;
//     if (this.options != null) {
//       data['options'] = this.options!.map((v) => v.toJson()).toList();
//     }
//     data['marks'] = this.marks;
//     data['time'] = this.time;
//     data['_id'] = this.sId;
//     return data;
//   }
// }

// class Options {
//   String? text;
//   bool? isCorrect;
//   String? sId;

//   Options({this.text, this.isCorrect, this.sId});

//   Options.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//     isCorrect = json['isCorrect'];
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['text'] = this.text;
//     data['isCorrect'] = this.isCorrect;
//     data['_id'] = this.sId;
//     return data;
//   }
// }



// class exammodel {
//   String? sId;
//   String? name;
//   String? date;
//   List<Questions>? questions;
//   int? iV;

//   exammodel({this.sId, this.name, this.date, this.questions, this.iV});

//   exammodel.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     date = json['date'];
//     if (json['questions'] != null) {
//       questions = <Questions>[];
//       json['questions'].forEach((v) {
//         questions!.add(new Questions.fromJson(v));
//       });
//     }
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['date'] = this.date;
//     if (this.questions != null) {
//       data['questions'] = this.questions!.map((v) => v.toJson()).toList();
//     }
//     data['__v'] = this.iV;
//     return data;
//   }
// }

// class Questions {
//   String? question;
//   List<String>? options;
//   String? correctOption;

//   Questions({this.question, this.options, this.correctOption});

//   Questions.fromJson(Map<String, dynamic> json) {
//     question = json['question'];
//     options = json['options'].cast<String>();
//     correctOption = json['correctOption'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['question'] = this.question;
//     data['options'] = this.options;
//     data['correctOption'] = this.correctOption;
//     return data;
//   }
// }



// exammodel.dart
class ExamModel {
  final String? id;
  final String? name;
  final String? date;
  final List<Question>? questions;
  final int? iv;

  ExamModel({this.id, this.name, this.date, this.questions, this.iv});

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['_id'],
      name: json['name'],
      date: json['date'],
      questions: (json['questions'] as List<dynamic>?)
          ?.map((questionJson) => Question.fromJson(questionJson))
          .toList(),
      iv: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'date': date,
      'questions': questions?.map((question) => question.toJson()).toList(),
      '__v': iv,
    };
  }
}

class Question {
  final String? question;
  final List<String>? options;
  final String? correctOption;

  Question({this.question, this.options, this.correctOption});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: (json['options'] as List<dynamic>?)?.cast<String>(),
      correctOption: json['correctOption'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'correctOption': correctOption,
    };
  }
}
