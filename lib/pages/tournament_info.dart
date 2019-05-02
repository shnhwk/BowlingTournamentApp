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
        if (model.isLoading)
          return Container(
              child: Center(
            child: CircularProgressIndicator(),
          ));

        return Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Number Entered: ' + model.tournament.numberEntered.toString(),
                style: TextStyle(fontSize: 19),
              ),
              Text(
                'Cutoff Average: ' + model.tournament.cutoffAverage.toString(),
                style: TextStyle(fontSize: 19),
              ),
              Text(
                'Total Money: ' + model.tournament.totalMoney.toString(),
                style: TextStyle(fontSize: 19),
              ),
              Text(
                'Money owed to alley: ' +
                    model.tournament.moneyOwedToAlley.toString(),
                style: TextStyle(fontSize: 19),
              ),
              Text(
                'Prize Money: ' + model.tournament.prizeMoney.toString(),
                style: TextStyle(fontSize: 19),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                "Suggested Prize Breakdown",
                style: TextStyle(fontSize: 19),
              ),
              Text(
                '1st: ' + model.tournament.firstPlace.toString(),
                style: TextStyle(fontSize: 19),
              ),
              Text(
                '2nd: ' + model.tournament.secondPlace.toString(),
                style: TextStyle(fontSize: 19),
              ),
              Text(
                '3rd: ' + model.tournament.thirdPlace.toString(),
                style: TextStyle(fontSize: 19),
              ),
              Text(
                '4th: ' + model.tournament.fourthPlace.toString(),
                style: TextStyle(fontSize: 19),
              )
            ],
          ),
        );
      },
    );
  }
}
