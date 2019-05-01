import 'package:bowling_tournament/scoped-models/main.dart';
import 'package:bowling_tournament/widgets/bowler_card.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LowAveragesPage extends StatefulWidget {
  final MainModel model;

  LowAveragesPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _LowAveragesPageState();
  }
}

class _LowAveragesPageState extends State<LowAveragesPage> {
  @override
  void initState() {
    widget.model.fetchTournament();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Container(
 
          child: Row(
            children: <Widget>[
 
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      BowlerCard(model.tournament.lowAverages[index]),
                  itemCount: model.tournament.lowAverages.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
