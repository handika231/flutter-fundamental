import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:submission_03/common/navigation.dart';
import 'package:submission_03/data/db/database_helper.dart';
import 'package:submission_03/data/services/api_service.dart';
import 'package:submission_03/presentation/provider/database_provider.dart';
import 'package:submission_03/presentation/provider/home_provider.dart';
import 'package:submission_03/presentation/provider/schedule_provider.dart';
import 'package:submission_03/presentation/provider/search_provider.dart';

import '../../presentation/view/view.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(
            service: ApiService(),
          ),
        ),
        ChangeNotifierProvider<ScheduleProvider>(
          create: (context) => ScheduleProvider(),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (context) => SearchProvider(
            service: ApiService(),
          ),
        ),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (context) => DatabaseProvider(
            databaseHelper: DatabaseHelper(),
          ),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 400,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.autoScale(400, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
            ],
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Submission 03',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MainView.routeName,
        routes: {
          MainView.routeName: (context) => const MainView(),
          HomeView.routeName: (context) => const HomeView(),
          SettingView.routeName: (context) => const SettingView(),
          BookmarkView.routeName: (context) => const BookmarkView(),
          DetailView.routeName: (context) => const DetailView(),
          SearchView.routeName: (context) => const SearchView(),
        },
      ),
    );
  }
}
