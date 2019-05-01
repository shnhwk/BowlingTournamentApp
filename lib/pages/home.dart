import 'package:bowling_tournament/pages/low_averages.dart';
import 'package:bowling_tournament/pages/tournament_info.dart';
import 'package:bowling_tournament/scoped-models/main.dart';
import 'package:flutter/material.dart';

import './allBowlers.dart';
import './enteredBowlers.dart';

class HomePage extends StatelessWidget {
  final MainModel model;
  HomePage(this.model);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Bowling Tournament"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Bowlers",
                  icon: Icon(Icons.list),
                ),
                Tab(
                  text: "Tournament",
                  icon: Icon(Icons.info_outline),
                ),
                Tab(
                  text: "High Averages",
                  icon: Icon(Icons.trending_up),
                ),
                Tab(
                  text: "Low Averages",
                  icon: Icon(Icons.trending_down),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              AllBowlersPage(model),
              TournamentInfoPage(model),
              EnteredBowlersPage(model),
              LowAveragesPage(model)
            ],
          ),
        ));
  }
}
