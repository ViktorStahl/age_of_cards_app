import 'package:age_of_cards_app/models/warband_container_model.dart';
import 'package:age_of_cards_app/warbands/warband_form_page.dart';
import 'package:age_of_cards_app/warbands/warband_info_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/warband_model.dart';

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

  Future<void> _addWarband(
      BuildContext context, WarbandContainerModel container) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => WarbandFormPage()));
      container.addWarband(result);
  }

  List<WarbandCard> createWarbands(List<WarbandModel> warbands) {
    return warbands
        .map((warband) => WarbandCard(warband: warband))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WarbandContainerModel>(builder: (context, model, _) {
      return Scaffold(
        body: Center(
            child:
                ListView(children: createWarbands(model.warbands))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addWarband(context, model);
          },
          tooltip: 'Add Warband',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}

class WarbandCard extends StatelessWidget {
  const WarbandCard({
    super.key,
    required WarbandModel warband,
  })  : _warband = warband;

  final WarbandModel _warband;

  void _deleteWarband(BuildContext context, WarbandModel warband) async {
    WarbandContainerModel container = Provider.of<WarbandContainerModel>(context, listen: false);
    container.deleteWarband(warband);
  }

  void _openWarbandInfoPage(
      BuildContext context, WarbandModel warband) async {
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
