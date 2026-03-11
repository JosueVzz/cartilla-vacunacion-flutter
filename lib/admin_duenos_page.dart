import 'package:flutter/material.dart';
import 'inicio_page.dart';

class AdminDuenosPage extends StatelessWidget {
  // Lista de dueños de prueba
  final List<Map<String, String>> duenos = [
    {
      "nombre": "Roberto Gómez",
      "usuario": "beto89",
      "foto": "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
    },
    {
      "nombre": "Ana Sofía Garza",
      "usuario": "anasofia",
      "foto": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFCC),
      appBar: AppBar(
        title: Text(
          "Lista de Dueños",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        backgroundColor: Color(0xFFFFFFCC),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.redAccent),
            onPressed: () {
              Navigator.pop(context); // Regresa al Login
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: duenos.length,
        itemBuilder: (context, index) {
          final dueno = duenos[index];

          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.only(bottom: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                // Al tocar cualquier parte de la tarjeta, vamos a InicioPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InicioPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // 1. Foto del dueño
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(dueno["foto"]!),
                    ),
                    SizedBox(width: 15),

                    // 2. Textos del dueño
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dueno["nombre"]!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Usuario: @${dueno["usuario"]}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 3. Ícono visual de "ver más"
                    Icon(Icons.chevron_right, color: Colors.blue),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
