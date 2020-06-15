import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttereval/ui/pages/projects/controller_project.dart';
import 'package:provider/provider.dart';

class ProjectListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var projects = context.watch<ProjectController>().projects;
    var selectedProject = context.watch<ProjectController>().selectedProject;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Projects'),
      ),
      child: projects == null
          ? Container()
          : ListView.separated(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                var project = projects[index];
                return Material(
                  child: InkWell(
                    onTap: () {
                      context.read<ProjectController>().selectProject(project);
                    },
                    child: Container(
                      color: selectedProject == project
                          ? CupertinoColors.quaternaryLabel
                          : null,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(project.name,
                              style: TextStyle(
                                color: CupertinoColors.black,
                                fontSize: 25,
                              )),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  color: CupertinoColors.separator,
                );
              },
            ),
    );
  }
}
