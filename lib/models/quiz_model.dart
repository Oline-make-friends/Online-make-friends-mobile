class Quiz {
  Quiz({
    this.id,
    this.question,
    this.options,
    this.answer,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final String? question;
  final List<String>? options;
  final String? answer;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["_id"] == null ? null : json["_id"],
        question: json["question"] == null ? null : json["question"],
        options: json["options"] == null
            ? null
            : List<String>.from(json["options"].map((x) => x)),
        answer: json["answer"] == null ? null : json["answer"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "question": question == null ? null : question,
        "options":
            options == null ? null : List<dynamic>.from(options!.map((x) => x)),
        "answer": answer == null ? null : answer,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
