import 'package:age_of_cards_app/logic/warband/warband_bloc.dart';
import 'package:age_of_cards_app/models/warband.dart';
import 'package:age_of_cards_app/presentation/screens/warband_form_screen.dart';
import 'package:age_of_cards_app/presentation/screens/warband_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

import '../../logic/warbands/warband_collection_cubit.dart';

class WarbandListScreen extends StatelessWidget {
  const WarbandListScreen({super.key});

  Future<void> _addWarband(BuildContext context) async {
    final Warband? warband = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => WarbandFormScreen()));
    if (warband == null) {
      return;
    }
    if (!context.mounted) return;
    context.read<WarbandCollectionCubit>().addWarband(warband);
  }

  List<Widget> createWarbands(Set<WarbandBloc> warbands) {
    return warbands
        .map((warbandBloc) => BlocProvider<WarbandBloc>.value(
              value: warbandBloc,
              child: const WarbandCard(),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Center(child: BlocBuilder<WarbandCollectionCubit, Set<WarbandBloc>>(
          builder: (context, state) {
            return ListView(children: createWarbands(state));
          },
        )),
        floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                heroTag: 'addWarband',
                onPressed: () {
                  _addWarband(context);
                },
                tooltip: 'Add Warband',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 4),
              FloatingActionButton(
                heroTag: 'clearStorage',
                onPressed: () => HydratedBloc.storage.clear(),
                tooltip: 'Clear all stored data',
                child: const Icon(Icons.delete_forever),
              ),
            ]));
  }
}

class WarbandCard extends StatelessWidget {
  const WarbandCard({super.key});

  void _deleteWarband(BuildContext context, Warband warband) async {
    context.read<WarbandCollectionCubit>().deleteWarband(warband.id);
  }

  void _openWarbandInfoScreen(BuildContext originalContext) async {
    await Navigator.of(originalContext).push(MaterialPageRoute(
        builder: (newContext) => BlocProvider<WarbandBloc>.value(
              value: BlocProvider.of<WarbandBloc>(originalContext),
              child: const WarbandInfoScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _openWarbandInfoScreen(context),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<WarbandBloc, WarbandState>(
                builder: (context, state) {
                  Warband warband = state.warband;
                  return ListTile(
                    leading: const Icon(Icons.shield),
                    title: Text(
                      warband.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(warband.id,
                              style: Theme.of(context).textTheme.labelSmall),
                          Text(
                              'Created: ${DateFormat(DateFormat.YEAR_NUM_MONTH_WEEKDAY_DAY).format(warband.created)}',
                              style: Theme.of(context).textTheme.labelSmall),
                          Text(warband.faction)
                        ]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      iconSize: 24.0,
                      color: Theme.of(context).iconTheme.color,
                      onPressed: () => _deleteWarband(context, warband),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
