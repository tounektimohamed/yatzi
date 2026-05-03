import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'presentation/auth/auth_provider.dart';
import 'presentation/auth/auth_screen.dart';
import 'presentation/game/game_provider.dart';
import 'presentation/game/game_screen.dart';
import 'presentation/lobby/lobby_provider.dart';
import 'presentation/lobby/lobby_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: YatzyApp()));
}

class YatzyApp extends ConsumerWidget {
  const YatzyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);

    return MaterialApp(
      title: 'Sa7bi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF1A1A2E),
        useMaterial3: true,
      ),
      home: authState.when(
        data: (user) {
          if (user == null) return const AuthScreen();
          return const _AppNavigator();
        },
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (_, __) => const AuthScreen(),
      ),
    );
  }
}

class _AppNavigator extends ConsumerWidget {
  const _AppNavigator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lobbyState = ref.watch(lobbyProvider);
    final lobbyData = lobbyState.value;
    if (lobbyData == null || lobbyData.gameId == null) {
      return const LobbyScreen();
    }

    final gameId = lobbyData.gameId!;
    final gameAsync = ref.watch(gameStreamProvider(gameId));
    final game = gameAsync.value;

    if ((game != null && game.isPlaying) || (game != null && game.isFinished)) {
      return GameScreen(gameId: gameId);
    }

    return const LobbyScreen();
  }
}
