import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_github_cubit/bloc/issue_cubit.dart';
import 'package:user_github_cubit/bloc/repository_cubit.dart';
import 'package:user_github_cubit/bloc/user_cubit.dart';
import 'package:user_github_cubit/service/api.dart';
import 'package:user_github_cubit/view/home_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                  primarySwatch: Colors.green,
                  primaryColor: Colors.green[600],
                  fontFamily: 'Nunito'),
              home: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => UserCubit(RestDataSource())),
                  BlocProvider(create: (_) => IssueCubit(RestDataSource())),
                  BlocProvider(
                      create: (_) => RepositoryCubit(RestDataSource())),
                ],
                child: const HomePage(
                  category: 0,
                ),
              ),
            ));
  }
}
