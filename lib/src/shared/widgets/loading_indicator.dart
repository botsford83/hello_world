import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  LoadingIndicator({Key key}) : super(key: key);

  @override
  _LoadingIndicatorState createState() {
    return _LoadingIndicatorState();
  }
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey,
      ),
    );
  }
}
