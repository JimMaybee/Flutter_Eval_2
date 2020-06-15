import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttereval/domain/project.dart';
import 'package:fluttereval/ui/pages/projects/controller_project.dart';
import 'package:provider/provider.dart';

class ProjectDetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var project = context.watch<ProjectController>().selectedProject;
    bool editing = context.watch<ProjectController>().editing;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Project Details'),
        trailing: GestureDetector(
          onTap: () {
            context.read<ProjectController>().toggleEditing();
          },
          child: Text(
            context.watch<ProjectController>().editing ? "Done" : "Edit",
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ),
      ),
      child: project == null
          ? Center(
              child: Text(
                "Please select a project on the left first.",
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 14,
                ),
              ),
            )
          : _ProjectDetails(project, editing),
    );
  }
}

class _ProjectDetails extends StatefulWidget {
  final Project project;
  final bool editing;

  _ProjectDetails(this.project, this.editing)
      : super(key: ValueKey(project.id));

  @override
  __ProjectDetailsState createState() => __ProjectDetailsState();
}

class __ProjectDetailsState extends State<_ProjectDetails> {
  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _cityController;
  TextEditingController _noteController;

  double fadeInOpacity = 0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.project.name);
    _addressController = TextEditingController(text: widget.project.address);
    _cityController =
        TextEditingController(text: widget.project.cityAndProvince);
    _noteController = TextEditingController(text: widget.project.notes);

    Future.delayed(Duration.zero, () {
      setState(() {
        fadeInOpacity = 1;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: fadeInOpacity,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  "Project Name:",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                SizedBox(
                    width: 400,
                    child: CupertinoTextField(
                      controller: _nameController,
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabled: widget.editing,
                    ))
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "Address:",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                SizedBox(
                    width: 400,
                    child: CupertinoTextField(
                      controller: _addressController,
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabled: widget.editing,
                    ))
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "City, prov:",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                SizedBox(
                    width: 400,
                    child: CupertinoTextField(
                      controller: _cityController,
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabled: widget.editing,
                    ))
              ],
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notes:",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                SizedBox(
                    width: 400,
                    height: 200,
                    child: CupertinoTextField(
                      controller: _noteController,
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabled: widget.editing,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
