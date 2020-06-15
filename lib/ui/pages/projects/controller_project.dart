import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:fluttereval/data/repositories/repository_projects.dart';
import 'package:fluttereval/domain/project.dart';

class ProjectController extends ChangeNotifier {
  final ProjectRepository projectRepository;

  List<Project> projects;
  Project selectedProject;
  bool editing = false;

  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _cityController;
  TextEditingController _noteController;

  ProjectController(this.projectRepository) {
    projectRepository.getAll().listen((projects) {
      this.projects = projects;

      notifyListeners();
    });
  }

  void selectProject(Project project) {
    print("New project selected: $project");
    selectedProject = project;
    editing = false;
    unRegisterTextFieldControllers();

    notifyListeners();
  }

  void _updateProject() {
    projectRepository.updateProject(Project(
      id: selectedProject.id,
      name: _nameController.value.text,
      notes: _noteController.value.text,
      cityAndProvince: _cityController.value.text,
      address: _addressController.value.text,
    ));
  }

  void toggleEditing() {
    if (editing) {
      _updateProject();
    }

    editing = !editing;

    notifyListeners();
  }

  void registerTextFieldControllers(
    TextEditingController nameController,
    TextEditingController addressController,
    TextEditingController cityController,
    TextEditingController noteController,
  ) {
    _nameController = nameController;
    _addressController = addressController;
    _cityController = cityController;
    _noteController = noteController;
  }

  void unRegisterTextFieldControllers() {
    _nameController = null;
    _addressController = null;
    _cityController = null;
    _noteController = null;
  }
}
