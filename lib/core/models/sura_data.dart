class SuraData{
  String nameEn;
  String nameAr;
  String number;
  String verses;
  SuraData({
    required this.number,
    required this.nameAr,
    required this.nameEn,
    required this.verses,
});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuraData &&
          runtimeType == other.runtimeType &&
          nameEn == other.nameEn &&
          nameAr == other.nameAr &&
          number == other.number &&
          verses == other.verses;

  @override
  int get hashCode =>
      nameEn.hashCode ^ nameAr.hashCode ^ number.hashCode ^ verses.hashCode;
}