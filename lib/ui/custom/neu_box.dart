import 'package:audio_player/config/app_color_scheme.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  final Size? size;
  final double radius;
  final EdgeInsets padding;
  final Color border;
  final Color backgroundColor;
  const NeuBox({
    super.key,
    required this.child,
    this.size,
    this.radius = 12,
    this.padding = const EdgeInsets.all(12),
    this.border = AppColors.containerColor,
    this.backgroundColor = AppColors.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: size?.width,
      height: size?.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: border,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            offset: const Offset(5, 5),
            blurRadius: 15,
          ),
          BoxShadow(
            color: theme.highlightColor,
            offset: const Offset(-5, -4),
            blurRadius: 22,
          ),
        ],
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
