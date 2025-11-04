import 'package:flutter/material.dart';
import '../models/persona.dart';
import 'personal_page.dart';
import 'widget_page.dart';

class HomePage extends StatefulWidget {
  // StatefulWidget porque necesita actualizarse cuando se recibe una Persona modificada.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Persona? persona;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("PF2"),),
      ),
      body: Center(
        child:  
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenido",style: TextStyle(fontSize: 20),),
            ElevatedButton(
              onPressed: () async {
                Persona? p ;
                if(persona!=null){
                  p = persona;
                }else{
                  p = Persona(
                    nombre: "Adrian",
                    apellido: "Plaza",
                    fechaNacimiento: "07/10/2005",
                    correo: "adrianplaza@paucasesnovescifp.cat",
                    contrasena: "1234",
                  );
                }

                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalPage(persona: p!),
                  ),
                );

                if (resultado != null && resultado is Persona) {
                  setState(() {
                    persona = resultado;
                  });
                }
              }, 
              child: const Text("Ir a pagina Personal")),
              ElevatedButton(
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WidgetPage()),
                );
              },
              child: const Text("Ir a la página de widgets"),
            ),
            const SizedBox(height: 30),
            if (persona != null)
              Text(
                "Datos recibidos: ${persona!.nombre} ${persona!.apellido}",
                style: const TextStyle(fontSize: 16, color: Colors.indigo),
              ),
          ],
        ),
      )
    );
  }
}
