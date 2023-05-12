import 'package:dam_u4_proyecto1_18401120/firebase_service.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vehículos - Juan Diego Gómez Monteón"),centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: FutureBuilder(
          future: getVehiculo(),
          builder: ((context, snapshot) {

            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context,index){
                    return Dismissible(
                      onDismissed: (direction) async{
                        await borrarVehiculo(snapshot.data?[index]['uid']);
                        snapshot.data?.removeAt(index);
                      },
                      confirmDismiss: (direction) async {
                        bool resul = false;
                        resul = await showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("¿Seguro de eliminar a ${snapshot.data?[index]["placa"]}?"),
                            actions: [
                              TextButton(onPressed: (){
                                return Navigator.pop(context,false);
                              }, child: Text("Cancelar", style: TextStyle(color: Colors.red),)),
                              TextButton(onPressed: (){
                                return Navigator.pop(context,true);
                              }, child: Text("Si, estoy seguro"))
                            ],
                          );
                        });
                        return resul;
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                      ),
                        direction: DismissDirection.startToEnd,
                        key: Key(snapshot.data?[index]['uid']),
                        child: ListTile(
                        leading: Icon(Icons.car_rental),
                        title: Text(snapshot.data?[index]["placa"]),
                        subtitle: Text(snapshot.data?[index]['trabajador'] ?? ''),
                        onTap: () async {
                          await Navigator.pushNamed(context,"/edit", arguments: {
                            "combustible": snapshot.data?[index]['combustible'],
                            "depto":snapshot.data?[index]['depto'],
                            "numeroserie":snapshot.data?[index]['numeroserie'],
                            "placa":snapshot.data?[index]['placa'],
                            "resguardadopor":snapshot.data?[index]['resguardadopor'],
                            "tanque":snapshot.data?[index]['tanque'],
                            "tipo":snapshot.data?[index]['tipo'],
                            "trabajador":snapshot.data?[index]['trabajador'],
                            "uid":snapshot.data?[index]['uid'],
                          } );
                          setState(() {});
                        },
                      ),
                    );
                  }
              );
            }else{
              return const Center(
                child: Text("Cargando..."),
              );
            }

      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.pushNamed(context,'/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
