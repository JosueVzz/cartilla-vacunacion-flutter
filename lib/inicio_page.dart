import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  // --- NUEVO: Variable para saber si es admin ---
  final bool esAdmin;

  // El constructor ahora pide esta variable (por defecto es false)
  InicioPage({this.esAdmin = false});

  final List<Map<String, String>> mascotas = [
    {
      "nombre": "Chopper",
      "especie": "Perrito",
      "foto": "https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=500"
    },
    {
      "nombre": "Yuumi",
      "especie": "Gatita",
      "foto": "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=500"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFCC),
      appBar: AppBar(
        title: Text("Mis Mascotas", style: TextStyle(color: Colors.blue)),
        backgroundColor: Color(0xFFFFFFCC),
        elevation: 0,
        // --- AQUÍ ESTÁ EL TRUCO ---
        // Si esAdmin es true, Flutter pone la flecha automáticamente.
        // Si esAdmin es false, quitamos la flecha para el cliente.
        automaticallyImplyLeading: esAdmin,

        actions: [
          // Solo mostramos el botón de cerrar sesión si NO es admin
          // (Porque el admin usa la flecha para regresar)
          if (!esAdmin)
            IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.redAccent),
              onPressed: () => Navigator.pop(context),
            )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: mascotas.length,
        itemBuilder: (context, index) {
          final mascota = mascotas[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(mascota["foto"]!)),
              title: Text(mascota["nombre"]!),
              subtitle: Text(mascota["especie"]!),
            ),
          );
        },
      ),
    );
  }
}