import 'package:clean_architecture/core/extensions/text_theme_ext.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_architecture/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorSchemes {
  static final light = ColorScheme.fromSeed(
    seedColor: Colors.orangeAccent,
    brightness: Brightness.light,
  );
  static final dark = ColorScheme.fromSeed(
    seedColor: Colors.orangeAccent,
    brightness: Brightness.dark,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => RemoteArticleBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          colorScheme: ColorSchemes.light,
          useMaterial3: true,
          textTheme: GoogleFonts.asapTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: ColorSchemes.light.surface,
            foregroundColor: ColorSchemes.light.onSurface,
          ),
          scaffoldBackgroundColor: ColorSchemes.light.background,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorSchemes.dark,
          useMaterial3: true,
          textTheme: GoogleFonts.asapTextTheme().applyColor(
            Theme
                .of(context)
                .colorScheme
                .onPrimary,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: ColorSchemes.dark.background,
            foregroundColor: ColorSchemes.dark.onBackground,
          ),
          scaffoldBackgroundColor: ColorSchemes.dark.background,
        ),
        themeMode: ThemeMode.system,
        home: const DailyNews(),
      ),
    );
  }
}
