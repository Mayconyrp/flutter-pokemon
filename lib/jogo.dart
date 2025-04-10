import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  String treinadorEscolhido = "";
  String pokemonEscolhido = "";
  String pokemonRival = "";
  var pokemonResultado = "";
  var pokemonsRivais = ["Charmander", "Bulbassaur", "Squirtle"];

  void escolherTreinador(String nome) {
    setState(() {
      treinadorEscolhido = nome;
    });
  }

  void escolherPokemon(String nome) {
    setState(() {
      pokemonEscolhido = nome;
    });
  }

void batalhaPokemon() {
  var randomNumber = Random().nextInt(pokemonsRivais.length);
  var rival = pokemonsRivais[randomNumber];
  var resultado = "";

  if (pokemonEscolhido == "Charmander" && rival == "Squirtle") {
    resultado = "Squirtle Venceu!";
  } else if (pokemonEscolhido == "Charmander" && rival == "Bulbassaur") {
    resultado = "Charmander Venceu!";
  } else if (pokemonEscolhido == "Bulbassaur" && rival == "Squirtle") {
    resultado = "Bulbassaur Venceu!";
  } else if (pokemonEscolhido == rival) {
    resultado = "Empate!";
  } else {
    resultado = "$pokemonEscolhido Venceu!";
  }

  setState(() {
    pokemonRival = rival;
    pokemonResultado = resultado;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokémon",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                escolherTreinador("Red");
              },
              child: Image.asset(
                "images/Red_pokemon.png",
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Clique para escolher seu pokémon:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    escolherPokemon("Charmander");
                  },
                  child: Image.asset(
                    "images/charmander.jpg",
                    width: 100,
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    escolherPokemon("Bulbassaur");
                  },
                  child: Image.asset(
                    "images/bulbassaur.jpg",
                    width: 100,
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    escolherPokemon("Squirtle");
                  },
                  child: Image.asset(
                    "images/squirtle.jpg",
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: batalhaPokemon,
              child: Text("Clique aqui para realizar uma batalha pokemon!"),
            ),
            Text("Você selecionou o pokemon:$pokemonEscolhido"),
            Text("Seu Pokemon rival foi o:$pokemonRival"),
            Text(pokemonResultado),
          ],
        ),
      ),
    );
  }
}
