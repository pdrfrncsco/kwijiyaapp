import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: userAsync.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('Usuário não encontrado.'));
          }

          final displayName =
              user.username ??
              (user.email?.isNotEmpty == true
                  ? user.email!.split('@')[0]
                  : 'Visitante');
          final initial = displayName.isNotEmpty
              ? displayName[0].toUpperCase()
              : '?';
          final streak = user.streakDays < 0 ? 0 : user.streakDays;
          debugPrint('ProfileScreen streakDays=$streak');

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Avatar
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                  child: Text(
                    initial,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Name & Email
                Text(
                  displayName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (user.email?.isNotEmpty == true)
                  Text(
                    user.email!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                if (user.isGuest) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Visitante',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 32),

                // Stats Grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: [
                    _StatCard(
                      label: 'Nível',
                      value: '${user.level}',
                      icon: Icons.bar_chart,
                      color: AppColors.primary,
                    ),
                    _StatCard(
                      label: 'Total XP',
                      value: '${user.totalXp}',
                      icon: Icons.star,
                      color: AppColors.secondary,
                    ),
                    _StatCard(
                      label: 'Dias Seguidos',
                      value: '$streak',
                      icon: Icons.local_fire_department,
                      color: Colors.orange,
                    ),
                    _StatCard(
                      label: 'Makuta',
                      value: '${user.coins}',
                      icon: Icons.monetization_on,
                      color: Colors.yellow[700]!,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Settings / Actions
                Consumer(
                  builder: (context, ref, child) {
                    final soundService = ref.watch(soundServiceProvider);
                    return SwitchListTile(
                      secondary: Icon(
                        soundService.isMuted
                            ? Icons.volume_off
                            : Icons.volume_up,
                        color: AppColors.textPrimary,
                      ),
                      title: const Text(
                        'Efeitos Sonoros',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: !soundService.isMuted,
                      onChanged: (val) => soundService.toggleMute(),
                      contentPadding: EdgeInsets.zero,
                    );
                  },
                ),
                const Divider(),
                _SettingsTile(
                  icon: Icons.language,
                  title: 'Mudar Língua',
                  onTap: () => context.push('/languages'),
                ),
                const Divider(),
                _SettingsTile(
                  icon: Icons.info_outline,
                  title: 'Sobre o Kwijiya',
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationName: 'Kwijiya',
                      applicationVersion: '1.0.0',
                      applicationLegalese: '© 2026 NdeasCloud',
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          'Aprenda línguas nacionais de Angola de forma divertida!',
                        ),
                      ],
                    );
                  },
                ),
                const Divider(),
                _SettingsTile(
                  icon: Icons.logout,
                  title: 'Sair',
                  textColor: AppColors.error,
                  iconColor: AppColors.error,
                  onTap: () {
                    ref.read(authControllerProvider.notifier).logout();
                    context.go('/login');
                  },
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (err, stack) => Center(child: Text('Erro: $err')),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.textDisabled.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? AppColors.textPrimary),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.textDisabled,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
