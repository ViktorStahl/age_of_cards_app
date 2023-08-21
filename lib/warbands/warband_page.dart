import 'package:age_of_cards_app/warbands/warband.dart';
import 'package:age_of_cards_app/warbands/warband_container.dart';
import 'package:age_of_cards_app/warbands/warband_form_page.dart';
import 'package:flutter/material.dart';

import '../warband_storage.dart';

class WarbandPage extends StatefulWidget {
  const WarbandPage({super.key, required this.storage});

  final WarbandStorage storage;

  @override
  State<WarbandPage> createState() => _WarbandPageState();
}

class _WarbandPageState extends State<WarbandPage> {
  late WarbandContainer warbandsContainer;

  @override
  void initState() {
    super.initState();
    warbandsContainer = WarbandContainer();
    widget.storage.readWarbands().then((value) {
      setState(() {
        warbandsContainer = value;
      });
    });
  }

  Future<void> _addWarband(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => WarbandFormPage()));
    setState(() {
      warbandsContainer.warbands.add(result);
    });

    // Write the variable as a string to the file.
    widget.storage.writeWarbands(warbandsContainer);
  }

  List<WarbandCard> createWarbands(List<Warband> warbands) {
    return warbands.map((warband) => WarbandCard(warband: warband)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: createWarbands(warbandsContainer.warbands)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addWarband(context);
        },
        tooltip: 'Add Warband',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WarbandCard extends StatelessWidget {
  const WarbandCard({
    super.key,
    required Warband warband,
  }) : _warband = warband;

  final Warband _warband;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.shield),
            title: Text(
              _warband.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(_warband.faction),
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
