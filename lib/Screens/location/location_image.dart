import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

class LocationImage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset("assets/images/location.jpg"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
