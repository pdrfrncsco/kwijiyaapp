import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/ranking_entry.dart';
import '../providers/ranking_providers.dart';

class RankingScreen extends ConsumerWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch both providers to trigger initial load if needed
    // but the TabBarView will handle building/watching when active.

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ranking'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Semanal'),
              Tab(text: 'Global'),
            ],
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
          ),
        ),
        body: const TabBarView(
          children: [
            _RankingList(type: 'weekly'),
            _RankingList(type: 'global'),
          ],
        ),
      ),
    );
  }
}

class _RankingList extends ConsumerWidget {
  final String type;

  const _RankingList({required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingAsync = type == 'weekly'
        ? ref.watch(weeklyRankingProvider)
        : ref.watch(globalRankingProvider);

    return rankingAsync.when(
      data: (rankings) {
        if (rankings.isEmpty) {
          return const Center(
            child: Text('Nenhum dado de ranking disponível.'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: rankings.length,
          itemBuilder: (context, index) {
            final entry = rankings[index];
            return _RankingItem(entry: entry);
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (err, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: AppColors.error),
              const SizedBox(height: 16),
              Text(
                'Erro ao carregar ranking:\n$err',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (type == 'weekly') {
                    ref.invalidate(weeklyRankingProvider);
                  } else {
                    ref.invalidate(globalRankingProvider);
                  }
                },
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RankingItem extends StatelessWidget {
  final RankingEntry entry;

  const _RankingItem({required this.entry});

  @override
  Widget build(BuildContext context) {
    final streak = entry.streakDays < 0 ? 0 : entry.streakDays;
    debugPrint('RankingItem user=${entry.username} streakDays=$streak');
    // final isTop3 = entry.rank <= 3;
    Color? rankColor;
    if (entry.rank == 1) {
      rankColor = const Color(0xFFFFD700); // Gold
    } else if (entry.rank == 2) {
      rankColor = const Color(0xFFC0C0C0); // Silver
    } else if (entry.rank == 3) {
      rankColor = const Color(0xFFCD7F32); // Bronze
    }

    // Fallback for rank > 3
    rankColor ??= AppColors.textSecondary;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                '#${entry.rank}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: rankColor,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColors.primary.withValues(alpha: 0.2),
              child: Text(
                entry.username.isNotEmpty
                    ? entry.username.substring(0, 1).toUpperCase()
                    : '?',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Nível ${entry.level} • $streak dias 🔥',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${entry.totalXp}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.primary,
                  ),
                ),
                const Text(
                  'XP',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
