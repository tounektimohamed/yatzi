import 'package:flutter/material.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/game_colors.dart';

class DieFaceWidget extends StatelessWidget {
  final int value;
  final bool isHeld;
  final double size;

  const DieFaceWidget({
    super.key,
    required this.value,
    this.isHeld = false,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(1, 2),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFFFFF), Color(0xFFF0F0F0)],
        ),
        border: Border.all(
          color: isHeld ? GameColors.diceSlotHeldGlow : const Color(0xFFD0D0D0),
          width: isHeld ? 3 : 1.5,
        ),
      ),
      child: CustomPaint(
        painter: _DieDotsPainter(
          value: value,
          dotColor: GameColors.dotBlue,
        ),
        size: Size(size, size),
      ),
    );
  }
}

class _DieDotsPainter extends CustomPainter {
  final int value;
  final Color dotColor;

  _DieDotsPainter({required this.value, required this.dotColor});

  @override
  void paint(Canvas canvas, Size size) {
    final dotRadius = size.width * 0.095;
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.15)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);
    final dotPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.3, -0.3),
        radius: 1.0,
        colors: [
          dotColor.withValues(alpha: 0.9),
          dotColor,
        ],
      ).createShader(Rect.fromCircle(center: Offset.zero, radius: dotRadius))
      ..style = PaintingStyle.fill;

    final positions = _getDotPositions(size);

    for (final pos in positions) {
      canvas.drawCircle(
        pos + const Offset(0.5, 1),
        dotRadius,
        shadowPaint,
      );
      canvas.drawCircle(pos, dotRadius, dotPaint);
    }
  }

  List<Offset> _getDotPositions(Size size) {
    final w = size.width;
    final h = size.height;
    final p = w * 0.22;
    final c = w * 0.5;
    final r = w - p;
    final t = p;
    final m = h * 0.5;
    final b = h - p;

    switch (value) {
      case 1:
        return [Offset(c, m)];
      case 2:
        return [Offset(r, t), Offset(p, b)];
      case 3:
        return [Offset(r, t), Offset(c, m), Offset(p, b)];
      case 4:
        return [Offset(p, t), Offset(r, t), Offset(p, b), Offset(r, b)];
      case 5:
        return [Offset(p, t), Offset(r, t), Offset(c, m), Offset(p, b), Offset(r, b)];
      case 6:
        return [Offset(p, t), Offset(p, m), Offset(p, b), Offset(r, t), Offset(r, m), Offset(r, b)];
      default:
        return [Offset(c, m)];
    }
  }

  @override
  bool shouldRepaint(covariant _DieDotsPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
