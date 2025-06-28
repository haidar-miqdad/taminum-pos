import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/app/routes.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/features.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(GetProfileEvent()),
        ),
        BlocProvider(
          create: (context) => XenditBloc()..add(GetXenditEvent()),
        ),
        BlocProvider(
          create: (context) => ReceiptBloc()..add(GetReceiptEvent()),
        ),
        BlocProvider(
          create: (context) => PrinterBloc(),
        ),
        BlocProvider(
          create: (context) => FormProductBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),

      ],
      child: MaterialApp(
        title: 'Taminum App',
        theme: LightTheme(MainColors.primary).theme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes,
        home: const SplashPage(),
      ),
    );
  }
}
