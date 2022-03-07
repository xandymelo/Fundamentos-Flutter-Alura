import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/transferencia.dart';

const _tituloCriarTransferencia = "Criar Transferência";
const _nomeCampoNumeroConta = 'Número da conta';
const _nomeCampoValor = 'Valor';
const _dicaNumeroConta = '0000';
const _dicaValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';


class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _valor = TextEditingController();
  final TextEditingController _numeroConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloCriarTransferencia),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(labeltext: _nomeCampoNumeroConta,
                hinttext: _dicaNumeroConta,
                controlador: _numeroConta),
            Editor(labeltext: _nomeCampoValor,
                hinttext: _dicaValor,
                controlador: _valor,
                icon: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _criarTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }
  void _criarTransferencia(BuildContext context) {
    {
      final double? valor = double.tryParse(_valor.text);
      final int? conta = int.tryParse(_numeroConta.text);
      if (valor != null && conta != null) {
        final transferenciaCriada = Transferencia(valor, conta);
        Navigator.pop(context, transferenciaCriada);
      }
    }
  }
}
