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

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Project Details'),
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
          : _ProjectDetails(project),
    );
  }
}

class _ProjectDetails extends StatefulWidget {
  final Project project;

  _ProjectDetails(this.project) : super(key: ValueKey(project.id));

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
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: fadeInOpacity,
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
                      enabled: false,
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
                      enabled: false,
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
                      enabled: false,
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
                      enabled: false,
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
