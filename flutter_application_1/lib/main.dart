
import 'package:flutter/material.dart';
import 'package:introapp/data/question.dart';

void main() {
  runApp(const MaterialApp(home: QuestionScreen()));
}

// Stateless => Ekranda değişime uğramayacak, UI widget
// CTRL + .
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.jpg", width: 250),
            const Text(
              "Quiz App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}


// Boilerplate

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  int questionNumber = 0;
  var questionList = questions;
  
  void nextQuestion() {
    setState(() {
      if (questionNumber == 4) {
        questionNumber = 0;
      }else{
        questionNumber++;
      }
      
    }); // değişikliklerin ekrana da yansıtılması için gerekli..
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            questionList[questionNumber].question,
            style: const TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          ...questionList[questionNumber].answers.map((deger) {
            return ElevatedButton(
              onPressed: () {
                nextQuestion();
              },
              child: Text(
                deger,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            );
          })
        ]),
      ),
    );
  }
}