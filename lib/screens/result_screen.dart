import 'package:flutter/material.dart';
import 'package:quizzer/main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score,{Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Color mainColor = Color(0xFF252c4a);
  Color secondColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Congratulations', style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 20,),
            Text('Your Score is:', style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w400,
            ),
            ),
            SizedBox(height: 50,),
            Text("${widget.score}", style: TextStyle(color: Colors.orange, fontSize: 80, fontWeight: FontWeight.bold, ),
            ),
            SizedBox(height: 60,),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              elevation: 0,
              color: Colors.orange,
              textColor: Colors.white,
              child: Text('Repeat the Quizz'),
            ),
          ],
        ),
      ),
    );
  }
}
