import 'package:flutter/material.dart';

class PointsCounter extends StatefulWidget {
  const PointsCounter({super.key});

  @override
  State<PointsCounter> createState() => _PointsCounterState();
}

int team1 = 0,team2 = 0;
class _PointsCounterState extends State<PointsCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: 'Points Counter',
          child: Text("Points Counter",style: TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
          ),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              item(teamNumber: 1),
              item(teamNumber: 2),
            ],
          ),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  team1 = 0;
                  team2 = 0;
                });
              },
              child: const Text("Reset", style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    );
  }
  Widget item({required int teamNumber})
  {
    return Column(
      children: [
        Text("Team $teamNumber",
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        Text(teamNumber == 1? '$team1' : '$team2',

          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        myButton(count: 2, teamNumber: teamNumber),
        const SizedBox(height: 10,),
        myButton(count: 4, teamNumber: teamNumber),
        const SizedBox(height: 10,),
        myButton(count: 6, teamNumber: teamNumber),
      ],
    );
  }
  Widget myButton({
    required int count,
    required int teamNumber,
  })
  {
    return ElevatedButton(
      onPressed: (){
        setState(() {
          teamNumber == 1? team1 += count : team2 += count;
        });
      },
      child: Text('Add $count points'),
    );
  }
}







///....Ruined....///








class Item extends StatefulWidget {
  const Item({super.key, required this.team});
  final int team;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Team ${widget.team}",
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        Text(widget.team == 1? '$team1' : '$team2',

          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        myButton(count: 2, teamNumber: widget.team),
        const SizedBox(height: 10,),
        myButton(count: 4, teamNumber: widget.team),
        const SizedBox(height: 10,),
        myButton(count: 6, teamNumber: widget.team),
      ],
    );
  }
  Widget myButton({
    required int count,
    required int teamNumber,
  })
  {
    return ElevatedButton(
      onPressed: (){
        setState(() {
          teamNumber == 1? team1 += count : team2 += count;
        });
      },
      child: Text('Add $count points'),
    );
  }
}

















class MyButton extends StatefulWidget {
  const MyButton({super.key, required this.count, required this.teamNumber});
  final int count, teamNumber;
  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        setState(() {
          widget.teamNumber == 1? team1 += widget.count : team2 += widget.count;
        });
      },
      child: Text('Add ${widget.count} points'),
    );
  }
}