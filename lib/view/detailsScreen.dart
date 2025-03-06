import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const route = "/detail";
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
    );
  }
}
