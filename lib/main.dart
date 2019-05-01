import 'package:bowling_tournament/scoped-models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/home.dart';
import './models/bowler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainModel _model = MainModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange, accentColor: Colors.deepPurple),
        title: appTitle,
        home: HomePage(_model),
        routes: {},
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'bowler') {
            final int bowlerId = int.parse(pathElements[2]);
            final Bowler bowler = _model.bowlers.firstWhere((Bowler bowler) {
              return bowler.bowlerId == bowlerId;
            });

            return null;
          }
        },
      ),
    );
  }
}
