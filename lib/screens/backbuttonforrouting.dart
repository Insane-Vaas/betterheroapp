import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonForRouting extends StatelessWidget {
  final String routeName;
  const BackButtonForRouting({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {
        context.goNamed(
          routeName,
        );
      },
    );
  }
}

class BackButtonForRoutingNGOPage extends StatelessWidget {
  final String routeName;
  final String ngoUID;
  const BackButtonForRoutingNGOPage(
      {super.key, required this.routeName, required this.ngoUID});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {
        context.goNamed(routeName, params: {
          "ngoUID": ngoUID,
        });
      },
    );
  }
}
