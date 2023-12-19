import 'package:flutter/material.dart';

class S2App01 extends StatelessWidget {
  const S2App01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications,
              color: Colors.orange.shade500,
              size: 35,
            ),
          )
        ],
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("NewsApp",
            style: TextStyle(
                fontSize: 40,
                color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:  const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Breaking News"
                ,style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        MyImage(pic: "assets/Pictures/camping.jpg",text: "The weather is nice for camping today",),
                        SizedBox(width: 10,),
                        MyImage(pic: "assets/Pictures/SquareSquare.jpg",text: "A square in a square",),
                        SizedBox(width: 10,),
                        MyImage(pic: "assets/Pictures/Neeko.jpg",text: "Happy Halloween",),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("Recent News"
                  ,style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  widthFactor: double.infinity,
                  child: Column(
                    children: const [
                      SizedBox(height: 20,),
                      Item(pic: "assets/Pictures/Champie/Gwen-Champie-Icon.jpeg",text: "Gwen",),
                      SizedBox(height: 10,),
                      Item(pic: "assets/Pictures/Champie/Ivern-Champie-Icon.jpeg",text: "Ivern",),
                      SizedBox(height: 10,),
                      Item(pic: "assets/Pictures/Champie/KaiSa-Champie-Icon.jpeg",text: "Kai'Sa",),
                      SizedBox(height: 10,),
                      Item(pic: "assets/Pictures/Champie/Updated-Vex-Champie-Icon.jpeg",text: "Vex",),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.only(left: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(child: Icon(Icons.home,color: Colors.white,size: 40,)),
            Expanded(child: Icon(Icons.video_collection_outlined,color: Colors.white,size: 40,)),
            Expanded(child: Icon(Icons.save,color: Colors.white,size: 40,)),
          ],
        ),
      ),
    );
  }
}
class Item extends StatelessWidget {
  const Item({Key? key,required this.pic, required this.text}) : super(key: key);
  final String pic,text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 700,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                  width:150,
                  height: 150,
                  child: Image(image: AssetImage(pic,),fit: BoxFit.cover)
              ),
            ),
            const SizedBox(width: 30,),
            Expanded(
              // alignment: Alignment.centerLeft,
              child: Text(text
                  ,style: const TextStyle(
                  // overflow: TextOverflow.ellipsis,
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MyImage extends StatelessWidget {
  const MyImage({ Key? key, required this.pic, required this.text}) : super(key: key);
  final String pic,text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
      Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 450,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image(image: AssetImage(pic),fit: BoxFit.cover),
      ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 400,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]
    );
  }
}
