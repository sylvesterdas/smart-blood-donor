import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smartblooddonor/core/app_constants.dart';

class AppSlider extends StatelessWidget {
  final Widget panel, body;
  final PanelController _controller;

  AppSlider(
      {@required this.body, @required this.panel, PanelController controller})
      : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      minHeight: MediaQuery.of(context).size.height - 300,
      maxHeight: MediaQuery.of(context).size.height - 100,
      controller: _controller,
//      renderPanelSheet: false,
      panel: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundLight,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 8),
              child: panel,
          )
        ),
      ),
      body: LayoutBuilder(
        builder: (context, BoxConstraints viewPort) {
          return SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: viewPort.maxHeight),
                  child: body),
            ),
          );
        },
      ),
    );
  }
}
