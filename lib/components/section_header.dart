import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionHeader extends StatelessWidget {
  final String asset;
  final double size;

  SectionHeader({@required this.asset, @required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.0, color: Color(0xFF3023AE).withOpacity(0.3),)
          )
      ),
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(children: <Widget>[
        SvgPicture.asset(this.asset, width: this.size, height: this.size),
      ]),
    );
  }
}