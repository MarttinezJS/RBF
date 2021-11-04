import 'package:flutter/material.dart';

class BackgoundSetup extends StatelessWidget {
  
  final Color color;
  final Widget child;
  
  const BackgoundSetup({ Key? key, required this.color, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BackgoundSetupPainter(color),
      child: child,
    );
  }
}


class _BackgoundSetupPainter extends CustomPainter {

  Color color;

  _BackgoundSetupPainter(
    this.color
  );

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
    ..color = color
    ..style = PaintingStyle.fill
    ..strokeWidth = 10;

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width *0.4 , size.height, size.width * 0.5, size.height* 0.85);
    path.quadraticBezierTo(size.width *0.6 , size.height, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0 , size.height);

    path.moveTo(0 , size.height * 0.41);
    path.lineTo(size.width , size.height * 0.41);
    path.lineTo(size.width , size.height * 0.47);
    path.lineTo(0, size.height * 0.47);
    path.lineTo(0 , size.height * 0.41);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_BackgoundSetupPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_BackgoundSetupPainter oldDelegate) => false;
}

class BackgroundSimulacion extends StatelessWidget {
  
  final Color color;
  final Widget child;
  
  const BackgroundSimulacion({ Key? key, required this.color, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BackgoundSimulacionPainter(color),
      child: child,
    );
  }
}


class _BackgoundSimulacionPainter extends CustomPainter {

  Color color;

  _BackgoundSimulacionPainter(
    this.color
  );

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
    ..color = color
    ..style = PaintingStyle.fill
    ..strokeWidth = 10;

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width *0.4 , size.height, size.width * 0.5, size.height* 0.85);
    path.quadraticBezierTo(size.width *0.6 , size.height, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0 , size.height);

    path.moveTo(0 , size.height * 0.41);
    path.lineTo(size.width , size.height * 0.41);
    path.lineTo(size.width , size.height * 0.47);
    path.lineTo(0, size.height * 0.47);
    path.lineTo(0 , size.height * 0.41);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_BackgoundSimulacionPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_BackgoundSimulacionPainter oldDelegate) => false;
}
