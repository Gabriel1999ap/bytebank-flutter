// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    return Column(
      children: [
        ItemTransferencias(Transferencia(100.00, 2341)),
        ItemTransferencias(Transferencia(23.00, 2341)),
        ItemTransferencias(Transferencia(900.00, 2341)),
      ],
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
}
