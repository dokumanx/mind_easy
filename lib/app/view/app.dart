import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_easy/app/components/buttons/mind_button.dart';
import 'package:mind_easy/app/components/grid_card.dart';
import 'package:mind_easy/app/components/mind_chip.dart';
import 'package:mind_easy/app/components/soundscape_card.dart';
import 'package:mind_easy/app/components/subscription_card.dart';
import 'package:mind_easy/app/features/sound/providers/current_sound_provider.dart';
import 'package:mind_easy/app/features/sound/providers/get_sounds_provider.dart';
import 'package:mind_easy/core/extensions/spacing_extension.dart';
import 'package:mind_easy/core/theme/app_colors.dart';
import 'package:mind_easy/core/theme/mind_theme.dart';
import 'package:mind_easy/gen/assets.gen.dart';

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  child: Column(
                    children: [
                      const GridCard(),
                      const SubscriptionCard(),
                      MindButton.iconLarge(
                        onPressed: () {},
                        svgPath: MindAssets.icons.work.path,
                      ),
                      MindButton.iconSmall(
                        onPressed: () {},
                        svgPath: MindAssets.icons.arrowLeft.path,
                      ),
                      Row(
                        children: [
                          MindChip(
                            label: 'Selected',
                            onSelected: (value) {},
                            selected: true,
                          ),
                          16.w,
                          MindChip(
                            label: 'Not Selected',
                            onSelected: (value) {},
                            selected: false,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Consumer(
                          builder: (context, ref, child) {
                            final sounds = ref.watch(getSoundsProvider);
                            return sounds.when(
                              data: (data) {
                                return ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 16,
                                  ),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
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
                    ]
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: 16,
                            ),
                            child: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
