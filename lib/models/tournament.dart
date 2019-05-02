import 'package:bowling_tournament/models/bowler.dart';

class Tournament {
  int numberEntered;
  int cutoffAverage;
  int totalMoney;
  int prizeMoney;
  int moneyOwedToAlley;

  int firstPlace;
  int secondPlace;
  int thirdPlace;
  int fourthPlace;

  List<Bowler> highAverages;
  List<Bowler> lowAverages;

  Tournament(
      {this.numberEntered,
      this.cutoffAverage,
      this.highAverages,
      this.lowAverages,
      this.totalMoney,
      this.prizeMoney,
      this.moneyOwedToAlley,
      this.firstPlace,
      this.secondPlace,
      this.thirdPlace,
      this.fourthPlace});

  Tournament.fromJson(Map<String, dynamic> json) {
    numberEntered = json['numberEntered'];
    cutoffAverage = json['cutoffAverage'];

    totalMoney = json['totalMoney'];
    prizeMoney = json['prizeMoney'];
    moneyOwedToAlley = json['moneyOwedToAlley'];

    firstPlace = json['prizeBreakdown']['firstPlace'];
    secondPlace = json['prizeBreakdown']['secondPlace'];
    thirdPlace = json['prizeBreakdown']['thirdPlace'];
    fourthPlace = json['prizeBreakdown']['fourthPlace'];

    if (json['highAverages'] != null) {
      highAverages = new List<Bowler>();
      json['highAverages'].forEach((v) {
        highAverages.add(new Bowler.fromJson(v));
      });
    }
    if (json['lowAverages'] != null) {
      lowAverages = new List<Bowler>();
      json['lowAverages'].forEach((v) {
        lowAverages.add(new Bowler.fromJson(v));
      });
    }
  }
}
