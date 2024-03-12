import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  _getInputs(),
                  _getSignUp(),
                  _getBottomRow(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
_getHeader(){
  return Expanded(
      flex: 3,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Registration',
          style: TextStyle(
              color: Colors.white,
              fontSize: 38,
          ),
        ),
      )
  );
}
_getInputs(){
  return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white)
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white)
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white)
            ),
          ),
          SizedBox(height: 15,)
        ],
      )
  );
}
_getSignUp(){
  return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Sign up',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 30,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          )
        ],
      )
  );
}
_getBottomRow(BuildContext context){
  return Expanded(
      child: Row(
        children: <Widget>[
          TextButton(
              onPressed: (){
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              ),
          ),

        ],
      )
  );
}
class BackgroundSignUp extends  CustomPainter{
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
    blueWave.lineTo(sw, sh * 0.65);
    blueWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.5, sh*0.8, sw*0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    //GREY
    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.3);
    greyWave.cubicTo(
        sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw oldDelegate != this;
  }
}
