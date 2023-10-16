import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../provider/ProductProvider.dart';

class DecorOption extends StatefulWidget {
  List<String> optionDecor = [];
  DecorOption({Key? key, required this.optionDecor}) : super(key: key);
  _DecorOption createState() => _DecorOption();
}

List<String> selectedDecor = [];

class _DecorOption extends State<DecorOption> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<ProductProvider>(context);
    return DropDownMultiSelect(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.villa),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixText: 'Decor',
        prefixStyle: TextStyle(color: kPrimaryColor, fontSize: 17),
        isCollapsed: false,
        labelStyle: TextStyle(
          color: kPrimaryColor,
        ),
        focusColor: kPrimaryColor,
      ),
      options: widget.optionDecor,
      selectedValues: selectedDecor,
      onChanged: (value) {
        setState(() {
          selectedDecor = value;
          _provider.getDecor(selectedDecor);
        });
      },
      whenEmpty: 'Enter the decor',
    );
  }
}
