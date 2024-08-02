import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_easy/app/components/mind_chip.dart';
import 'package:mind_easy/app/components/mind_divider.dart';
import 'package:mind_easy/app/components/soundscape_card.dart';
import 'package:mind_easy/app/features/sound/providers/current_sound_provider.dart';
import 'package:mind_easy/app/features/sound/providers/current_sound_type_provider.dart';
import 'package:mind_easy/app/features/sound/providers/get_sounds_provider.dart';
import 'package:mind_easy/core/enums/sound_type.dart';
import 'package:mind_easy/core/extensions/sound_type_extension.dart';
import 'package:mind_easy/core/extensions/spacing_extension.dart';
import 'package:mind_easy/core/theme/app_colors.dart';
import 'package:mind_easy/core/theme/mind_theme.dart';
import 'package:mind_easy/core/utils/app_size.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: MindTheme.lightTheme,
        darkTheme: MindTheme.darkTheme,
        themeMode: ThemeMode.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => Scaffold(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? AppColors.primaryBlue
                : AppColors.primaryWhite,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    AppSize.xlg.h,
                    SizedBox(
                      height: 36,
                      child: Consumer(
                        builder: (context, ref, child) {
                          final currentSoundType =
                              ref.watch(currentSoundTypeProvider);
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final soundType = SoundType.values[index];
                              return MindChip(
                                onSelected: (value) {
                                  ref
                                      .read(currentSoundTypeProvider.notifier)
                                      .updateType(soundType);
                                },
                                selected: soundType == currentSoundType,
                                label: soundType.formattedName,
                              );
                            },
                            separatorBuilder: (context, index) => AppSize.sm.w,
                            itemCount: SoundType.values.length,
                          );
                        },
                      ),
                    ),
                    AppSize.xlg.h,
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final sounds = ref.watch(getSoundsProvider);
                          return sounds.when(
                            data: (data) {
                              return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const MindDivider(),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final sound = data[index];
                                  return ProviderScope(
                                    overrides: [
                                      currentSoundProvider
                                          .overrideWithValue(sound),
                                    ],
                                    child: SoundscapeCard(
                                      onTap: () {},
                                      onPlayPause: (value) {},
                                    ),
                                  );
                                },
                              );
                            },
                            error: (error, stackTrace) {
                              return Text('Error: $error');
                            },
                            loading: () {
                              return const CircularProgressIndicator();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
