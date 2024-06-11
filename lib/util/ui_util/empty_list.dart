import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.hourglass_empty),
          SizedBox(height: 16,),
          Text("Empty Screen",style: TextStyle(color: Colors.black38),)
        ],
      ),
    );
  }
}