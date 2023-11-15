enum IconConstant {
  splashProgress('splash_progress');

  final String value;

  const IconConstant(this.value);
  String get ToPng => 'assets/icon/$value.png';
}
