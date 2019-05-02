import 'dart:convert';
import 'dart:async';

import 'package:bowling_tournament/models/tournament.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import 'package:bowling_tournament/models/bowler.dart';

mixin ConnectedBowlersModel on Model {
  List<Bowler> _bowlers = [];
  int _selBowlerId;
  bool _isLoading = false;
  Tournament tournament;
}

mixin BowlersModel on ConnectedBowlersModel {
  List<Bowler> get bowlers {
    return List.from(_bowlers);
  }

  bool get isLoading{
    return _isLoading;
  }

  void addBowler(Bowler bowler) {
    _bowlers.add(bowler);
  }

  int get selectedBowlerIndex {
    return _bowlers.indexWhere((Bowler bowler) {
      return bowler.bowlerId == _selBowlerId;
    });
  }

  int get selectedBowlerId {
    return _selBowlerId;
  }

  Bowler get selectedBowler {
    if (selectedBowlerId == null) {
      return null;
    }

    return _bowlers.firstWhere((Bowler bowler) {
      return bowler.bowlerId == _selBowlerId;
    });
  }

  Future<bool> updateBowler(Bowler bowler) async {
    //_isLoading = true;
    notifyListeners();

    final Map<String, dynamic> updateData = {
      "bowlerId": bowler.bowlerId,
      "entered": bowler.entered,
      "paid": bowler.paid
    };

    try {
      String url =
          'https://bowlingtournamentapi.azurewebsites.net/api/bowlers/' +
              bowler.bowlerId.toString();

      String body = json.encode(updateData);

      await http.put(url, body: body, headers: { "content-type" : "application/json"});
      _isLoading = false;

      final updatedBowler = Bowler(
          average: bowler.average,
          name: bowler.name,
          bowlerId: bowler.bowlerId,
          handicap: bowler.handicap,
          paid: bowler.paid,
          entered: bowler.entered);

      //_bowlers[selectedBowlerIndex] = updatedBowler;

      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<Null> fetchBowlers() {
    _isLoading = true;
    _bowlers = [];

    notifyListeners();

    return http
        .get('https://bowlingtournamentapi.azurewebsites.net/api/bowlers')
        .then<Null>((http.Response response) {
      final List<Bowler> fetchedBowlerList = [];

      final something = json.decode(response.body);

      final List<dynamic> bowlerListData = json.decode(response.body);

      if (bowlerListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      bowlerListData.forEach((dynamic bowlerData) {
        final Bowler bowler = Bowler(
            average: bowlerData['average'],
            name: bowlerData['name'],
            bowlerId: bowlerData['bowlerId'],
            handicap: bowlerData['handicap'],
            paid: bowlerData['paid'],
            entered: bowlerData['entered']);

        fetchedBowlerList.add(bowler);

        _bowlers = fetchedBowlerList;

        _isLoading = false;
        notifyListeners();
        _selBowlerId = null;
      });
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }

  Future<Null> fetchTournament() {
    _isLoading = true;
    _bowlers = [];

    notifyListeners();

    return http
        .get('https://bowlingtournamentapi.azurewebsites.net/api/tournament')
        .then<Null>((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      _isLoading = false;
      notifyListeners();
      tournament = Tournament.fromJson(responseData);
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }
}
