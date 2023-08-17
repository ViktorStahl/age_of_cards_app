import 'package:flutter/material.dart';

class WarbandPage extends StatefulWidget {
  const WarbandPage({super.key});

  @override
  State<WarbandPage> createState() => _WarbandPageState();
}

class _WarbandPageState extends State<WarbandPage> {
  List<String> warbands = [
    "My Crocodiles",
    "Boulder Brothers",
    "Lizard Leprechauns"
  ];

  void _addWarband() {
    setState(() {
      warbands.add("New Warband");
    });
  }

  List<WarbandCard> createWarbands(List<String> names) {
    return names.map((name) => WarbandCard(name: name)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: createWarbands(warbands)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWarband,
        tooltip: 'Add Warband',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WarbandCard extends StatelessWidget {
  const WarbandCard({
    super.key,
    required String name,
  }) : _name = name;

  final String _name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.shield),
            title: Text(
              _name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: const Text('Human Empires'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                iconSize: 24.0,
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  /* TODO Implement */
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                iconSize: 24.0,
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  /* TODO Implement */
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
