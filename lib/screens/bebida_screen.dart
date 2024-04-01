import 'package:flutter/material.dart';
import 'package:games/config/helpers/get_petition.dart';
import 'package:games/screens/detalle_bebida_scream.dart';

class BebidaScreen extends StatefulWidget {
  BebidaScreen({Key? key}) : super(key: key);

  @override
  State<BebidaScreen> createState() => _BebidaScreenState();
}

class _BebidaScreenState extends State<BebidaScreen> {
  final petition = GetPetition();

  List<dynamic>? items;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var response = await petition.getBebida();
    setState(() {
      items = response?["drinks"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bebidas'),
      ),
      body: ListView.builder(
        itemCount: items?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navega a la pantalla de detalle de bebida cuando se toca una bebida
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleBebidaScreen(bebidaId: items![index]["idDrink"]),
                ),
              );
            },

            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), 
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0), 
                          ),
                          child: Image.network(
                            items![index]["strDrinkThumb"],
                            width: size.width * 0.2,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(items![index]["strDrink"]),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
