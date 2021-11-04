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

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Transform.translate(
          offset: Offset( size.width * 0.15, size.height * 0.53),
          child: circulo(size.aspectRatio * 100 , Theme.of(context).primaryColor),
        ),
        CustomPaint(
          painter: _BackgoundSimulacionPainter(context: context),
          child: CustomPaint(
            painter: _BackgoundSimulacionPainter2(color),
            child: child,
          ),
        ),
      ],
    );
  }
}

class _BackgoundSimulacionPainter2 extends CustomPainter {

  Color color;

  _BackgoundSimulacionPainter2(
    this.color
  );

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
    ..color = color
    ..style = PaintingStyle.fill
    ..strokeWidth = 10;

    path.moveTo( size.width * 0.25, 0 );
    path.quadraticBezierTo(size.width * 0.28, size.height * 0.3, size.width * 0.47, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.65, size.height * 0.2, size.width * 0.7, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.76, size.height * 0.67, size.width , size.height * 0.65);
    path.lineTo( size.width, 0);
    


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_BackgoundSimulacionPainter2 oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_BackgoundSimulacionPainter2 oldDelegate) => false;
}

class _BackgoundSimulacionPainter extends CustomPainter {

  BuildContext context;

  _BackgoundSimulacionPainter({
    required this.context
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
    ..color = Theme.of(context).dividerColor
    ..style = PaintingStyle.fill
    ..strokeWidth = 10;

    path.moveTo( size.width * 0.2, 0 );
    path.quadraticBezierTo(size.width * 0.28, size.height * 0.3, size.width * 0.4, size.height * 0.28);
    path.quadraticBezierTo(size.width * 0.65, size.height * 0.24, size.width * 0.7, size.height * 0.42);
    path.quadraticBezierTo(size.width * 0.76, size.height * 0.67, size.width , size.height * 0.75);
    path.lineTo( size.width, 0);
    


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_BackgoundSimulacionPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_BackgoundSimulacionPainter oldDelegate) => false;
}

Container circulo( double size, Color color ){
  return Container(
    height: size,
    width: size,
    // color: Colors.black,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all( Radius.circular( 100 )),
    ),
  );
}