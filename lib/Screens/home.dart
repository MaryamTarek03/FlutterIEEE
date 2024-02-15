import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/BMI%20Calc/bmi_login.dart';
import 'package:flutterieee/Screens/Grid/grid_view.dart';
import 'package:flutterieee/Screens/s3.dart';
import 'package:flutterieee/Screens/session02.dart';
import 'package:flutterieee/Screens/task01.dart';
import 'package:flutterieee/Screens/workshop/my_home_page.dart';
import 'package:google_fonts/google_fonts.dart';

const Color homeColor = Color.fromRGBO(221, 153, 153, 1);

final List<Widget> pages = [
  const WhatsAppHome(),
  const NewsApp(),
  const PointsCounter(),
  const MyGridView(),
  const BmiLogin(),
  const WorkshopHome(),
];

final List<String> pageNames = [
  'WhatsApp',
  'News App',
  'Points Counter',
  'Grid View',
  'BMI Calculator',
  'Profile Chats'
];

final List<IconData> pageIcons = [
  Icons.chat,
  Icons.newspaper,
  Icons.control_point_duplicate,
  Icons.grid_view_rounded,
  Icons.monitor_weight_rounded,
  Icons.person_pin,
];

final List<String> pageImages = [
  'assets/Pictures/Home/whatsapp.png',
  'assets/Pictures/Home/news2.PNG',
  'assets/Pictures/Home/news.PNG',
  'assets/Pictures/Home/Grid.png',
  'assets/Pictures/Home/BMI.png',
  'assets/Pictures/Home/BMI.png',
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => pages[index]));
          },
          child: ListTile(
            title: Text(
              pageNames[index],
              style: GoogleFonts.cabin(
                color: homeColor,
                fontSize: 24,
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
              pageIcons[index],
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
      itemCount: pages.length,
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
