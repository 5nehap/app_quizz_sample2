
import 'package:app_quizz_sample2/utils/colorconstant.dart';
import 'package:flutter/material.dart';


class ContainerScreen extends StatelessWidget {
  final String image;
  final String items;
  final void Function()? oncontainerTap;
  const ContainerScreen(
      {super.key,
      required this.image,
      required this.items,
      required this.oncontainerTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: oncontainerTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colorconstant.Containerclr,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Image.network(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items,
                      style: TextStyle(
                          color: Colorconstant.TextWhite, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "10 Questions",
                      style: TextStyle(
                          color: Colorconstant.TextWhite, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}