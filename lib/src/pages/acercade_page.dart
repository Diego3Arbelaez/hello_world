import 'package:flutter/material.dart';

import 'package:hello_world/src/pages/acercade_manager_page.dart';


class Acercade extends StatelessWidget {
  // const Acercade({Key? key}) : super(key: key);
  final stateManager = AcercadeManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: Wrap(
            spacing: 50,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Regresar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text('Obtener data'),
                onPressed: () {stateManager.makeGetRequest();},
              ),
            ],
          ),
        ),
        SizedBox( height:20 ),
        ValueListenableBuilder<RequestState> (
            valueListenable:  stateManager.resultNotifier,
            builder: ( context, requestState, child ) {
              if (requestState is RequestLoadInProgress) {
                return CircularProgressIndicator();
              }else if (requestState is RequestLoadSuccess) {
                return Expanded(child: SingleChildScrollView(child: Text(requestState.body)));
              }else {
                return  Container();
              }
            },
         ),
      ],  
    ));
  }
}
