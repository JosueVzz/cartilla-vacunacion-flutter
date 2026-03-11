import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// --- IMPORTACIÓN DE TUS PANTALLAS ---
import 'registro_usuario_page.dart';
import 'inicio_page.dart';
import 'admin_duenos_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cartilla Vacunación",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuario = TextEditingController();
  final password = TextEditingController();

  void login() {
    // RUTA 1: VETERINARIO (ADMIN)
    if (usuario.text == "admin" && password.text == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminDuenosPage()),
      );
    }
    // RUTA 2: CLIENTE NORMAL
    else if (usuario.text == "cliente" && password.text == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InicioPage()),
      );
    }
    // RUTA 3: ERROR
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuario o contraseña incorrectos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String urlImagen = "https://instagram.fntr10-1.fna.fbcdn.net/v/t51.2885-19/146686526_3846831635367130_15846526945686733_n.jpg?stp=dst-jpg_s150x150_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=instagram.fntr10-1.fna.fbcdn.net&_nc_cat=110&_nc_oc=Q6cZ2QEJWSRYixbhlt7NmEHNN7Mw4DAC19LzJ1FllBwF6BY0uwx4Bc_X36WUroG4icuIFs0jdT4OoORK4KxIasbkPBJo&_nc_ohc=ddtDLAJ2dUgQ7kNvwESpC99&_nc_gid=SpN0q3-EPr2BwPoACT9Pug&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_Afx7tHiCk1RuXYWLC-lYxaBEtGiR4XFJyDtbALI9Y4S8HA&oe=69B50DD0&_nc_sid=7a9f4b";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Cartilla Virtual de Vacunación",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto",
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                urlImagen,
                fit: BoxFit.contain,
                width: double.infinity,
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    TextField(
                      controller: usuario,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                      ],
                      decoration: InputDecoration(
                        labelText: "Usuario",
                        counterText: "",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    TextField(
                      controller: password,
                      obscureText: true,
                      maxLength: 8,
                      decoration: InputDecoration(
                        labelText: "Contraseña",
                        counterText: "",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        elevation: 3,
                      ),
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistroUsuarioPage()),
                        );
                      },
                      child: Text(
                        "¿No tienes cuenta? Regístrate aquí",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}