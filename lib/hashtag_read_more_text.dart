import 'package:flutter/material.dart';
import 'package:hashtagable/hashtagable.dart';

class HashTagReadMoreText extends StatefulWidget {
  final String text;
  final TextStyle basicStyle;
  final TextStyle decoratedStyle;
  final Function(String) onHashTagTapped;
  final Color expandingButtonColor;

  HashTagReadMoreText(
    this.text, {
    @required this.basicStyle,
    @required this.decoratedStyle,
    this.onHashTagTapped,
    this.expandingButtonColor,
  });

  @override
  _HashTagReadMoreTextState createState() => _HashTagReadMoreTextState();
}

class _HashTagReadMoreTextState extends State<HashTagReadMoreText>
    with TickerProviderStateMixin<HashTagReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final expandingButtonColor = widget.expandingButtonColor != null
        ? widget.expandingButtonColor
        : Colors.black;
    return Column(children: <Widget>[
      AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
              constraints: isExpanded
                  ? BoxConstraints()
                  : BoxConstraints(maxHeight: 50.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: HashTagText(
                  text: widget.text,
                  onTap: widget.onHashTagTapped,
                  basicStyle: widget.basicStyle,
                  decoratedStyle: widget.decoratedStyle,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ))),
      Row(
        children: <Widget>[
          FlatButton(
              child: Text('${isExpanded ? 'Show less' : 'Read more'}',
                  style: TextStyle(color: expandingButtonColor)),
              onPressed: () => setState(() => isExpanded = !isExpanded))
        ],
      )
    ]);
  }
}
