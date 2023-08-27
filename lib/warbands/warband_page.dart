import 'package:age_of_cards_app/warbands/warband.dart';
import 'package:age_of_cards_app/warbands/warband_container.dart';
import 'package:age_of_cards_app/warbands/warband_form_page.dart';
import 'package:age_of_cards_app/warbands/warband_info_page.dart';
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

  void _deleteWarband(Warband warband) async {
    setState(() {
      warbandsContainer.warbands.remove(warband);
    });

    // Write the variable as a string to the file.
    widget.storage.writeWarbands(warbandsContainer);
  }

  void _openWarbandInfoPage(BuildContext context, warband) async {
    print(context);
    print(warband.characters);
    await Navigator.push(context, MaterialPageRoute(builder: (context) => WarbandInfoPage(warband: warband)));
  }

  List<WarbandCard> createWarbands(List<Warband> warbands) {
    return warbands
        .map((warband) =>
            WarbandCard(warband: warband, onDelete: _deleteWarband, onTap: _openWarbandInfoPage,))
        .toList();
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
    void Function(Warband)? onDelete,
    void Function(BuildContext, Warband)? onTap,
  })  : _warband = warband,
        _onDelete = onDelete,
        _onTap = onTap;

  final Warband _warband;
  final void Function(Warband)? _onDelete;
  final void Function(BuildContext, Warband)? _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _onTap?.call(context, _warband),
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
                  onPressed: () => _onDelete?.call(_warband),
                ),
              ),
            ],
          ),
        ));
  }
}
