import 'package:flutter/material.dart';
import 'package:games/config/helpers/get_petition.dart';

class BebidaScreen extends StatefulWidget {
  BebidaScreen({super.key});

  @override
  State<BebidaScreen> createState() => _BebidaScreenState();
}

class _BebidaScreenState extends State<BebidaScreen> {
  final petition = GetPetition();

  dynamic items = [];

  void getData() async {
    var response = await petition.getBebida();
    items = response["drinks"];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        ClipRect(
                          child: Image.network(items[index]["strDrinkThumb"],
                              width: size.width * 0.2,
                              ),
                        ),
                        SizedBox(width: 20,),
                        Text(items[index]["strDrink"]),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
