import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_promina/core/services/cache_helper.dart';
import 'package:task_promina/core/services/dependancy_injection.dart';
import 'package:task_promina/my_bloc_observer.dart';
import 'package:task_promina/persentation/controllers/auth_cubit/auth_cubit.dart';
import 'package:task_promina/persentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DependancyInjection().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: 
        BlocProvider(
          create:(context)=>sl<AuthCubit>(),
          child: const LoginScreen()),
      ),
    );
  }
}
