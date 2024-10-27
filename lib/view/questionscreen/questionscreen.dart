import 'dart:async';
import 'package:app_quizz_sample2/utils/colorconstant.dart';
import 'package:app_quizz_sample2/view/dummydb.dart';
import 'package:app_quizz_sample2/view/resultscreen/resultscreen.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionScreen extends StatefulWidget {
  final String itemname;
  const QuestionScreen({super.key, required this.itemname});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var itemlist = [];
  int count = 0;
  int? selectedanswerindex;
  int rightAnswerCount = 0;

  CountDownController _timecontroller = CountDownController();

  @override
  void initState() {
    super.initState();
    items();
  }

  void items() {
    if (widget.itemname == "General Knowledge") {
      itemlist = Dummydb.GeneralknowledgeList;
    } else if (widget.itemname == "sports") {
      itemlist = Dummydb.SportsList;
    } else if (widget.itemname == "Maths") {
      itemlist = Dummydb.mathsList;
    } else if (widget.itemname == " informational technology") {
      itemlist = Dummydb.technologyList;
    } else {
      itemlist = Dummydb.ScienceList;
    }
  }

  void nextQuestion() {
    if (count < itemlist.length - 1) {
      setState(() {
        count++;
        selectedanswerindex = null; // Reset selected answer 
      });
    } else {
      // Navigate to the result screen if it was the last question
      //push replacement
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            RightanswerCount: rightAnswerCount,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colorconstant.bluegrey,
        title: LinearPercentIndicator(
          center: Text("${((count + 1) / itemlist.length * 100).toStringAsFixed(1)}%"),
          width: 250.0,
          lineHeight: 35.0,
          percent: (count + 1) / itemlist.length,
          backgroundColor: Colorconstant.TextWhite,
          progressColor: Colorconstant.Containerclr,
          trailing: Icon(
              Icons.mood,
              color: Colorconstant.Containerclr
        ),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        itemlist[count]["question"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colorconstant.TextWhite,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colorconstant.Containerclr, width: 5),
                      color: Colorconstant.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 170,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundColor: Colorconstant.TextWhite,
                        child: CircularCountDownTimer(
                          duration: 30,
                          initialDuration: 0,
                          controller: _timecontroller,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          ringColor: Colors.grey[300]!,
                          fillColor: Colors.purpleAccent[100]!,
                          backgroundColor:Colors.purple,
                          strokeWidth: 8.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textFormat: CountdownTextFormat.S,
                          isReverse: false,
                          autoStart: true,
                          onComplete: () {
                            selectedanswerindex = null;
                            nextQuestion();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(
                itemlist[count]["options"].length,
                (index) => Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      if (selectedanswerindex == null) {
                        setState(() {
                          selectedanswerindex = index;
                          if (index == itemlist[count]["answerindex"]) {
                            rightAnswerCount++;
                          }
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: getColor(index), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            itemlist[count]["options"][index],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colorconstant.TextWhite,
                            ),
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: Colorconstant.Containerclr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (selectedanswerindex != null)
              InkWell(
                onTap: () {
                  nextQuestion();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colorconstant.Containerclr,
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colorconstant.TextWhite,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color getColor(int optionIndex) {
    if (selectedanswerindex != null) {
      if (optionIndex == itemlist[count]["answerindex"]) {
        return Colorconstant.Green; // Correct answer
      }
      if (optionIndex == selectedanswerindex) {
        return Colorconstant.Red; // Selected answer is wrong
      }
    }
    return Colorconstant.Containerclr; // Default color for unselected options
  }
}

