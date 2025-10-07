// Llumo Design System for Flutter (v1)
// ------------------------------------------------------------
// Covers: Color tokens, gradients, typography, spacing, radii,
// shadows, motion, ThemeData (light/dark), and core components.
// 
// Usage:
//   import 'llumo_design_system.dart';
//   MaterialApp(theme: AppTheme.light, darkTheme: AppTheme.dark, themeMode: ThemeMode.system)
//
// Optional deps: google_fonts: ^6.0.0 (recommended for Inter/DM Sans)
// ------------------------------------------------------------

import 'package:flutter/material.dart';

// ------------------------------------------------------------
// 1) COLOR TOKENS
// ------------------------------------------------------------
class AppColors {
  // Brand Core
  static const Color glowBlue = Color(0xFF4A6CF7); // serene blue
  static const Color warmGlow = Color(0xFFFFD36E); // warm yellow glow
  static const Color offWhite = Color(0xFFF9F9F9); // off-white

  // Accents
  static const Color lavenderBlue = Color(0xFF90A0F0); // accent 1
  static const Color sunlightTint = Color(0xFFFFEDB8); // accent 2

  // Neutrals (Calm + modern)
  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral10 = Color(0xFFF6F7FA);
  static const Color neutral20 = Color(0xFFEDEFF5);
  static const Color neutral30 = Color(0xFFDADDE7);
  static const Color neutral40 = Color(0xFFC3C9D7);
  static const Color neutral50 = Color(0xFFAAB2C7);
  static const Color neutral60 = Color(0xFF8F98B2);
  static const Color neutral70 = Color(0xFF737D99);
  static const Color neutral80 = Color(0xFF5A6480);
  static const Color neutral90 = Color(0xFF414B63);
  static const Color neutral100 = Color(0xFF2A3246);

  // Semantic (kept soft)
  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFFB020);
  static const Color danger = Color(0xFFEF5350);
}

// ------------------------------------------------------------
// 2) GRADIENTS & GLOWS
// ------------------------------------------------------------
class AppGradients {
  static const Gradient halo = RadialGradient(
    center: Alignment(0, -0.2),
    radius: 1.1,
    colors: [
      AppColors.warmGlow,
      AppColors.glowBlue,
    ],
    stops: [0.0, 1.0],
  );

  static const Gradient softDawn = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.offWhite, AppColors.sunlightTint, AppColors.lavenderBlue],
    stops: [0.0, 0.55, 1.0],
  );
}

class GlowShadow {
  static List<BoxShadow> subtleGlow = [
    BoxShadow(
      color: AppColors.warmGlow.withValues(alpha: 0.35),
      blurRadius: 24,
      spreadRadius: 4,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> orb = [
    BoxShadow(
      color: AppColors.glowBlue.withValues(alpha: 0.28),
      blurRadius: 28,
      spreadRadius: 10,
    ),
    BoxShadow(
      color: AppColors.warmGlow.withValues(alpha: 0.22),
      blurRadius: 40,
      spreadRadius: 16,
    ),
  ];
}

// ------------------------------------------------------------
// 3) SPACING, RADII, ELEVATION, MOTION
// ------------------------------------------------------------
class Space {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
}

class Corners {
  static const double sm = 10; // round terminals aesthetic
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 28; // app cards/buttons (2xl vibe)
}

class Elevation {
  static const double level0 = 0;
  static const double level1 = 1;
  static const double level2 = 3;
  static const double level3 = 6;
  static const double level4 = 10;
}

class Motion {
  static const Duration fast = Duration(milliseconds: 120);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration gentle = Duration(milliseconds: 300);
  static const Curve ease = Curves.easeInOut;
}

// ------------------------------------------------------------
// 4) TYPOGRAPHY
// Inter/DM Sans are recommended; without GoogleFonts fallback to default.
// Replace with GoogleFonts if desired.

TextTheme _textThemeBase(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  final onSurface = isDark ? AppColors.neutral20 : AppColors.neutral100;
  return TextTheme(
    displayLarge: TextStyle(fontSize: 44, fontWeight: FontWeight.w700, height: 1.15, letterSpacing: -0.5, color: onSurface),
    displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, height: 1.15, letterSpacing: -0.2, color: onSurface),
    displaySmall: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, height: 1.15, color: onSurface),

    headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, height: 1.2, color: onSurface),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, height: 1.2, color: onSurface),
    headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.2, color: onSurface),

    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.25, color: onSurface),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.3, color: onSurface),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.3, color: onSurface),

    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, color: onSurface),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5, color: onSurface),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.45, color: onSurface.withValues(alpha: 0.9)),

    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3, color: onSurface), // buttons
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, height: 1.2, color: onSurface.withValues(alpha: 0.95)),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, height: 1.2, color: onSurface.withValues(alpha: 0.85)),
  );
}

