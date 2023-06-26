import 'package:chat_gtp/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelDropDownWidget extends StatefulWidget {
  const ModelDropDownWidget({super.key});

  @override
  State<ModelDropDownWidget> createState() => _ModelDropDownWidgetState();
}

class _ModelDropDownWidgetState extends State<ModelDropDownWidget> {
  String currentModel = "Model1";

  @override
  Widget build(BuildContext context) {
    return  DropdownButton(
      dropdownColor: scaffoldBackgroundColor,
        iconEnabledColor: Colors.white,
        items: getModelsItem,
        value: currentModel,
        onChanged: (value){
          setState(() {
          currentModel = value.toString();
        });}
    );
  }
}
