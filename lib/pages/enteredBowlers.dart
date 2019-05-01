import 'package:bowling_tournament/scoped-models/main.dart';
import 'package:bowling_tournament/widgets/bowler_card2.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EnteredBowlersPage extends StatefulWidget {
  final MainModel model;

  EnteredBowlersPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _EnteredBowlersPageState();
  }
}

class _EnteredBowlersPageState extends State<EnteredBowlersPage> {
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

        return Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      BowlerCardSlidable(
                          model.tournament.highAverages[index], model),
                  itemCount: model.tournament.highAverages.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