// ------------------------------------------------------------
// 5) THEME EXTENSIONS (Halo & Glow tokens)
// ------------------------------------------------------------
@immutable
class HaloTheme extends ThemeExtension<HaloTheme> {
  final Gradient primaryHalo;
  final List<BoxShadow> subtleGlow;
  const HaloTheme({required this.primaryHalo, required this.subtleGlow});

  @override
  HaloTheme copyWith({Gradient? primaryHalo, List<BoxShadow>? subtleGlow}) =>
      HaloTheme(primaryHalo: primaryHalo ?? this.primaryHalo, subtleGlow: subtleGlow ?? this.subtleGlow);

  @override
  ThemeExtension<HaloTheme> lerp(ThemeExtension<HaloTheme>? other, double t) {
    if (other is! HaloTheme) return this;
    return HaloTheme(
      primaryHalo: other.primaryHalo, // gradients don't support lerp well; snap
      subtleGlow: other.subtleGlow,
    );
  }
}

// ------------------------------------------------------------
// 6) COLOR SCHEMES (Material 3 friendly)
// ------------------------------------------------------------
ColorScheme _lightScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.glowBlue,
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFE3E9FF),
  onPrimaryContainer: AppColors.neutral100,

  secondary: AppColors.lavenderBlue,
  onSecondary: AppColors.neutral100,
  secondaryContainer: Color(0xFFE9ECFF),
  onSecondaryContainer: AppColors.neutral100,

  tertiary: AppColors.warmGlow,
  onTertiary: AppColors.neutral100,
  tertiaryContainer: Color(0xFFFFF1CF),
  onTertiaryContainer: AppColors.neutral100,

  error: AppColors.danger,
  onError: Colors.white,
  errorContainer: Color(0xFFFFE3E0),
  onErrorContainer: AppColors.neutral100,

  surface: AppColors.offWhite,
  onSurface: AppColors.neutral100,
  surfaceContainerHighest: Colors.white,
  onSurfaceVariant: AppColors.neutral80,
  outline: AppColors.neutral40,

  background: AppColors.offWhite,
  onBackground: AppColors.neutral100,
  surfaceVariant: AppColors.neutral10,
  outlineVariant: AppColors.neutral30,
  scrim: Colors.black,
  shadow: Colors.black,
  inverseSurface: AppColors.neutral100,
  onInverseSurface: AppColors.neutral10,
  inversePrimary: AppColors.lavenderBlue,
);

ColorScheme _darkScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.glowBlue,
  onPrimary: Colors.white,
  primaryContainer: Color(0xFF233566),
  onPrimaryContainer: AppColors.offWhite,

  secondary: AppColors.lavenderBlue,
  onSecondary: AppColors.neutral100,
  secondaryContainer: Color(0xFF2A3159),
  onSecondaryContainer: AppColors.offWhite,

  tertiary: AppColors.warmGlow,
  onTertiary: AppColors.neutral100,
  tertiaryContainer: Color(0xFF4D3B11),
  onTertiaryContainer: AppColors.offWhite,

  error: AppColors.danger,
  onError: Colors.white,
  errorContainer: Color(0xFF5C2624),
  onErrorContainer: Colors.white,

  surface: Color(0xFF0F1220),
  onSurface: AppColors.neutral20,
  surfaceContainerHighest: Color(0xFF181C2C),
  onSurfaceVariant: AppColors.neutral50,
  outline: AppColors.neutral60,

  background: Color(0xFF0B0E19),
  onBackground: AppColors.neutral20,
  surfaceVariant: Color(0xFF141827),
  outlineVariant: Color(0xFF30364B),
  scrim: Colors.black,
  shadow: Colors.black,
  inverseSurface: AppColors.offWhite,
  onInverseSurface: AppColors.neutral100,
  inversePrimary: AppColors.sunlightTint,
);

// ------------------------------------------------------------
// 7) THEME DATA (LIGHT/DARK)
// ------------------------------------------------------------
class AppTheme {
  static ThemeData get light => _buildTheme(_lightScheme);
  static ThemeData get dark => _buildTheme(_darkScheme);

