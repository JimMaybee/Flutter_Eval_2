import 'package:fluttereval/domain/project.dart';

class ProjectRepository {
  var _data = [
    Project(
        id: "1",
        name: "Project 1",
        address: "Toronto",
        cityAndProvince: "ON",
        notes: "All Done."),
    Project(
        id: "2",
        name: "Project 2",
        address: "Vancouver",
        cityAndProvince: "BC",
        notes: "Line 1\nLine 2"),
  ];

  Stream<List<Project>> getAll() {
    return Stream.value(_data);
  }
}
