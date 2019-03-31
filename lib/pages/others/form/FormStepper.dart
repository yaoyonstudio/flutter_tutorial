import 'package:flutter/material.dart';

class FormStepper extends StatefulWidget {
  FormStepper(
      {Key key,
      this.value,
      this.onChange,
      this.step = 1,
      this.minValue,
      this.maxValue})
      : super(key: key);

  final int value;
  final int step;
  final int minValue;
  final int maxValue;
  final Function onChange;

  @override
  _StepperState createState() => new _StepperState();
}

class _StepperState extends State<FormStepper> {
  int currentValue;

  @override
  void initState() {
    super.initState();

    setState(() {
      currentValue = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 26.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0)),
                  color: Color.fromRGBO(245, 245, 245, 1.0)),
              width: 32.0,
              height: double.infinity,
              child: Center(
                child: Text('-'),
              ),
            ),
            onTap: () {
              if (widget.minValue != null) {
                if (currentValue - widget.step >= widget.minValue) {
                  setState(() {
                    currentValue = currentValue - widget.step;
                  });
                  widget.onChange(currentValue);
                }
              } else {
                if (currentValue > 0) {
                  setState(() {
                    currentValue = currentValue - widget.step;
                  });
                  widget.onChange(currentValue);
                }
              }
            },
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: 1.0,
                right: 1.0,
              ),
              decoration:
                  BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1.0)),
              child: Center(
                child: Text(
                    '${currentValue == null ? widget.value : currentValue}'),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              width: 32.0,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)),
                  color: Color.fromRGBO(245, 245, 245, 1.0)),
              child: Center(
                child: Text('+'),
              ),
            ),
            onTap: () {
              if (widget.maxValue != null) {
                if (currentValue + widget.step < widget.maxValue) {
                  setState(() {
                    currentValue = currentValue + widget.step;
                  });
                  widget.onChange(currentValue);
                }
              } else {
                setState(() {
                  currentValue = currentValue + widget.step;
                });
                widget.onChange(currentValue);
              }
            },
          ),
        ],
      ),
    );
  }
}
