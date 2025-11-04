import 'package:flutter/material.dart';
import '../models/persona.dart';

class PersonalPage extends StatefulWidget {
  final Persona persona;
  const PersonalPage({super.key, required this.persona});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  late TextEditingController nombreController;
  late TextEditingController apellidoController;
  late TextEditingController fechaController;
  late TextEditingController correoController;
  late TextEditingController contrasenaController;

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController(text: widget.persona.nombre);
    apellidoController = TextEditingController(text: widget.persona.apellido);
    fechaController = TextEditingController(text: widget.persona.fechaNacimiento);
    correoController = TextEditingController(text: widget.persona.correo);
    contrasenaController = TextEditingController(text: widget.persona.contrasena);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Plaza")), 
      body: Center(
        
        child: ListView(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: apellidoController,
              decoration: const InputDecoration(labelText: "Apellido"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: fechaController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Fecha de nacimiento",
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            TextField(
              controller: correoController,
              decoration: const InputDecoration(
                labelText: "Correo electrónico",
                suffixIcon: Icon(Icons.email),
                ),
            ),
            TextField(
              controller: contrasenaController,
              decoration: const InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Persona nuevaPersona = Persona(
                  nombre: nombreController.text,
                  apellido: apellidoController.text,
                  fechaNacimiento: fechaController.text,
                  correo: correoController.text,
                  contrasena: contrasenaController.text,
                );
                Navigator.pop(context, nuevaPersona);
              },
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
