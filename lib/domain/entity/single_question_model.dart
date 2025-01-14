class QuizQuestion {
  final int id;
  final String questionText;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String correctAnswer;

  // Constructor
  QuizQuestion({
    required this.id,
    required this.questionText,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctAnswer,
  });

  // Factory method to create an instance from JSON
  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'],
      questionText: json['questionText'],
      optionA: json['optionA'],
      optionB: json['optionB'],
      optionC: json['optionC'],
      optionD: json['optionD'],
      correctAnswer: json['correctAnswer'],
    );
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionText': questionText,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'optionD': optionD,
      'correctAnswer': correctAnswer,
    };
  }
}
