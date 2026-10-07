import 'package:flutter/material.dart';

class Avatar1 extends StatelessWidget {
  const Avatar1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(
        "https://randomuser.me/api/portraits/men/32.jpg",
      ),
    );
  }
}