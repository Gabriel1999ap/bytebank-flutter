import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

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
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: '0000',
                rotulo: 'Número da conta',
                icone: null,
              ),
              Editor(
                controlador: _controladorCampoValor,
                dica: '0.00',
                rotulo: 'Valor',
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                  onPressed: () => _criaTransferencia(_controladorCampoValor,
                      _controladorCampoNumeroConta, context),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ),
        ));
  }
}

void _criaTransferencia(
    _controladorCampoValor, _controladorCampoNumeroConta, context) {
  final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
  final double? valor = double.tryParse(_controladorCampoValor.text);

  if (numeroConta != null && valor != null) {
    final transferenciaCriada = Transferencia(valor, numeroConta);
    debugPrint('Criando Transferencia');
    debugPrint('$transferenciaCriada');
    Navigator.pop(context, transferenciaCriada);
  }
}
