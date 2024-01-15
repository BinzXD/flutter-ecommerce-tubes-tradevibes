import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final IconData? icon; // Tambahkan properti icon di sini

  const FormContainerWidget({
    this.controller,
    this.isPasswordField,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.icon, // Tambahkan parameter icon di sini
  });

  @override
  _FormContainerWidgetState createState() => new _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            // Tambahkan icon di sebelah kiri (jika ada)
            widget.icon != null
                ? Icon(
                    widget.icon,
                    color: Colors.black45,
                  )
                : SizedBox(width: 10),
            Expanded(
              child: new TextFormField(
                style: TextStyle(color: Colors.black),
                controller: widget.controller,
                keyboardType: widget.inputType,
                key: widget.fieldKey,
                obscureText:
                    widget.isPasswordField == true ? _obscureText : false,
                onSaved: widget.onSaved,
                validator: widget.validator,
                onFieldSubmitted: widget.onFieldSubmitted,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: Colors.black45),
                  suffixIcon: new GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: widget.isPasswordField == true
                        ? Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _obscureText == false
                                ? Colors.blue
                                : Colors.grey,
                          )
                        : Text(""),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
