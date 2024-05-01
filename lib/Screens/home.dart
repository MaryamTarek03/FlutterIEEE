import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/BMI%20Calc/bmi_login.dart';
import 'package:flutterieee/Screens/Calculator/presentation/screens/main_calc.dart';
import 'package:flutterieee/Screens/Counter/counter.dart';
import 'package:flutterieee/Screens/Grid/grid_view.dart';
import 'package:flutterieee/Screens/OtherScreens/s3.dart';
import 'package:flutterieee/Screens/OtherScreens/session02.dart';
import 'package:flutterieee/Screens/OtherScreens/task01.dart';
import 'package:flutterieee/Screens/ToDo/presentation/screens/todo_home.dart';
import 'package:flutterieee/Screens/workshop/my_home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_model.dart';

const Color homeColor = Color.fromRGBO(221, 153, 153, 1);

List<HomeModel> mainPages = [
  HomeModel(
    name: 'WhatsApp',
    page: const WhatsAppHome(),
    icon: FontAwesomeIcons.whatsapp,
  ),
  HomeModel(
    name: 'News App',
    page: const NewsApp(),
    icon: Icons.newspaper,
  ),
  HomeModel(
    name: 'Points Counter',
    page: const PointsCounter(),
    icon: Icons.control_point_duplicate,
  ),
  HomeModel(
    name: 'Grid View',
    page: const MyGridView(),
    icon: Icons.grid_view_rounded,
  ),
  HomeModel(
    name: 'BMI Calculator',
    page: const BmiLogin(),
    icon: Icons.monitor_weight_rounded,
  ),
  HomeModel(
    name: 'Profile Chats',
    page: const WorkshopHome(),
    icon: Icons.person_pin,
  ),
  HomeModel(
    name: 'Calculator',
    page: const Calculator(),
    icon: Icons.calculate,
  ),
  HomeModel(
    name: 'Counter',
    page: const Counter(),
    icon: Icons.add_circle_outline_rounded,
  ),
  HomeModel(
    name: 'To Do',
    page: ToDoHome(),
    icon: Icons.task_alt_rounded,
  ),
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 10),
                child: Image(
                  image: const AssetImage("assets/Pictures/chairandtable.png"),
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              Text(
                "H  O  M  E",
                style: GoogleFonts.aDLaMDisplay(
                  fontSize: 60,
                  color: homeColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TaskList()
            ],
          ),
        ),
      ),
    );
  }
}

class TaskButton extends StatelessWidget {
  const TaskButton({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        // color: Colors.white70,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => mainPages[index].page));
          },
          child: ListTile(
            title: Text(
              mainPages[index].name,
              style: GoogleFonts.cabin(
                color: homeColor,
                fontSize: 20,
              ),
            ),
            leading: Text(
              '${index + 1}',
              style: const TextStyle(
                fontSize: 40,
                color: homeColor,
                // Colors.deepPurple[200],
              ),
            ),
            trailing: Icon(
              mainPages[index].icon,
              size: 30,
              color: homeColor,
              // Colors.purple[200],
              // width: MediaQuery.of(context).size.width * 0.1,
            ),
            horizontalTitleGap: 50,
            titleAlignment: ListTileTitleAlignment.center,
          ),
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mainPages.length,
      itemBuilder: (context, idx) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: TaskButton(index: idx),
        );
      },
    );
  }
}
