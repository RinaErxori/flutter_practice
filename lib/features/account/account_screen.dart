import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'account_store.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool showLogin = true;

  void _switchMode(bool login) {
    setState(() => showLogin = login);
  }

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<AccountStore>();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Observer(
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeroHeader(isLoggedIn: store.isLoggedIn),
                  const SizedBox(height: 16),
                  if (!store.isLoggedIn) ...[
                    _ModeSwitcher(
                      isLogin: showLogin,
                      onLoginTap: () => _switchMode(true),
                      onRegisterTap: () => _switchMode(false),
                    ),
                    const SizedBox(height: 12),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                      child: showLogin
                          ? _LoginCard(key: const ValueKey('login'), store: store)
                          : _RegisterCard(key: const ValueKey('register'), store: store),
                    ),
                  ] else ...[
                    _ProfileCard(store: store),
                  ],
                  const SizedBox(height: 16),
                  const _InfoCard(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LoginCard extends StatelessWidget {
  final AccountStore store;
  const _LoginCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Вход',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Ник или email',
                prefixIcon: Icon(Icons.person_outline),
              ),
              onChanged: store.setLoginIdentifier,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Пароль',
                prefixIcon: Icon(Icons.lock_outline),
              ),
              obscureText: true,
              onChanged: store.setPassword,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: store.canLogin ? store.login : null,
                icon: const Icon(Icons.login),
                label: const Text('Войти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterCard extends StatelessWidget {
  final AccountStore store;
  const _RegisterCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Регистрация',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: store.setEmail,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Никнейм',
                prefixIcon: Icon(Icons.tag_faces_outlined),
              ),
              onChanged: store.setUsername,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Пароль',
                prefixIcon: Icon(Icons.lock_outline),
              ),
              obscureText: true,
              onChanged: store.setPassword,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: store.canRegister ? store.register : null,
                icon: const Icon(Icons.person_add_alt),
                label: const Text('Создать аккаунт'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final AccountStore store;
  const _ProfileCard({required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(store.currentUser?.username ?? ''),
              subtitle: Text(store.currentUser?.email ?? ''),
              trailing: Chip(
                backgroundColor: Colors.green.shade50,
                label: Text(
                  'Онлайн',
                  style: TextStyle(color: Colors.green.shade800),
                ),
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => context.go('/'),
                    icon: const Icon(Icons.playlist_play),
                    label: const Text('Перейти к играм'),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: store.logout,
                  icon: const Icon(Icons.logout),
                  tooltip: 'Выйти',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeSwitcher extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onLoginTap;
  final VoidCallback onRegisterTap;

  const _ModeSwitcher({
    required this.isLogin,
    required this.onLoginTap,
    required this.onRegisterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onLoginTap,
            icon: const Icon(Icons.login),
            label: const Text('Вход'),
            style: ElevatedButton.styleFrom(
              backgroundColor: isLogin ? Colors.indigo : Colors.white,
              foregroundColor: isLogin ? Colors.white : Colors.indigo,
              side: const BorderSide(color: Colors.indigo),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onRegisterTap,
            icon: const Icon(Icons.person_add_alt),
            label: const Text('Регистрация'),
            style: ElevatedButton.styleFrom(
              backgroundColor: !isLogin ? Colors.indigo : Colors.white,
              foregroundColor: !isLogin ? Colors.white : Colors.indigo,
              side: const BorderSide(color: Colors.indigo),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Зачем входить?',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.check_circle, color: Colors.indigo),
                SizedBox(width: 8),
                Expanded(child: Text('Сохраняйте заметки и прогресс')),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: const [
                Icon(Icons.cloud_upload_outlined, color: Colors.indigo),
                SizedBox(width: 8),
                Expanded(child: Text('Экспорт и импорт данных')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  final bool isLoggedIn;
  const _HeroHeader({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7C8CFD), Color(0xFF5DA5F4)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(Icons.videogame_asset, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                isLoggedIn ? 'Добро пожаловать обратно' : 'Войдите, чтобы продолжить',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            isLoggedIn
                ? 'Перейдите к своим играм и заметкам.'
                : 'Сохраняйте прогресс, теги и заметки в одном месте.',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
