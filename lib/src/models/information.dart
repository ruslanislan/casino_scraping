import 'content.dart';

class Information {
  final String title;
  final List<Content> contents;

//<editor-fold desc="Data Methods">
  const Information({
    required this.title,
    required this.contents,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Information &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          contents == other.contents);

  @override
  int get hashCode => title.hashCode ^ contents.hashCode;

  @override
  String toString() {
    return 'Information{ title: $title, contents: $contents,}';
  }

  Information copyWith({
    String? title,
    List<Content>? contents,
  }) {
    return Information(
      title: title ?? this.title,
      contents: contents ?? this.contents,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'contents': contents,
    };
  }

  factory Information.fromMap(Map<String, dynamic> map) {
    return Information(
      title: map['title'] as String,
      contents: map['contents'] as List<Content>,
    );
  }

//</editor-fold>
}