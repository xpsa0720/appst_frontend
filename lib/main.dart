import 'package:appst/common/provider/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seo/seo.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  usePathUrlStrategy();
  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return SeoController(
      tree: WidgetTree(context: context),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
