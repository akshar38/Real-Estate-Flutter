import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../provider/ProductProvider.dart';

class SingleChoice extends StatefulWidget {
  List<String> option = [];
  SingleChoice({Key? key, required this.option}) : super(key: key);
  _SingleChoice createState() => _SingleChoice();
}

String selectedOption = '';

class _SingleChoice extends State<SingleChoice> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<ProductProvider>(context);
    return ChipsChoice<String>.single(
      padding: EdgeInsets.zero,
      value: selectedOption,
      onChanged: (val) => setState(() {
        selectedOption = val;
        _provider.getSelectedOption(selectedOption);
      }),
      choiceItems: C2Choice.listFrom(
        source: widget.option,
        value: (i, v) => v,
        label: (i, v) => v,
      ),
      choiceActiveStyle: C2ChoiceStyle(color: kPrimaryColor),
      wrapped: true,
    );
  }
}
