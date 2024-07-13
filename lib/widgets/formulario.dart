import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formularioEstado = GlobalKey<FormState>();
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formularioEstado,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingrese un nombre";
                    }
                    return null; //todo salio bien
                  },
                  decoration: const InputDecoration(
                      label: Text("Nombre"),
                      hintText: "Nombre",
                      border: InputBorder.none),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (!value!.contains("@") || !value.contains(".")) {
                      return "El correo no es válido";
                    }
                    return null; //todo salio bien
                  },
                  decoration: const InputDecoration(
                      label: Text("Correo electrónico"),
                      hintText: "Correo electrónico",
                      border: InputBorder.none),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  obscureText: _passwordVisible,
                  validator: (value) {
                    if (value!.length < 8) {
                      return "La contraseña debe tener al menos 8 caracteres";
                    }
                    if (!value.contains(RegExp(r'[0-9]'))) {
                      return "La contraseña debe tener al menos un número";
                    }
                    if (!value.contains(RegExp(r'[a-z]'))) {
                      return "La contraseña debe tener al menos una letra minúscula";
                    }
                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      return "La contraseña debe tener al menos una letra mayúscula";
                    }
                    return null; //todo salio bien
                  },
                  decoration: InputDecoration(
                    label: const Text("Contraseña"),
                    hintText: "Contraseña",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                        padding: const EdgeInsetsDirectional.only(end: 12),
                        icon: Icon(_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        }),
                  ),
                )),
            Expanded(
                child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 20) +
                  const EdgeInsets.only(left: 10),
              child: Text(
                  "La contaseña debe tener al menos:\n8 caracteres \nUna letra mayúscula \nUna letra minúscula \nUn número"),
            )),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formularioEstado.currentState!.validate()) {
                      print("Todo salió bien");
                    } else {
                      print("Algo salió mal");
                    }
                  },
                  child: Text("Enviar"),
                ))
          ],
        ),
      ),
    );
  }
}
