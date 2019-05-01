class Bowler {
  final int bowlerId;
  final String name;
  final int average;
  final int handicap;
   bool entered;
   bool paid;

  Bowler(
      {this.bowlerId,
      this.name,
      this.average,
      this.handicap,
      this.entered,
      this.paid});

  factory Bowler.fromJson(Map<String, dynamic> json) {
    return Bowler(
        bowlerId: json['bowlerId'] as int,
        name: json['name'] as String,
        average: json['average'] as int,
        handicap: json['handicap'] as int,
        entered: json['entered'] as bool,
        paid: json['paid'] as bool);
  }
}
