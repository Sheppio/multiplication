class MultiplierSetting {
  final int multiplier;
  final bool selectable;
  const MultiplierSetting(this.multiplier, this.selectable);

  @override
  String toString() {
    return '${multiplier.toString()}:$selectable';
  }
}
