import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shared/themes/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'features/authentication/presentation/screens/login_screen.dart';
import 'features/authentication/presentation/providers/auth_notifier.dart';

void main() {
  runApp(const ProviderScope(child: NerackApp()));
}

class NerackApp extends ConsumerWidget {
  const NerackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Consumer(
        builder: (context, ref, child) {
          final authState = ref.watch(authNotifierProvider);

          return authState.when(
            initial: () => const LoadingScreen(),
            loading: () => const LoadingScreen(),
            authenticated:
                (userId, email, firstName, lastName, username, avatar) =>
                    const HomePage(),
            unauthenticated: () => const LoginScreen(),
            error: (message, code) => const LoginScreen(),
          );
        },
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nerack'), centerTitle: true),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book, size: 80, color: AppTheme.primaryColor),
            SizedBox(height: 24),
            Text(
              'Welcome to Nerack',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your Personal Bookshelf Management App',
              style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Text(
              '🚀 Phase 1: BOOKSHELF_GENESIS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Story NR-001: ARCH_INIT - Complete ✅',
              style: TextStyle(fontSize: 14, color: AppTheme.successColor),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Clean Architecture Setup Complete!'),
              backgroundColor: AppTheme.successColor,
            ),
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
