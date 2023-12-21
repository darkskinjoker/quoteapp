class QuoteModel {
  String text;
  String author;

  QuoteModel({required this.text, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      text: json['text'] as String? ?? '', // Using null-aware operator and handling null with a default value
      author: json['author'] as String? ?? '', // Using null-aware operator and handling null with a default value
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
    };
  }
}