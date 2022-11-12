import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productbox/constants/theme_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData().kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 100,
                        width: Get.width,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 20,
                            );
                          },
                          // physics: const NeverScrollableScrollPhysics(),
                          // shrinkWrap: true,

                          itemCount: 10,
                          itemBuilder: (context, index) {
                            Random random = Random();
                            int randomNumber = random.nextInt(1000) + 1;
                            return CircleAvatar(
                              radius: 40,
                              backgroundColor: MyThemeData().kBackground,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://picsum.photos/id/$randomNumber/200/300'),
                                radius: 35,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.06,
                    ),
                  ],
                ),
              ),
              ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  Random random = Random();
                  int randomNumber = random.nextInt(1000) + 1;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://picsum.photos/id/$randomNumber/200/300'),
                              radius: 30,
                            ),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            const Text(
                              'John Doe',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 39, 51, 92),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://picsum.photos/id/$randomNumber/${(Get.width * 1).toStringAsFixed(0)}/300'))),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
