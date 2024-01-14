import 'package:audio_player/config/app_color_scheme.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  final Size? size;
  final double radius;
  final EdgeInsets padding;
  final Color? border;
  const NeuBox({
    super.key,
    required this.child,
    this.size,
    this.radius = 12,
    this.padding = const EdgeInsets.all(12),
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: size?.width,
      height: size?.height,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: border ?? AppColors.containerColor,
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
