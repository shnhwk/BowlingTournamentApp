import 'package:bowling_tournament/models/bowler.dart';
import 'package:bowling_tournament/scoped-models/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BowlerCardSlidable extends StatefulWidget {
  final Bowler bowler;
  final MainModel model;

  BowlerCardSlidable(this.bowler, this.model);

  @override
  _BowlerCardSlidableState createState() => _BowlerCardSlidableState();
}

class _BowlerCardSlidableState extends State<BowlerCardSlidable> {
 

  Widget _buildCircleAvatar(Bowler bowler) {
    if (bowler.entered) {
      return new CircleAvatar(
        backgroundColor: bowler.paid ? Colors.green : Colors.black38,
        child:
            bowler.paid ? Icon(Icons.monetization_on) : Icon(Icons.money_off),
        foregroundColor: Colors.white,
      );
    } else {
      return Text("");
    }
  }

  Widget _bowlerInfo() {
    return Container(
      color: Colors.white,
      child: new ListTile(
        leading: _buildCircleAvatar(widget.bowler),
        title: new Text(widget.bowler.name),
        subtitle: new Text('Average: ${widget.bowler.average.toString()}'),
      ),
    );
  }

  Widget _buildEnteredSlideAction(Bowler bowler) {
    return IconSlideAction(
      caption: bowler.entered ? 'Entered' : "Not Entered",
      color: bowler.entered ? Colors.green : Colors.black45,
      icon: bowler.entered ? Icons.check_circle_outline : Icons.add_circle,
      closeOnTap: false,
      onTap: () => {
            bowler.entered = !bowler.entered,
            _updateBowler(context, widget.bowler)
          },
    );
  }

  Widget _buildPaidSlideAction(Bowler bowler) {
    return IconSlideAction(
      caption: bowler.paid ? 'Paid' : "Not Paid",
      color: bowler.paid ? Colors.green : Colors.black45,
      icon: bowler.paid ? Icons.monetization_on : Icons.money_off,
      onTap: () =>
          {bowler.paid = !bowler.paid, _updateBowler(context, widget.bowler)},
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Slidable(
      delegate: new SlidableDrawerDelegate(),
 
      actionExtentRatio: 0.25,
      child: _bowlerInfo(),
      secondaryActions: <Widget>[
        _buildEnteredSlideAction(widget.bowler),
        _buildPaidSlideAction(widget.bowler)
      ],
    );
  }

  Future _updateBowler(BuildContext context, Bowler bowler) async {
    if (!await widget.model.updateBowler(bowler)) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: new Text("Shit fucked up!")));
    }
  }
}
