// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, duplicate_ignore

import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencias(Transferencia(100.00, 2341)),
          ItemTransferencias(Transferencia(23.00, 2341)),
          ItemTransferencias(Transferencia(900.00, 2341)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicione seu código onPressed aqui!
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencias extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencias(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta';
  }
}

//stl
class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                    labelText: 'Número da conta', hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoValor,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                    labelText: 'Valor Transferência',
                    hintText: '0.00',
                    icon: Icon(Icons.monetization_on)),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  debugPrint('clicou em confirmar');

                  final int? numeroConta =
                      int.tryParse(_controladorCampoNumeroConta.text);
                  final double? valor =
                      double.tryParse(_controladorCampoValor.text);

                  if (numeroConta != null && valor != null) {
                    final transferenciaCriada =
                        Transferencia(valor, numeroConta);
                    debugPrint('$transferenciaCriada');
                  }
                },
                child: const Text(
                  'Confirmar',
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ));
  }
}

//stless

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}
