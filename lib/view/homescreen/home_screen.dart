import 'package:app_quizz_sample2/utils/colorconstant.dart';
import 'package:app_quizz_sample2/view/dummydb.dart';
import 'package:app_quizz_sample2/view/globalwidget/containerscreen.dart';
import 'package:app_quizz_sample2/view/questionscreen/questionscreen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colorconstant.bluegrey,
       appBar: AppBar(
        backgroundColor: Colorconstant.bluegrey,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi,sneha",
              style: TextStyle(
                  color: Colorconstant.TextWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Let's make this day productive",
              style: TextStyle(
                  color: Colorconstant.TextWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 30,
            backgroundImage:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTY7IalweT6rzWlH1LchOCzffcQrqbdM2Vvw&s") ,
          ),
          SizedBox(
            width: 5,
          ),
      
      
        
        ]
       ),
        
      
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Center(
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
            color: Colorconstant.Containerclr,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    // child: Image(
                    //   image:NetworkImage("")
                    // ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Ranking",
                          style: TextStyle(
                              color: Colorconstant.TextWhite,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "300",
                          style: TextStyle(
                              color:Colorconstant.TextWhite,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
           
            Container(
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    // child: Image(
                    //   image:NetworkImage("")
                        
                      
                    // ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Points",
                          style: TextStyle(
                              color: Colorconstant.TextWhite,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "1209",
                          style: TextStyle(
                              color:Colorconstant.TextWhite,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
            
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's Play",
                    style: TextStyle(
                        color: Colorconstant.TextWhite,
                        fontSize: 23,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.9),
                      itemCount: Dummydb.items.length,
                      itemBuilder: (context, index) => ContainerScreen(
                        oncontainerTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionScreen(
                                  itemname: Dummydb.items[index]["items"],
                                ),
                              ));
                        },
                        image: Dummydb.items[index]["images"],
                        items: Dummydb.items[index]["items"],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}