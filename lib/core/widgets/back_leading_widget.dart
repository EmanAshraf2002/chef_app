import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:flutter/material.dart';

class BackLeadingWidget extends StatelessWidget {
  const BackLeadingWidget({
    super.key, required this.routeName,
  });

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      navigate(context: context, route:routeName);
    }, icon: const Icon(Icons.arrow_back)
    );
  }
}