import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_easy/app/components/buttons/mind_button.dart';
import 'package:mind_easy/app/features/sound/providers/current_sound_provider.dart';
import 'package:mind_easy/app/features/sound/providers/playing_sound_provider.dart';
import 'package:mind_easy/core/extensions/color_extension.dart';
import 'package:mind_easy/core/extensions/spacing_extension.dart';
import 'package:mind_easy/core/theme/app_text_style.dart';
import 'package:mind_easy/core/utils/app_size.dart';
import 'package:mind_easy/gen/assets.gen.dart';

class SoundscapeCard extends ConsumerWidget {
  const SoundscapeCard({
    required this.onTap,
    required this.onPlayPause,
    super.key,
  });

  final VoidCallback onTap;
  final ValueChanged<bool> onPlayPause;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sound = ref.watch(currentSoundProvider);

    final durationString = '${Duration(seconds: sound.duration).inMinutes}m';
    return GestureDetector(
      onTap: () {
        // TODO: Implement details page
      },
      child: SizedBox(
        height: 72,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(
                sound.imagePath,
                height: 72,
                width: 72,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: AppSize.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sound.title,
                      style: AppTextStyles.body14Medium.copyWith(
                        color: context.blackWhite,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    4.h,
                    Text(
                      sound.subtitle,
                      style: AppTextStyles.body10Light.copyWith(
                        color: context.blackWhite.o40,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            AppSize.md.w,
            DecoratedBox(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: context.blackWhite.withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                child: Text(
                  durationString,
                  style: AppTextStyles.body10Medium.copyWith(
                    color: context.blackWhite,
                  ),
                ),
              ),
            ),
            AppSize.xlg.w,
            Consumer(
              builder: (context, ref, child) {
                final playingSound = ref.watch(playingSoundProvider);
                final isPlaying = playingSound == sound;

                return MindButton.iconSmall(
                  svgPath: isPlaying
                      ? MindAssets.icons.pause.path
                      : MindAssets.icons.play.path,
                  onPressed: () {
                    ref.read(playingSoundProvider.notifier).toggle(sound);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
