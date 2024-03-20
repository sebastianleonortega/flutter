import 'package:flutter/material.dart';

class RecetaScreen extends StatelessWidget {
  const RecetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.vaccines),
              ),
              Tab(
                icon: Icon(Icons.cabin_sharp),
              ),
              Tab(
                icon: Icon(Icons.sixteen_mp_sharp),
              )
            ],
          ),
          body: TabBarView(
            children: [
              Icon(Icons.vaccines),
              Icon(Icons.cabin_sharp),
              Icon(Icons.sixteen_mp_sharp)
            ],
          ),
        ));
  }
}
