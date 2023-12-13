import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: MiPantallaInicio(),
      ),
    );
  }
}

class MiPantallaInicio extends StatelessWidget {
  // Controladores para los campos de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  MiPantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.lightBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInputField("Email", emailController),
              const SizedBox(height: 16.0),
              buildInputField("Contraseña", passwordController),
              const SizedBox(height: 16.0),
              const Text(
                "",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica para validar el correo electrónico
                  String email = emailController.text;
                  if (validarCorreo(email)) {
                    // Obtén la contraseña desde el controlador del TextField
                    String password = passwordController.text;

                    // Verifica si se ingresó la contraseña
                    if (password.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MiPantallaHome(),
                        ),
                      );
                    } else {
                      // Mensaje de error si la contraseña esta vacia
                      mostrarMensajeError(
                          context, "Por favor, ingresa la contraseña.");
                    }
                  } else {
                    // El correo electrónico no es válido
                    mostrarMensajeError(context,
                        "Correo electrónico no válido. Asegúrate de ingresar un formato válido.");
                  }
                },
                child: const Text("Iniciar Sesión"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String labelText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: InputBorder.none,
          icon: const Icon(Icons.email),
        ),
      ),
    );
  }

  bool validarCorreo(String email) {
    RegExp regex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$');
    return regex.hasMatch(email);
  }

  // Función para mostrar un mensaje de error
  void mostrarMensajeError(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class MiPantallaHome extends StatelessWidget {
  const MiPantallaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            'Home',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
