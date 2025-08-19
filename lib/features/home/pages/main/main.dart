import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/features.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final pages = const [
      HomePage(),
      TransactionPage(),
      POSPage(),
      ProductPage(),
      SettingsPage(),
    ];
    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, index) {
        return Scaffold(
          body: pages[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              context.read<BottomNavBloc>().add(TapBottomNavEvent(value));
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(AppIcons.storefront),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.receipt),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(icon: Icon(AppIcons.pos), label: 'POS'),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.product),
                label: 'Produk',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.settings),
                label: 'Lainnya',
              ),
            ],
          ),
        );
      },
    );
  }
}
