import 'package:flutter/material.dart';

import 'alert_dialog.dart';
import 'avatar.dart';

List<String> houses = [
  'City Light',
  'New Brand',
  'Styles',
  'Class Dream',
];

class WorkshopHome extends StatelessWidget {
  const WorkshopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Detail User',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/Pictures/Workshop/flutter-logo.jpg'),
                    radius: 50,
                  ),
                ),
                Text(
                  'Vincentius Rangga',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '@vince •',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      ' 1 ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Friend',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'I am interested in the field of '
                    'application interface design and the design process'
                        '\nDone in two hours with Aya',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      myIcon: Icons.share_outlined,
                      text: 'Share',
                    ),
                    MyButton(
                      myIcon: Icons.settings_outlined,
                      text: 'Settings',
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Houses',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 170, child: HouseList()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Chats',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                ChatList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.myIcon, required this.text});

  final IconData myIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.43,
      child: ElevatedButton(
        onPressed: () {
          text == 'Share'
              ? showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const ShareAlert())
              : print('settings');
        },
        style: const ButtonStyle(
            elevation: MaterialStatePropertyAll<double>(0),
            backgroundColor: MaterialStatePropertyAll<Color>(
                Color.fromRGBO(245, 245, 245, 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(myIcon, color: Colors.grey),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class HouseList extends StatelessWidget {
  const HouseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: houses.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => House(
        text: houses[index],
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) => const Chat(),
    );
  }
}

class House extends StatelessWidget {
  const House({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
        left: 5,
        top: 15,
        bottom: 15,
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/Pictures/Workshop/flutter-logo.jpg'),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: SizedBox(width: 60, child: Avatar()),
      title: Text(
        'Share A Daily Update',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Alexandro • Just Now',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: SizedBox(
        width: 70,
        child: Row(
          children: [
            Icon(Icons.access_time),
            SizedBox(width: 5,),
            Text('20 sec'),
          ],
        ),
      ),
    );
  }
}
