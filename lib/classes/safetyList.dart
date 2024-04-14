class SafetyItem {
  final String name;
  final bool isChecked;

  SafetyItem({required this.name, this.isChecked = false});

  // Add a fromJson constructor to parse JSON data if fetching from an API (optional)
  factory SafetyItem.fromJson(Map<String, dynamic> json) => SafetyItem(
    name: json['name'] as String,
  );

  @override
  String toString() => 'SafetyItem(name: $name, isChecked: $isChecked)';
}