  static ThemeData _buildTheme(ColorScheme scheme) {
    final isDark = scheme.brightness == Brightness.dark;
    final baseText = _textThemeBase(scheme.brightness);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      textTheme: baseText,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        elevation: Elevation.level0,
        scrolledUnderElevation: Elevation.level1,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: baseText.titleLarge,
        iconTheme: IconThemeData(color: scheme.onSurface),
      ),
      cardTheme: CardThemeData(
        elevation: Elevation.level1,
        color: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Corners.xl)),
        shadowColor: Colors.black.withValues(alpha: isDark ? 0.35 : 0.12),
        margin: const EdgeInsets.all(Space.lg),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Corners.lg)),
        titleTextStyle: baseText.titleLarge,
        contentTextStyle: baseText.bodyMedium,
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: isDark ? scheme.surfaceContainerHighest : Colors.white,
        hintStyle: baseText.bodyMedium?.copyWith(color: scheme.onSurfaceVariant.withValues(alpha: 0.8)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Corners.lg),
          borderSide: BorderSide(color: scheme.outlineVariant, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Corners.lg),
          borderSide: BorderSide(color: scheme.outlineVariant, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Corners.lg),
          borderSide: BorderSide(color: scheme.primary, width: 1.4),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: Space.lg, vertical: Space.md),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: Elevation.level1,
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Corners.lg)),
          padding: const EdgeInsets.symmetric(horizontal: Space.xl, vertical: Space.md),
          textStyle: baseText.labelLarge,
        ).merge(
          ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return scheme.primary.withValues(alpha: 0.10);
              }
              return null;
            }),
            animationDuration: Motion.normal,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          textStyle: baseText.labelLarge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Corners.md)),
          padding: const EdgeInsets.symmetric(horizontal: Space.lg, vertical: Space.sm),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.primary.withValues(alpha: 0.5), width: 1.2),
          textStyle: baseText.labelLarge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Corners.lg)),
          padding: const EdgeInsets.symmetric(horizontal: Space.xl, vertical: Space.md),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: isDark ? scheme.surfaceContainerHighest : scheme.primaryContainer,
        disabledColor: scheme.surfaceContainerHighest,
        selectedColor: scheme.primary.withValues(alpha: 0.12),
        secondarySelectedColor: scheme.secondary.withValues(alpha: 0.12),
        padding: const EdgeInsets.symmetric(horizontal: Space.md, vertical: Space.sm),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Corners.lg)),
        labelStyle: baseText.labelMedium!,
        secondaryLabelStyle: baseText.labelMedium!,
        brightness: scheme.brightness,
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Corners.lg)),
        tileColor: isDark ? scheme.surfaceContainerHighest : Colors.white,
        selectedTileColor: scheme.primary.withValues(alpha: 0.08),
        iconColor: scheme.onSurfaceVariant,
        contentPadding: const EdgeInsets.symmetric(horizontal: Space.lg, vertical: Space.sm),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surface,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurfaceVariant,
        elevation: Elevation.level2,
        type: BottomNavigationBarType.fixed,
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant, thickness: 1),
      extensions: [
        HaloTheme(primaryHalo: AppGradients.halo, subtleGlow: GlowShadow.subtleGlow),
      ],
    );
  }
}

// ------------------------------------------------------------
// 8) CORE COMPONENTS (Styled with Llumo tokens)
// ------------------------------------------------------------
class LlumoButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool primary;

  const LlumoButton.primary(this.label, {super.key, this.onPressed, this.icon}) : primary = true;
  const LlumoButton.secondary(this.label, {super.key, this.onPressed, this.icon}) : primary = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final bg = primary ? scheme.primary : scheme.surface;
    final fg = primary ? scheme.onPrimary : scheme.onSurface;
    final side = primary ? null : Border.all(color: scheme.outlineVariant, width: 1);

    return AnimatedContainer(
      duration: Motion.normal,
      curve: Motion.ease,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(Corners.lg),
        boxShadow: primary ? GlowShadow.subtleGlow : [],
        border: side,
      ),
      padding: const EdgeInsets.symmetric(horizontal: Space.xl, vertical: Space.md),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(Corners.lg),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: fg, size: 18),
              const SizedBox(width: Space.sm),
            ],
            Text(label, style: theme.textTheme.labelLarge?.copyWith(color: fg)),
          ],
        ),
      ),
    );
  }
}

class LlumoCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final bool glow;
  const LlumoCard({super.key, required this.child, this.padding, this.gradient, this.glow = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Corners.xl),
        gradient: gradient,
        color: gradient == null ? scheme.surface : null,
        boxShadow: glow ? GlowShadow.orb : [
          BoxShadow(
            color: Colors.black.withValues(alpha: scheme.brightness == Brightness.dark ? 0.35 : 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: padding ?? const EdgeInsets.all(Space.xl),
      child: child,
    );
  }
}

class LlumoHalo extends StatelessWidget {
  final double size;
  final Widget? center;
  const LlumoHalo({super.key, this.size = 88, this.center});

  @override
  Widget build(BuildContext context) {
    final halo = Theme.of(context).extension<HaloTheme>();
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: halo?.primaryHalo,
        boxShadow: GlowShadow.orb,
      ),
      child: Center(child: center),
    );
  }
}

class LlumoChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool selected;
  final VoidCallback? onTap;
  const LlumoChip({super.key, required this.label, this.icon, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final bg = selected ? scheme.primary.withValues(alpha: 0.12) : (scheme.brightness == Brightness.dark ? scheme.surfaceContainerHighest : scheme.primaryContainer);
    final text = selected ? scheme.primary : scheme.onSurfaceVariant;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Corners.lg),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Space.md, vertical: Space.sm),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(Corners.lg),
          border: Border.all(color: scheme.outlineVariant, width: 1),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: 16, color: text), const SizedBox(width: Space.sm)],
          Text(label, style: theme.textTheme.labelMedium?.copyWith(color: text)),
        ]),
      ),
    );
  }
}

// ------------------------------------------------------------
// 9) SAMPLE: APP BAR & SECTION HEADER
// ------------------------------------------------------------
class LlumoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const LlumoAppBar({super.key, required this.title, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      titleSpacing: Space.lg,
      title: Text(title, style: theme.textTheme.headlineSmall),
      centerTitle: false,
      actions: actions,
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  const SectionHeader({super.key, required this.title, this.subtitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.lg, Space.xl, Space.lg, Space.md),
      child: Row(
        children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: t.titleLarge),
              if (subtitle != null) ...[
                const SizedBox(height: Space.xs),
                Text(subtitle!, style: t.bodyMedium?.copyWith(color: t.bodyMedium?.color?.withValues(alpha: 0.8))),
              ],
            ]),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// 10) EXAMPLE SCREEN (for quick visual QA)
// ------------------------------------------------------------
class LlumoDemoScreen extends StatelessWidget {
  const LlumoDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const LlumoAppBar(title: 'Llumo'),
      body: ListView(
        padding: const EdgeInsets.all(Space.lg),
        children: [
          const SectionHeader(
            title: 'Good morning',
            subtitle: 'Here\'s your calm, focused plan for today',
          ),
          LlumoCard(
            glow: true,
            gradient: AppGradients.softDawn,
            child: Row(
              children: [
                const LlumoHalo(size: 64, center: Icon(Icons.wb_sunny_outlined, size: 28, color: Colors.white)),
                const SizedBox(height: Space.xl),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Today\'s Focus', style: t.titleLarge),
                    const SizedBox(height: Space.sm),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(Space.md, Space.xs, Space.md, Space.xs),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Deep work 9–11am', style: t.bodyMedium),
                          Text('Walk break 3pm', style: t.bodyMedium),
                          Text('Review at 6pm', style: t.bodyMedium),
                        ],
                      ),
                    ),
                    const SizedBox(height: Space.lg),
                    const LlumoButton.primary('Start Focus', icon: Icons.play_arrow_rounded),
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: Space.xl),
          Wrap(spacing: Space.md, runSpacing: Space.md, children: const [
            LlumoChip(label: 'Mindful'),
            LlumoChip(label: 'Private'),
            LlumoChip(label: 'Cross‑platform', selected: true),
          ]),
          const SizedBox(height: Space.xxl),
          Row(children: const [
            LlumoButton.primary('Add Reminder', icon: Icons.add_rounded),
            SizedBox(width: Space.lg),
            LlumoButton.secondary('Plan My Day', icon: Icons.auto_awesome_rounded),
          ]),
          const SizedBox(height: Space.xxl),
          Text('Typography', style: t.headlineMedium),
          const SizedBox(height: Space.md),
          Text('Display Large — Llumo brings clarity to your day', style: t.displayLarge),
          Text('Headline Medium — Calm productivity', style: t.headlineMedium),
          Text('Title Large — A friendly companion', style: t.titleLarge),
          Text('Body Medium — Balanced, legible, warm tone', style: t.bodyMedium),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// 11) QUICK START (put in main.dart)
// ------------------------------------------------------------
/*
void main() {
  runApp(const LlumoApp());
}

class LlumoApp extends StatelessWidget {
  const LlumoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const LlumoDemoScreen(),
    );
  }
}
*/
