import 'package:flutter/material.dart';
import 'package:games/config/helpers/get_petition.dart';

class DetalleBebidaScreen extends StatelessWidget {
  final String bebidaId;

  DetalleBebidaScreen({required this.bebidaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Bebida'),
      ),
      body: FutureBuilder(
        future: GetPetition().getBebidaById(bebidaId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var bebida = snapshot.data;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(bebida!['strDrinkThumb']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    bebida['strDrink'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Instrucciones:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    bebida['strInstructions'],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Ingredientes:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 15, // Suponiendo que hay máximo 15 ingredientes
                    itemBuilder: (context, index) {
                      var ingrediente = bebida['strIngredient${index + 1}'];
                      if (ingrediente != null && ingrediente.isNotEmpty) {
                        return ListTile(
                          title: Text(
                            ingrediente,
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            bebida['strMeasure${index + 1}'] ?? '',
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      } else {
                        return SizedBox.shrink(); // Ocultar si no hay ingrediente
                      }
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
