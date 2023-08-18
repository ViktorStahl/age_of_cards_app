import 'package:age_of_cards_app/warband_storage.dart';
import 'package:age_of_cards_app/warbands/warband_page.dart';
import 'package:flutter/material.dart';

class HomeTabController extends StatefulWidget {
  const HomeTabController({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeTabController> createState() => _HomeTabControllerState();
}

class _HomeTabControllerState extends State<HomeTabController> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
              bottom: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.list)),
                  Tab(icon: Icon(Icons.local_library)),
                ],
              ),
            ),
            body: TabBarView(controller: _tabController, children: [
              WarbandPage(storage: WarbandStorage()),
              const Icon(Icons.local_library),
            ]),
        ));
  }
}
