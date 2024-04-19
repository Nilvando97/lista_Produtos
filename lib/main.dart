import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> listaProdutos =
      List<String>.generate(20, (i) => 'Produto ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('List view'),
        ),
        body: ListView.builder(
          itemCount: listaProdutos.length,
          itemBuilder: (context, indice) {
            return ListTile(
              title: Text('${listaProdutos[indice]}'),
              onTap: () {
                print(
                    'O produto selecionado foi ${listaProdutos[indice]}, na posição $indice');
              },
            );
          },
        ),
      ),
    );
  }
}


class Produtos {
  final List produtos;

  Produtos(this.produtos);
}

class Produto{
final int produtoId;
final String produto;
final String endereco;
final String descricao;
final String imagem;
final int quantidade;
final double preco;


Produto(this.produtoId, this.produto, this.endereco, this.descricao, this.imagem, this.quantidade, this.preco);

factory Produto.fromJson(Map<String, dynamic> json){
  return Produto(
    json['produtoId'],
    json['produto'],
    json['endereco'],
    json['descricao'],
    json['imagem'],
    json['quantidade'],
    json['preco'],
     );
}

Map<String, dynamic> tojson() => {
  'produtoId': this.produtoId,
  'produto': this.produto,
  'endereco': this.endereco,
  'descricao': this.descricao,
  'imagem': this.imagem,
  'quantidade': this.quantidade,
  'preco': this.preco,
};

}