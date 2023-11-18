import 'package:cavila_store/blocs/fc_auth/bloc.dart';
import 'package:cavila_store/blocs/fc_auth/repository.dart';
import 'package:cavila_store/blocs/fc_product/bloc.dart';
import 'package:cavila_store/blocs/fc_product/repository.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/routes/route_generator.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(create: (context) => AuthRepository()),
          RepositoryProvider<ProductRepository>(create: (context) => ProductRepository()),
          
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => ProductBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => GetFemaleProductBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => GetMaleProductBloc(RepositoryProvider.of(context))),
          ],
          child: MaterialApp(
            title: 'Cavila Store',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Constants.secondaryColor),
              useMaterial3: true,
              primaryColor: const Color.fromRGBO(255, 212, 222, 1),
            ),
            initialRoute: RoutePaths.mainPage,
            onGenerateRoute: RouteGenerator.generateRoute,
            debugShowCheckedModeBanner: false,
          ),
        ));
  }
}
