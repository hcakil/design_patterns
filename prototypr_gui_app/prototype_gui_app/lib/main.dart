import 'package:flutter/material.dart';
import 'models/character.dart';
import 'models/warrior.dart';
import 'models/wizard.dart';

void main() {
  runApp(const GameCharacterApp());
}

class GameCharacterApp extends StatelessWidget {
  const GameCharacterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Character App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CharacterSelectionPage(),
    );
  }
}

class CharacterSelectionPage extends StatefulWidget {
  const CharacterSelectionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CharacterSelectionPageState createState() => _CharacterSelectionPageState();
}

class _CharacterSelectionPageState extends State<CharacterSelectionPage> {
  Character? _selectedCharacter;

  void _createCharacter(Character prototype) {
    setState(() {
      _selectedCharacter = prototype.clone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Character Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _createCharacter(Warrior(x: 100, y: 200, color: Colors.red, strength: 10)),
              child: const Text('Create Warrior'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _createCharacter(Wizard(x: 150, y: 250, color: Colors.blue, intelligence: 15)),
              child: const Text('Create Wizard'),
            ),
            const SizedBox(height: 40),
            _selectedCharacter != null
                ? Column(
                    children: [
                      Image.asset(
                        _selectedCharacter is Warrior ? 'assets/warrior.png' : 'assets/wizard.png',
                        height: 350,
                        width: 350,
                        fit: BoxFit.contain,
                      ),
                      Text('Health: ${_selectedCharacter!.x}'),
                      Text('Mana: ${_selectedCharacter!.y}'),
                      Text('Color: ${_selectedCharacter!.color}'),
                      _selectedCharacter is Warrior
                          ? Text('Strength: ${( _selectedCharacter as Warrior).strength}')
                          : Text('Intelligence: ${( _selectedCharacter as Wizard).intelligence}'),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
