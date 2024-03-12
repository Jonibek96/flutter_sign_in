import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  _getInputs(),
                  _getSignIn(context),
                  _getBottomRow()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_getHeader() {
  return Expanded(
      flex: 3,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Welcome',
          style: TextStyle(color: Colors.white, fontSize: 37),
        ),
      ));
}

_getInputs() {
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Password'),
        ),
        SizedBox(
          height: 15,
        )
      ],
    ),
  );
}

_getSignIn(BuildContext context) {
  return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Sign in',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup/');
            },
            color: Colors.grey.shade800,
            textColor: Colors.white,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
            padding: EdgeInsets.all(16),
            shape: CircleBorder(),
          ),
        ],
      ));
}

_getBottomRow(){
  return Expanded(
    flex: 1,
    child: Row(
      children: [
        Text(
          'SignUp',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline),
        ),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot password',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            )
        )
      ],
    ),
  );
}

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    //Blue
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.blue.shade300;
    canvas.drawPath(blueWave, paint);

    //GREY
    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.9, sh * 0.15, sw * 0.7, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.5, sh * 0.6, sw * 0.1, sh * 0.5, 0, sh * 0.42);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);

    //Yellow

    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw oldDelegate != this;
  }
}