import 'package:app_quizz_sample2/utils/colorconstant.dart';
import 'package:app_quizz_sample2/view/dummydb.dart';
import 'package:app_quizz_sample2/view/questionscreen/questionscreen.dart';
import 'package:flutter/material.dart';


class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.RightanswerCount});
  final int RightanswerCount;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int starCount = 0;

  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colorconstant.bluegrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      left: 15, right: 15, bottom: index == 1 ? 30 : 0),
                  child: Icon(
                    Icons.star,
                    color: index < starCount
                        ? Colorconstant.Gold
                        : Colorconstant.Containerclr,
                    size: index == 1 ? 80 : 50,
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "Congratulations",
            style: TextStyle(
                fontSize: 26,
                color: Colorconstant.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 26),
          Text("Your score",
              style: TextStyle(
                color: Colorconstant.primaryColor,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "${widget.RightanswerCount} / ${Dummydb.SportsList.length}",
            style: TextStyle(
                color: Colorconstant.primaryColor,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colorconstant.Containerclr,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.replay,color:Colorconstant.primaryColor,),
                
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuestionScreen(itemname: "itemname")));
                  },
                  child: Text(
                    "Retry",
                    style: TextStyle(
                        color: Colorconstant.TextWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ],
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colorconstant.Containerclr,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home,color: Colorconstant.TextWhite,),
              
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                        color: Colorconstant.TextWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ],
            )),
          ),
       
        ],
      ),
    );
  }
}
