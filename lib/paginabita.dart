import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_u4_proyecto1_18401120/firebase_service.dart';
import 'package:flutter/material.dart';

import 'insertar_bitacora.dart';

class PaginaBitacoras extends StatefulWidget {
  final String vehiculoId;

  const PaginaBitacoras({Key? key, required this.vehiculoId}) : super(key: key);

  @override
  State<PaginaBitacoras> createState() => _PaginaBitacorasState();
}

class _PaginaBitacorasState extends State<PaginaBitacoras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bitacoras"),
      ),
      body: FutureBuilder<List>(
        future: getBitacoras(widget.vehiculoId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final bitacoraData = snapshot.data?[index];
                return ListTile(
                  title: Text(
                    (bitacoraData?['fecha'] as Timestamp)?.toDate().toString() ?? 'No disponible',
                  ),
                  subtitle: Text(bitacoraData?['evento'] ?? 'Evento no disponible',),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al cargar las bitácoras'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => InsertarBitacora(vehiculoId: widget.vehiculoId),
            ),
          );
          setState(() {});
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}