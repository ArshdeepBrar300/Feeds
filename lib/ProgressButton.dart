import 'package:flutter/material.dart';

class ProgressButton extends StatelessWidget {
  final double progress;
  final VoidCallback onPressed;

  ProgressButton({required this.progress, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(55, 55),
          painter: ProgressRingPainter(progress: progress),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(40, 40),
                shape: CircleBorder(),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black),
            onPressed: onPressed,
            child: Icon(Icons.arrow_forward)),
      ],
    );
  }
}

class ProgressRingPainter extends CustomPainter {
  final double progress;

  ProgressRingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = Colors.blue.withOpacity(0.3);

    Paint progressArc = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = Colors.white;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    canvas.drawCircle(center, radius, outerCircle);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -90 * (3.14 / 180),
      360 * progress * (3.14 / 180),
      false,
      progressArc,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
