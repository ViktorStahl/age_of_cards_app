import 'package:age_of_cards_app/models/warband_container_model.dart';
import 'package:age_of_cards_app/warbands/warband_form_page.dart';
import 'package:age_of_cards_app/warbands/warband_info_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/warband.dart';

class WarbandPage extends StatefulWidget {
  const WarbandPage({super.key});

  @override
  State<WarbandPage> createState() => _WarbandPageState();
}

class _WarbandPageState extends State<WarbandPage> {
  @override
  void initState() {
    super.initState();
  }

  void _addWarband(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WarbandFormPage()));
  }

  List<WarbandCard> createWarbands(List<Warband> warbands) {
    return warbands.map((warband) => WarbandCard(warband: warband)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Consumer<WarbandContainerModel>(builder: (context, model, _) {
        return ListView(children: createWarbands(model.warbands));
      })),
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

  void _deleteWarband(BuildContext context, Warband warband) async {
    Provider.of<WarbandContainerModel>(context, listen: false)
        .deleteWarband(warband);
  }

  void _openWarbandInfoPage(BuildContext context, Warband warband) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WarbandInfoPage(warband: warband)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _openWarbandInfoPage(context, _warband),
        child: Card(
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
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  iconSize: 24.0,
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () => _deleteWarband(context, _warband),
                ),
              ),
            ],
          ),
        ));
  }
}
