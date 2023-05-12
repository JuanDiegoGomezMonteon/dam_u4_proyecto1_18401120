import 'package:dam_u4_proyecto1_18401120/firebase_service.dart';
import 'package:flutter/material.dart';

class Actualizar extends StatefulWidget {
  const Actualizar({Key? key}) : super(key: key);

  @override
  State<Actualizar> createState() => _ActualizarState();
}

class _ActualizarState extends State<Actualizar> {
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

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map? ?? {};

    if (arguments.isNotEmpty) {
      combustibleController.text = arguments['combustible'] ?? '';
      deptoController.text = arguments['depto'] ?? '';
      numeroserieController.text = arguments['numeroserie'] ?? '';
      placaController.text = arguments['placa'] ?? '';
      resguardadoporController.text = arguments['resguardadopor'] ?? '';
      tanqueController.text = arguments['tanque'].toString() ?? '';
      tipoController.text = arguments['tipo'].toString() ?? '';
      trabajadorController.text = arguments['trabajador'] ?? '';
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Actualizar Vehículo"),),
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
              await actualizarVehuculo(arguments['uid'], int.parse(tanqueController.text), combustibleController.text,
                  deptoController.text, numeroserieController.text, placaController.text,
                  resguardadoporController.text, tipoController.text, trabajadorController.text).then((_) {
                Navigator.pop(context);
              });
            }, child: Text("ACTUALIZAR"))
          ],
        ),
      ),
    );
  }
}
