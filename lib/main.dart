import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

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


class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando transferencia'),),
      body: Column(
        children: <Widget>[
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Numero da conta',
              dica: '0000'),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on),
          RaisedButton(
            onPressed: () => _criaTransferencia(context),
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('$transferenciaCriada'),
        ),
      );
    }
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controlador,
          style: TextStyle(
              fontSize: 24.0
          ),
          decoration: InputDecoration(
              icon: icone != null ? Icon(icone) : null,
              labelText: rotulo,
              hintText: dica,
          ),
          keyboardType: TextInputType.number,
        ),
    );
  }
}



class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferências'),),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.00, 1245)),
          ItemTransferencia(Transferencia(230.00, 1115)),
          ItemTransferencia(Transferencia(120.00, 1455)),
          ItemTransferencia(Transferencia(450.00, 4452)),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
    ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        )
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
