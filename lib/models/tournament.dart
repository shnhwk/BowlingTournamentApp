import 'package:bowling_tournament/models/bowler.dart';

class Tournament {
  int numberEntered;
  int cutoffAverage;
  List<dynamic> highAverages;
  List<dynamic> lowAverages;

  Tournament(
      {this.numberEntered,
      this.cutoffAverage,
      this.highAverages,
      this.lowAverages});

  Tournament.fromJson(Map<String, dynamic> json) {
    numberEntered = json['numberEntered'];
    cutoffAverage = json['cutoffAverage'];
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
