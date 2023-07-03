import 'package:chat_gtp/constants/constant.dart';
import 'package:chat_gtp/models/models_model.dart';
import 'package:chat_gtp/providers/models_provider.dart';
import 'package:chat_gtp/services/api_service.dart';
import 'package:chat_gtp/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({super.key});

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String ?currentModel;

  bool isFirstLoading = true;
  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelsProvider>(context, listen: false);
    currentModel = modelProvider.getCurrentModel;

    return FutureBuilder<List<ModelsModel>>(
        future: modelProvider.getAllModels(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              isFirstLoading == true) {
            isFirstLoading = false;
            return const FittedBox(
              child: SpinKitFadingCircle(
                color: Colors.lightBlue,
                size: 30,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );  }
            return snapshot.data == null || snapshot.data!.isEmpty? const SizedBox.shrink()
            : FittedBox(
              child: DropdownButton(
                  dropdownColor: scaffoldBackgroundColor,
                  iconEnabledColor: Colors.white,
                  items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                          (index) => DropdownMenuItem(
                          value: snapshot.data![index].id,
                          child: TextWidget(
                            label: snapshot.data![index].id,
                            fontSize: 15,
                          ))),
                  value: currentModel,
                  onChanged: (value) {
                    setState(() {
                      currentModel = value.toString();
                    });
                    modelProvider.setCurrentModel(value.toString());
                  },
              ),
            );
        });
  }
}
 /*DropdownButton(
      dropdownColor: scaffoldBackgroundColor,
        iconEnabledColor: Colors.white,
        items: getModelsItem,
        value: currentModel,
        onChanged: (value){
          setState(() {
          currentModel = value.toString();
        });}
    );
 */