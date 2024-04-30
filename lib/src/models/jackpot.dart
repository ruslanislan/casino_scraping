class Jackpot {
  final String name;
  final String value;
  final String software;
  final String url;
  final String breakEven;
  final String rtp;
  final String winChance;

//<editor-fold desc="Data Methods">
  const Jackpot({
    required this.name,
    required this.value,
    required this.software,
    required this.url,
    required this.breakEven,
    required this.rtp,
    required this.winChance,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Jackpot &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          value == other.value &&
          software == other.software &&
          url == other.url &&
          breakEven == other.breakEven &&
          rtp == other.rtp &&
          winChance == other.winChance);

  @override
  int get hashCode =>
      name.hashCode ^
      value.hashCode ^
      software.hashCode ^
      url.hashCode ^
      breakEven.hashCode ^
      rtp.hashCode ^
      winChance.hashCode;

  @override
  String toString() {
    return 'Jackpot{ name: $name, value: $value, software: $software, url: $url, breakEven: $breakEven, rtp: $rtp, winChance: $winChance,}';
  }

  Jackpot copyWith({
    String? name,
    String? value,
    String? software,
    String? url,
    String? breakEven,
    String? rtp,
    String? winChance,
  }) {
    return Jackpot(
      name: name ?? this.name,
      value: value ?? this.value,
      software: software ?? this.software,
      url: url ?? this.url,
      breakEven: breakEven ?? this.breakEven,
      rtp: rtp ?? this.rtp,
      winChance: winChance ?? this.winChance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'software': software,
      'url': url,
      'breakEven': breakEven,
      'rtp': rtp,
      'winChance': winChance,
    };
  }

  factory Jackpot.fromMap(Map<String, dynamic> map) {
    return Jackpot(
      name: map['name'] as String,
      value: map['value'] as String,
      software: map['software'] as String,
      url: map['url'] as String,
      breakEven: map['breakEven'] as String,
      rtp: map['rtp'] as String,
      winChance: map['winChance'] as String,
    );
  }

//</editor-fold>
}
