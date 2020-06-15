import 'package:fluttereval/domain/project.dart';
import 'package:rxdart/rxdart.dart';

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

  // ignore: close_sinks
  final _dataObservable = BehaviorSubject<List<Project>>();

  ProjectRepository() {
    _dataObservable.sink.add(_data);
  }

  Stream<List<Project>> getAll() {
    return _dataObservable;
  }

  void updateProject(Project newProject) {
    var currentList = _dataObservable.value;
    
    var indexOfProjectToUpdate = currentList.indexWhere((element) => element.id==newProject.id);
    currentList.replaceRange(indexOfProjectToUpdate, indexOfProjectToUpdate+1, [newProject]);

    _dataObservable.sink.add(currentList);
  }
}
