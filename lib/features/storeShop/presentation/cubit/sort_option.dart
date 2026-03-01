enum SortOption {
  none,
  eta,
  minimumOrder;

  String get label {
    switch (this) {
      case SortOption.eta:
        return "ETA";
      case SortOption.minimumOrder:
        return "Minimum Order";
      default:
        return "Default";
    }
  }
}