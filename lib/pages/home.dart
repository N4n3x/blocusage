import 'dart:io';

import 'package:blocusage/bloc/compteur_bloc.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  final CompteurBloc _compteurBloc = CompteurBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B.LO.C"),
      ),
      body: StreamBuilder(
        // FutureBuilder si API
        stream: _compteurBloc.stream,
        builder: (BuildContext context, snapshot) {
          int compteur = snapshot.data;
          ConnectionState state = snapshot.connectionState; // Etat du process d
          return Center(
            child: Column(
              children: [Text("${compteur}")],
            ),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        child: Text("+"),
        onPressed: () {
          _compteurBloc.incrementCompteur();
        },
      ),
    );
  }
}
