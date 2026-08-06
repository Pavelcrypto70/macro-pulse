import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData buildMacroTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.ink,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.brass,
      secondary: AppColors.cool,
      surface: AppColors.inkElevated,
      onPrimary: AppColors.ink,
      onSurface: AppColors.cream,
    ),
  );

  final display = GoogleFonts.spaceGroteskTextTheme(base.textTheme);
  final body = GoogleFonts.ibmPlexSansTextTheme(base.textTheme);

  return base.copyWith(
    textTheme: display
        .copyWith(
          displayLarge: display.displayLarge?.copyWith(color: AppColors.cream),
          headlineMedium: display.headlineMedium?.copyWith(
            color: AppColors.cream,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: display.titleLarge?.copyWith(
            color: AppColors.cream,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: display.titleMedium?.copyWith(color: AppColors.cream),
          bodyLarge: body.bodyLarge?.copyWith(color: AppColors.cream, height: 1.45),
          bodyMedium: body.bodyMedium?.copyWith(color: AppColors.muted, height: 1.45),
          bodySmall: body.bodySmall?.copyWith(color: AppColors.muted, height: 1.4),
          labelLarge: GoogleFonts.jetBrainsMono(
            color: AppColors.brass,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4,
          ),
        )
        .apply(bodyColor: AppColors.cream, displayColor: AppColors.cream),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.ink,
      foregroundColor: AppColors.cream,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.spaceGrotesk(
        color: AppColors.cream,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.inkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AppColors.inkLine),
      ),
    ),
    dividerColor: AppColors.inkLine,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.inkElevated,
      selectedItemColor: AppColors.brass,
      unselectedItemColor: AppColors.muted,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brass,
        foregroundColor: AppColors.ink,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.brass,
        side: const BorderSide(color: AppColors.brassDim),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
