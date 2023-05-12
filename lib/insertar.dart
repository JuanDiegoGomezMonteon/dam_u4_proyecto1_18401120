import 'package:dam_u4_proyecto1_18401120/firebase_service.dart';
import 'package:flutter/material.dart';

class Insertar extends StatefulWidget {
  const Insertar({Key? key}) : super(key: key);

  @override
  State<Insertar> createState() => _InsertarState();
}

class _InsertarState extends State<Insertar> {
  final TextEditingController placaController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController numeroserieController = TextEditingController();
  final TextEditingController combustibleController = TextEditingController();
  final TextEditingController tanqueController = TextEditingController();
  final TextEditingController trabajadorController = TextEditingController();
  final TextEditingController deptoController = TextEditingController();
  final TextEditingController resguardadoporController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Insertar Vehículo"),),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: "Placa"), controller: placaController, autofocus: true,),
            TextField(decoration: InputDecoration(labelText: "Tipo"), controller: tipoController,),
            TextField(decoration: InputDecoration(labelText: "Numero de Serie"), controller: numeroserieController,),
            TextField(decoration: InputDecoration(labelText: "Combustible"), controller: combustibleController,),
            TextField(decoration: InputDecoration(labelText: "Tanque"), controller: tanqueController,),
            TextField(decoration: InputDecoration(labelText: "Trabajador"), controller: trabajadorController,),
            TextField(decoration: InputDecoration(labelText: "Departamento"), controller: deptoController,),
            TextField(decoration: InputDecoration(labelText: "Resguardado por"), controller: resguardadoporController,),

            ElevatedButton(onPressed: () async{
              await insertarVehiculo(int.parse(tanqueController.text),combustibleController.text,
              deptoController.text,numeroserieController.text,placaController.text,resguardadoporController.text,
              tipoController.text,trabajadorController.text).then((_) {
                Navigator.pop(context);
              });
            }, child: Text("GUARDAR"))
          ],
        ),
      ),
    );
  }
}
