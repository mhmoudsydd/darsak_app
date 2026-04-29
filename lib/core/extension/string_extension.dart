extension StringExtensions on String {
  String get toPng => 'assets/png/$this.png';
  String get toSvg => 'assets/svg/$this.svg';
  String get toJson => 'assets/json/$this.json';
  String get toJpg => 'assets/jpg/$this.jpg';
  }