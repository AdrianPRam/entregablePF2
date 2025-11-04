import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  Color colorContenedor = Colors.blue;

  void cambiarColor() {
    setState(() {
      colorContenedor =
          colorContenedor == Colors.blue ? Colors.orange : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GestureDetector(pulsacion larga) y Draggable"),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Toca el recuadro para cambiar su color:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onLongPress: cambiarColor,
              child: Container(
                height: 120,
                width: 120,
                color: colorContenedor,
                alignment: Alignment.center,
                child: const Text(
                  "Tócame",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Arrastra el círculo:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Draggable<Color>(
              data: Colors.green,
              feedback: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              childWhenDragging: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
