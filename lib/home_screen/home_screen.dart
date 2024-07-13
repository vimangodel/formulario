import 'package:flutter/material.dart';
import 'package:testing/widgets/formulario.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario Clase práctica 3"),
        centerTitle: true,
      ),
      body: const Formulario(),
    );
  }
}
