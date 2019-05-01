import 'package:bowling_tournament/models/bowler.dart';
import 'package:flutter/material.dart';

class BowlerCard extends StatelessWidget {
  final Bowler bowler;

  BowlerCard(this.bowler);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(bowler.name),
          subtitle: Column(  crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Average: " + bowler.average.toString()),
              Text("Handicap: " + bowler.handicap.toString()),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.edit,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return null;
                  },
                ),
              );
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}
