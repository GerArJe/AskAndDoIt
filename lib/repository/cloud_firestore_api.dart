import 'package:ask_and_doit/model/Question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class CloudFirestoreAPI {

  String getRandomQuestion(List<DocumentSnapshot> questionsListSnapshot) {
    List<Question> questions = List<Question>();

    questionsListSnapshot.forEach((q) {
      questions.add(Question(
        number: q.data['number'],
        question: q.data['question']
      ));
    });

    var random = new Random();
    int index = random.nextInt(questions.length);

    return questions.elementAt(index).question;
  }
}
