import 'package:age_of_cards_app/logic/warbands/warband_collection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'presentation/home_tab_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WarbandCollectionCubit(),
      child: MaterialApp(
        title: 'Age of Cards',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
            useMaterial3: true),
        home: const HomeTabController(title: 'Age of Cards'),
      ),
    );
  }
}
