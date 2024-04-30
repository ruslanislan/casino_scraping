class Content {
  final String title;
  final String? description;
  final String value;

//<editor-fold desc="Data Methods">
  const Content({
    required this.title,
    this.description,
    required this.value,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Content &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          value == other.value);

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'Content{ title: $title, description: $description, value: $value,}';
  }

  Content copyWith({
    String? title,
    String? description,
    String? value,
  }) {
    return Content(
      title: title ?? this.title,
      description: description ?? this.description,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'value': value,
    };
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      title: map['title'] as String,
      description: map['description'] as String,
      value: map['value'] as String,
    );
  }

//</editor-fold>
}
