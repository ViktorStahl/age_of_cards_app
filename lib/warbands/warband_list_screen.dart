import 'package:age_of_cards_app/warbands/warband_form_screen.dart';
import 'package:age_of_cards_app/warbands/warband_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../logic/warbands/warband_container_bloc.dart';
import '../models/warband.dart';

class WarbandListScreen extends StatelessWidget {
  const WarbandListScreen({super.key});

  void _addWarband(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WarbandFormScreen()));
  }

  List<WarbandCard> createWarbands(List<Warband> warbands) {
    return warbands.map((warband) => WarbandCard(warband: warband)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<WarbandContainerBloc, WarbandContainerState>(
        builder: (context, state) {
          if (state is WarbandContainerLoading) {
            return const CircularProgressIndicator();
          } else if (state is WarbandContainerLoaded) {
            return ListView(children: createWarbands(state.warbands));
          } else {
            return const Text("Something went wrong.");
          }
        },
      )),
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

  void _deleteWarband(BuildContext context, Warband warband) async {}

  void _openWarbandInfoPage(BuildContext context, Warband warband) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WarbandInfoScreen(warbandID: warband.id)));
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
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_warband.id,
                          style: Theme.of(context).textTheme.labelSmall),
                      Text(
                          "Created: ${DateFormat(DateFormat.YEAR_NUM_MONTH_WEEKDAY_DAY).format(_warband.created)}",
                          style: Theme.of(context).textTheme.labelSmall),
                      Text(_warband.faction)
                    ]),
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
