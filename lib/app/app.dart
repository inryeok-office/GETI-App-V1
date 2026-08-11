import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/app/router/app_router.dart';
import 'package:geti_app/shared/theme/app_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GetiApp extends ConsumerWidget {
  const GetiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'GETI',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: router,
          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              child: child ?? const SizedBox.shrink(),
              breakpoints: const [
                Breakpoint(start: 0, end: 600, name: MOBILE),
                Breakpoint(start: 601, end: 1024, name: TABLET),
                Breakpoint(start: 1025, end: 1920, name: DESKTOP),
                Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            );
          },
        );
      },
    );
  }
}
