import 'package:flutter/cupertino.dart';

class InspectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CupertinoTabView(
      builder: (BuildContext context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Inspections'),
          ),
          child: Container(),
        );
      },
    );
  }
}
