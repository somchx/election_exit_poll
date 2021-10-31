class Score {
  final int candidateNumber;
  final String candidateTitle;
  final String candidateName;
  final int score;

  Score({
    required this.candidateNumber,
    required this.candidateTitle,
    required this.candidateName,
    required this.score,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      candidateNumber: json['candidateNumber'],
      candidateTitle: json['candidateTitle'],
      candidateName: json['candidateName'],
      score: json['score'],
    );
  }
/*
  FoodItem.fromJson2(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        image = json['image'];*/

  @override
  String toString() {
    return '$candidateNumber: $candidateTitle  $candidateName $score';
  }
}
