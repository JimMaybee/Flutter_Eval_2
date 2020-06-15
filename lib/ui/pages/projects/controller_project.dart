import 'package:flutter/foundation.dart';
import 'package:fluttereval/data/repositories/repository_projects.dart';
import 'package:fluttereval/domain/project.dart';

class ProjectController extends ChangeNotifier{
  List<Project> projects;

  Project selectedProject;

  ProjectController(ProjectRepository projectRepository){
    projectRepository.getAll().listen((projects) {
      this.projects = projects;

      notifyListeners();
    });
  }

  void selectProject(Project project) {
    print("New project selected: $project");
    selectedProject= project;

    notifyListeners();
  }
}