import 'package:scoped_model/scoped_model.dart';

import 'package:bowling_tournament/scoped-models/bowlers.dart';

class MainModel extends Model with ConnectedBowlersModel, BowlersModel{
}