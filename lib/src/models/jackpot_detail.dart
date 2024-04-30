import 'information.dart';

class JackpotDetail {
  final String fact;
  final List<Information> informationList;
  final List<String> descriptions;

//<editor-fold desc="Data Methods">
  const JackpotDetail({
    required this.fact,
    required this.informationList,
    required this.descriptions,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JackpotDetail &&
          runtimeType == other.runtimeType &&
          fact == other.fact &&
          informationList == other.informationList &&
          descriptions == other.descriptions);

  @override
  int get hashCode =>
      fact.hashCode ^ informationList.hashCode ^ descriptions.hashCode;

  @override
  String toString() {
    return 'JackpotDetail{ fact: $fact, informationList: $informationList, descriptions: $descriptions,}';
  }

  JackpotDetail copyWith({
    String? fact,
    List<Information>? informationList,
    List<String>? descriptions,
  }) {
    return JackpotDetail(
      fact: fact ?? this.fact,
      informationList: informationList ?? this.informationList,
      descriptions: descriptions ?? this.descriptions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fact': fact,
      'informationList': informationList,
      'descriptions': descriptions,
    };
  }

  factory JackpotDetail.fromMap(Map<String, dynamic> map) {
    return JackpotDetail(
      fact: map['fact'] as String,
      informationList: map['informationList'] as List<Information>,
      descriptions: map['descriptions'] as List<String>,
    );
  }

//</editor-fold>
}
