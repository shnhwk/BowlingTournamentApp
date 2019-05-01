import 'package:bowling_tournament/models/bowler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BowlerCardSlidable extends StatelessWidget {
  final Bowler bowler;

  BowlerCardSlidable(this.bowler);
  final SlidableController slidableController = new SlidableController();


  @override
  Widget build(BuildContext context) {
    return new Slidable(
      delegate: new SlidableDrawerDelegate(),
      controller: slidableController,
      actionExtentRatio: 0.25,
      child: new Container(
        color: Colors.white,
        child: new ListTile(
          leading: new CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Icon(Icons.input),
            foregroundColor: Colors.white,
          ),
          title: new Text(bowler.name),
          subtitle: new Text('Average: ${bowler.average.toString()}'),
        ),
      ),
      
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => _showSnackBar(context, 'More ' + bowler.bowlerId.toString()),
        ),
        new IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar(context, 'Delete'),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: new Text(text)));
  }
}
