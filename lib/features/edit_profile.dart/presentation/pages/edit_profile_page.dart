import 'package:flutter/material.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';

class EditProfilePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const EditProfilePage(),
      );
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('edit profile page'),
      ),
    );
  }
}
