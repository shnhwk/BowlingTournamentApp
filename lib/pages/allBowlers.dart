import 'package:bowling_tournament/scoped-models/main.dart';
import 'package:bowling_tournament/widgets/bowler_card2.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AllBowlersPage extends StatefulWidget {
  final MainModel model;

  AllBowlersPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _AllBowlersPageState();
  }
}

class _AllBowlersPageState extends State<AllBowlersPage> {
  @override
  void initState() {
    widget.model.fetchBowlers();
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

      return ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            BowlerCardSlidable(model.bowlers[index], model),
        itemCount: model.bowlers.length,
      );
    });
  }
}
