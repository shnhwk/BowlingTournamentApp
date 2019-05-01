import 'package:bowling_tournament/scoped-models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class TournamentInfoPage extends StatefulWidget {
  final MainModel model;

  TournamentInfoPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _TournamentInfoPageState();
  }
}

class _TournamentInfoPageState extends State<TournamentInfoPage> {
  @override
  void initState() {
    widget.model.fetchTournament();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Number Entered: ' + model.tournament.numberEntered.toString(),
                style: TextStyle(fontSize: 21),
              ),
              Text(
                'Cutoff Average: ' + model.tournament.cutoffAverage.toString(),
                style: TextStyle(fontSize: 21),
              ),
              Text(
                'Total Money: ' ,
                style: TextStyle(fontSize: 21),
              )
            ],
          ),
        );
      },
    );
  }
}
