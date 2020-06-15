import 'package:flutter/cupertino.dart';

class Project {
  final String id;
  final String name;
  final String address;
  final String cityAndProvince;
  final String notes;

  Project({
    @required this.id,
    @required this.name,
    this.address,
    this.cityAndProvince,
    this.notes,
  });

  @override
  String toString() {
    return 'Project{id:$id name: $name, address: $address, cityAndProvince: $cityAndProvince, notes: $notes}';
  }
}
