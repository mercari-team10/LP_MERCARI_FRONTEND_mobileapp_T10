import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool isDense;
  final bool obsecureText;
  final bool autoValidate;

  /// this property needs to be true if you want a suffix
  final bool hasSuffix;
  final String? toolTipMsg;
  final String? helperText;
  final void Function()? onSuffixTap;
  final String? Function(String) validator;
  final String Function(String)? onSaved;
  final void Function(String)? onFieldSubmit;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final String? hint;
  final String? label;
	final FocusNode? focusNode;
  final IconData? iconData;
  /// Default is zero
  final EdgeInsets? padding;
  final TextInputType? keyboardType;
  // ignore: use_key_in_widget_constructors
  const TextInputWidget({
    this.textEditingController,
    this.isDense = true,
    this.obsecureText = false,
    this.hasSuffix = false,
    this.autoValidate = false,
    this.toolTipMsg,
    this.onSuffixTap,
    this.onFieldSubmit,
    this.hint,
    this.helperText,
    this.iconData,
    this.keyboardType = TextInputType.text,
    this.padding,
    this.label,
    this.textInputAction = TextInputAction.done,
    required this.validator,
    this.onSaved, this.onChanged, this.focusNode
  }) :
        assert(hint != null || label != null || (hasSuffix && toolTipMsg != null && onSuffixTap != null));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
				controller: textEditingController,
				onChanged: onChanged,
        onFieldSubmitted: onFieldSubmit,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
				focusNode: focusNode,
        decoration: InputDecoration(
            isDense: isDense,
            helperText: helperText,
            hintText: hint,
            labelText: label,
            icon: iconData == null?
            null
                : Icon(
              iconData,
              color: Colors.grey,
            ),
            suffix: hasSuffix
                ? Tooltip(
                message: toolTipMsg!,
                child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: onSuffixTap,
                  child: Icon(obsecureText
                      ? FontAwesome.eye
                      : FontAwesome.eye_slash),
                ))
                : null),
        obscureText: obsecureText,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          paste: true,
          selectAll: true,
        ),
				autovalidateMode: autoValidate? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        validator:(val) => validator(val!),
        onSaved: (value){
					focusNode?.unfocus();
					if(onSaved != null)
						onSaved!(value!);
				},
      ),
    );
  }
}
