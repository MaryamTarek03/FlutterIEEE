import 'package:flutter/material.dart';

class WhatsAppHome extends StatelessWidget {
  const WhatsAppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        titleSpacing: 20,
        elevation: 0,
        actions: const [
          Icon(Icons.search),
          Icon(Icons.more_vert)
        ],
        title: const Text("WhatsApp"
        ,style:TextStyle(
            fontSize: 40,
          ),),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("CHAT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text("STATUS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),),
                  SizedBox(
                    width: 80,
                  ),
                  Text("CALLS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            const Chat(name: 'Maryam', txt: 'Maryam Subtitle 01'),
            const SizedBox(height: 15,),
            const Chat(name: 'Tarek', txt: 'Tarek Subtitle 02'),
            const SizedBox(height: 15,),
            const Chat(name: 'Saeed', txt: 'Saeed Subtitle 03'),
            const SizedBox(height: 15,),
            const Chat(name: 'Mohamed', txt: 'Mohamed Subtitle 04'),
            const SizedBox(height: 15,),
            const Chat(name: 'Ashour', txt: 'Ashour Subtitle 05'),
          ],
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({Key? key, required this.name, required this.txt}) : super(key: key);
  final String name,txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 15,
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('lib/Pictures/wallpaperflare.com_wallpaper (21).jpg',),
          radius: 40,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(name,style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),),
            Text(txt,style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),)
          ],
        )
      ],
    );
  }
}
