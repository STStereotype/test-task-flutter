import 'package:flutter/material.dart';

class AuthorizationTextField extends StatefulWidget {
  final label;
  final onChange;
  final isPassword;
  final textCapitalization;
  final inputType;
  final controller;
  final iconData;
  final padding;

  AuthorizationTextField({
    this.iconData,
    this.controller,
    this.inputType = TextInputType.text,
    this.label,
    this.onChange,
    this.isPassword = false,
    this.textCapitalization = TextCapitalization.none,
    this.padding = EdgeInsets.zero,
  });

  @override
  _AuthorizationTextFieldState createState() => _AuthorizationTextFieldState();
}

class _AuthorizationTextFieldState extends State<AuthorizationTextField> {
  bool _showPwd = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        child: TextField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          textCapitalization: widget.textCapitalization,
          obscureText: widget.isPassword && !_showPwd,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.normal,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    color: Colors.red,
                    icon: Icon(
                        _showPwd ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          _showPwd = !_showPwd;
                        },
                      );
                    },
                  )
                : null,
          ),
          onChanged: widget.onChange,
        ),
      ),
    );
  }
}
