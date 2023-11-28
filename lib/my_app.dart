import 'package:cavila_store/blocs/fc_auth/bloc.dart';
import 'package:cavila_store/blocs/fc_auth/repository.dart';
import 'package:cavila_store/blocs/fc_bottom_bar/bloc.dart';
import 'package:cavila_store/blocs/fc_check_login/bloc.dart';
import 'package:cavila_store/blocs/fc_comment/bloc.dart';
import 'package:cavila_store/blocs/fc_comment/repository.dart';
import 'package:cavila_store/blocs/fc_order/bloc.dart';
import 'package:cavila_store/blocs/fc_order/repository.dart';
import 'package:cavila_store/blocs/fc_payment/bloc.dart';
import 'package:cavila_store/blocs/fc_payment/repository.dart';
import 'package:cavila_store/blocs/fc_product/bloc.dart';
import 'package:cavila_store/blocs/fc_product/repository.dart';
import 'package:cavila_store/blocs/fc_voucher/bloc.dart';
import 'package:cavila_store/blocs/fc_voucher/repository.dart';
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
          RepositoryProvider<VoucherRepository>(create: (context) => VoucherRepository()),
          RepositoryProvider<PaymentRepository>(create: (context) => PaymentRepository()),
          RepositoryProvider<OrderRepository>(create: (context) => OrderRepository()),
          RepositoryProvider<CommentRepository>(create: (context) => CommentRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => ProductBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => GetFemaleProductBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => GetMaleProductBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => BottomBarBloc()),
            BlocProvider(create: (context) => VoucherBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => PaymentBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => OrderBloc(RepositoryProvider.of(context))),
            BlocProvider(create: (context) => CheckBloc()),
            BlocProvider(create: (context) => CommentBloc(RepositoryProvider.of(context))),
          ],
          child: MaterialApp(
            title: 'Cavila Store',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Constants.secondaryColor),
              useMaterial3: true,
              primaryColor: const Color.fromRGBO(255, 212, 222, 1),
            ),
            initialRoute: RoutePaths.splashScreen,
            onGenerateRoute: RouteGenerator.generateRoute,
            debugShowCheckedModeBanner: false,
          ),
        ));
  }
}
