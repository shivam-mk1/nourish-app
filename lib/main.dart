import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import 'router.dart';
import 'providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: ToastificationConfig(
        alignment: Alignment.bottomCenter,
        maxToastLimit: 2,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home: HomeScreen(),

        // ✅ This gives you a proper context *after* Directionality is available
        builder: (context, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ToastService();
          });
          return child!;
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomSectionHeader(
          autoImplyLeading: false,
          title: "Nourish",
          onActionTap: () {
            print("Tapped");
          },
          actionWidget: null,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ToastService().showToast(
                  context,
                  'This is toast service',
                  type: ToastificationType.success,
                );
              },
              child: Text('Show Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                ToastService().showToast(
                  context,
                  'This is toast service',
                  type: ToastificationType.error,
                );
              },
              child: Text('Show Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                ToastService().showToast(
                  context,
                  'This is toast service',
                  type: ToastificationType.info,
                );
              },
              child: Text('Show Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                ToastService().showToast(
                  context,
                  'This is toast service',
                  type: ToastificationType.warning,
                  description: 'hiiiiiiiiiiiiiiiiiiii how are you',
                );
              },
              child: Text('Show Toast'),
            ),
          ],
        ),
      ),
    );
  }
}
