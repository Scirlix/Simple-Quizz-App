import 'package:flutter/material.dart';
import 'package:quizzer/data/questions_list.dart';
import 'package:quizzer/screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color mainColor = Color(0xFF252c4a);
  Color secondColor = Colors.blueAccent;
  PageController? _controller = PageController(initialPage: 0);

  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.blueAccent;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page) {
            setState(() {
                  isPressed = false;
                }
              );
          },
          itemCount:  questions.length,

          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text("Question ${index + 1} / ${questions.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 28,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8,
                  thickness: 1,
                ),
                const SizedBox(height: 20,),
                Text(questions[index].question!,
                  style: const  TextStyle(
                    color: Colors.white,
                    fontSize: 28,

                  ),
                ),
                SizedBox(height: 35),
                for(int i=0; i<questions[index].answer!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 18),
                    child: MaterialButton(
                        shape: StadiumBorder(),
                        color: isPressed ? questions[index].answer!.entries.toList()[i].value?isTrue : isWrong : secondColor,
                        padding: EdgeInsets.symmetric(vertical:18 ),
                        onPressed: isPressed ? () {}
                            : () {
                                  setState((){
                                    isPressed = true;
                                  }
                                  );
                                  if(questions[index].answer!.entries.toList()[i].value){
                                    score +=10;
                                    //print(score);

                                  }
                                },
                        child: Text(questions[index].answer!.keys.toList()[i], style: const TextStyle(color: Colors.white),),
                    ),
                  ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.orange, width: 1),
                        ),
                        onPressed: isPressed
                            ? index + 1 == questions.length? () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            ResultScreen(score)));
                        }
                            : () {
                        _controller!.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                        setState(() {
                          isPressed = false;
                        });
                        }
                            : null ,
                        child: Text(
                            index + 1 == questions.length ? "See Results": "Next Question"
                            ,
                            style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                    ),
                  ],
                ),
              ],
            );
          },
        ) ,
      ),
    );
  }
}
