
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madina/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  Bloc.observer = SimpleBlocObserever();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
      ),
    );
  });
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              // localizationsDelegates: [
              //   S.delegate,
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,
              // ],
              // supportedLocales: S.delegate.supportedLocales,
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                fontFamily: GoogleFonts.manrope().fontFamily,
              ),
              // initialRoute: AppRoutes.initialRoute,
              // routes: AppRoutes.routes,
              // onGenerateRoute: AppRoutes.generateRoute,
            );
          }),
    );
  }
}
