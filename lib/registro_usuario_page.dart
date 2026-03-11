import 'dart:io'; // Necesario para manejar archivos (la imagen)
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart'; // El paquete que acabamos de instalar

class RegistroUsuarioPage extends StatefulWidget {
  @override
  _RegistroUsuarioPageState createState() => _RegistroUsuarioPageState();
}

class _RegistroUsuarioPageState extends State<RegistroUsuarioPage> {
  final nombre = TextEditingController();
  final usuario = TextEditingController();
  final telefono = TextEditingController();
  final password = TextEditingController();

  // Variables para la foto de perfil
  File? _imagenSeleccionada;
  final ImagePicker _picker = ImagePicker();

  // Función para abrir la cámara o galería
  Future<void> _seleccionarImagen(ImageSource source) async {
    final XFile? imagen = await _picker.pickImage(source: source);

    if (imagen != null) {
      setState(() {
        _imagenSeleccionada = File(imagen.path);
      });
    }
  }

  // Muestra un menú en la parte de abajo para elegir de dónde sacar la foto
  void _mostrarOpcionesDeImagen() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Elegir de la galería'),
                onTap: () {
                  _seleccionarImagen(ImageSource.gallery);
                  Navigator.of(context).pop(); // Cierra el menú
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Tomar una foto'),
                onTap: () {
                  _seleccionarImagen(ImageSource.camera);
                  Navigator.of(context).pop(); // Cierra el menú
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void registrar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("¡Cuenta creada con éxito! Por favor inicia sesión.")),
    );
    Navigator.pop(context); // Regresa al Login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Crear Cuenta",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              // --- NUEVO BOTÓN DE FOTO DE PERFIL ---
              GestureDetector(
                onTap: _mostrarOpcionesDeImagen, // Al tocar, abre el menú
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue[100],
                  // Si ya hay una imagen, la muestra. Si no, no pone fondo.
                  backgroundImage: _imagenSeleccionada != null
                      ? FileImage(_imagenSeleccionada!)
                      : null,
                  // Si NO hay imagen, muestra el ícono de la cámara.
                  child: _imagenSeleccionada == null
                      ? Icon(Icons.camera_alt, size: 50, color: Colors.blue[400])
                      : null, // Si ya hay imagen, quita el ícono
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Toca para añadir foto",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 30),

              // ... (El resto de tus TextFields siguen exactamente igual)
              TextField(
                controller: nombre,
                decoration: InputDecoration(
                  labelText: "Nombre completo",
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),

              TextField(
                controller: usuario,
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                ],
                decoration: InputDecoration(
                  labelText: "Usuario",
                  prefixIcon: Icon(Icons.account_circle),
                  counterText: "",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),

              TextField(
                controller: telefono,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Teléfono",
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),

              TextField(
                controller: telefono,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Domicilio",
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),

              TextField(
                controller: password,
                obscureText: true,
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  prefixIcon: Icon(Icons.lock),
                  counterText: "",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 40),

              ElevatedButton(
                onPressed: registrar,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 3,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  "Registrarme",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}