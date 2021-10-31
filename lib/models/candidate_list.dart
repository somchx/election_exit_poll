class Candidate {
  final int candidateNumber;
  final String candidateTitle;
  final String candidateName;

  Candidate({
    required this.candidateNumber,
    required this.candidateTitle,
    required this.candidateName,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      candidateNumber: json['candidateNumber'],
      candidateTitle: json['candidateTitle'],
      candidateName: json['candidateName'],
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
    return '$candidateNumber: $candidateTitle  $candidateName';
  }
}
