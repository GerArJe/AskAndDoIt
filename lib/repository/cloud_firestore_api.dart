import 'package:ask_and_doit/model/Question.dart';
import 'package:ask_and_doit/model/challenge.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class CloudFirestoreAPI {

  //bring questions and select one randomly
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

  //bring challenges and select one randomly
  String getRandomChallenge(List<DocumentSnapshot> questionsListSnapshot) {
    List<Challenge> challenges = List<Challenge>();

    questionsListSnapshot.forEach((c) {
      challenges.add(Challenge(
          number: c.data['number'],
          challenge: c.data['challenge']
      ));
    });

    var random = new Random();
    int index = random.nextInt(challenges.length);

    return challenges.elementAt(index).challenge;
  }
}
