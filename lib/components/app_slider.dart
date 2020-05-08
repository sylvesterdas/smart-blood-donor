import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppSlider extends StatelessWidget {
  final Widget panel, body;
  final PanelController _controller;

  AppSlider({@required this.body, @required this.panel, PanelController controller})
    : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      minHeight: 400,
      maxHeight: 450,
      padding: EdgeInsets.all(24),
      controller: _controller,
      backdropColor: Colors.black12,
      header: Container(alignment: Alignment.center, child: Text("This is my panel's header", textAlign: TextAlign.center,)),
      footer: Container(alignment: Alignment.center, child: Text("This is my panel's footer", textAlign: TextAlign.center)),
      backdropOpacity: 0.3,
      backdropEnabled: true,
      renderPanelSheet: true,
      panelBuilder: (ScrollController controller) {
        return Container(
          child: LayoutBuilder(builder: (context, BoxConstraints viewPort) {
            return SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: viewPort.maxHeight),
                    child: panel),
              ),
            );
          }),
        );
      },
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
