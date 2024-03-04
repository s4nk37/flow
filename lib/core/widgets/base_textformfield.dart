import 'package:flow/core/utils/extensions/sizebox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants/layout_constants.dart';
import '../utils/constants/regex_constants.dart';
import '../utils/theme/app_theme.dart';
import 'base_text.dart';
import 'decorated_input_border.dart';

class BaseTextFormField extends StatelessWidget {
  final Key? textFormFieldKey;

  /// A controller for an editable text field.
  final TextEditingController? controller;

  /// The type of information for which to optimize the text input control
  final TextInputType? textInputType;

  /// Decorate a Material Design text field.
  final InputDecoration? decoration;

  /// Defines make field as a read only
  final bool? isReadOnly;

  /// An action the user has requested the text input control to perform.
  final TextInputAction? textInputAction;

  /// To receive key events that focuses on this node, pass a listener to `onKeyEvent`
  final FocusNode? focusNode;

  /// Defines field fil color
  final Color? fillColor;

  /// Validates the textfield
  final FormFieldValidator<String>? validator;

  /// List of enforcements applied to the editing value
  final List<TextInputFormatter>? inputFormatters;

  /// Specifies the hint
  final String? hintText;

  /// Defines hint color
  final Color? hintTextColor;

  /// Whether and how to align text horizontally.
  final TextAlign? textAlign;

  /// Defines suffix icon
  final Widget? suffixIcon;

  /// Defines max lines  of field [Default 1]
  final int? maxLines;

  /// Defines min lines  of field [Default 1]
  final int? minLines;

  /// Defines error lines  of field [Default 1]
  final int? errorLines;

  /// Defines content padding
  final EdgeInsetsGeometry? contentPadding;

  final ValueChanged<String>? onFieldSubmitted;

  /// Defines font weight of entered text
  final FontWeight? fontWeight;

  /// Call when there is the change on the current state of textfield
  final ValueChanged<String>? onChanged;

  final Iterable<String>? autofillHints;

  /// Creates a text style.
  final TextStyle? textStyle;

  /// Creates a hint text style.

  final TextStyle? hintStyle;

  /// Defines enable border color

  final Color? enabledBorderColor;

  /// Defines focus border color

  final Color? focusedBorderColor;
  final Color? borderColor;

  /// Defines error border color
  final Color? errorBorderColor;

  /// Defines focus error border color
  final Color? focusedErrorBorderColor;

  /// Whether this text field should focus itself if nothing else is already focused.
  final bool? autofocus;

  /// Defines on tap of field
  final VoidCallback? onTap;

  /// Callback that generates a custom [InputDecoration.counter] widget.
  final InputCounterWidgetBuilder? buildCounter;

  /// Expands the textfield.
  final bool? expands;

  /// Describes the contrast of a theme or color palette of keyboard.
  final Brightness? keyboardAppearance;

  /// Defines maxlength of text
  final int? maxLength;

  /// Hides the text with the specified character
  final bool? obscureText;

  /// Call when the text editing has been completed
  final VoidCallback? onEditingComplete;

  /// Call when the user saves the form
  final FormFieldSetter<String>? onSaved;

  /// Restoration ID to save and restore the state of the text field.
  final String? restorationId;

  /// Used to show cursor.
  final bool? showCursor;

  /// Indicates how to handle the intelligent replacement of dashes in text input.
  final SmartDashesType? smartDashesType;

  /// Indicates how to handle the intelligent replacement of quotes in text input.
  final SmartQuotesType? smartQuotesType;

  /// Creates a strut style.
  final StrutStyle? strutStyle;

  /// Aligns the text in the vertical axis.
  final TextAlignVertical? textAlignVertical;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard
  final TextCapitalization? textCapitalization;

  /// A direction in which text flows.
  final TextDirection? textDirection;

  /// Configuration of toolbar options.
  final ToolbarOptions? toolbarOptions;

  /// ./// Defines the appearance of an [InputDecorator]'s border.
  final InputBorder? border;

  /// Defines the radius of the border.
  final double? borderRadius;

  /// Defines border width
  final double? borderWidth;

  final String? errorText;

  final Widget? prefixWidget;

  final Widget? prefixIconWidget;

  final BoxConstraints? prefixIconWidgetConstraints;
  final BoxConstraints? suffixIconWidgetConstraints;

  final Color? shadowColor;

  final String? fontFamily;

  final bool? enable;

  final double? width;

  final String? labelText;

  const BaseTextFormField(
      {this.textFormFieldKey,
      this.controller,
      this.textInputType,
      this.decoration,
      this.isReadOnly,
      this.textInputAction,
      this.focusNode,
      this.fillColor,
      this.validator,
      this.inputFormatters,
      this.hintText,
      this.hintTextColor,
      this.textAlign,
      this.suffixIcon,
      this.maxLines,
      this.contentPadding,
      this.minLines,
      this.onFieldSubmitted,
      this.fontWeight,
      this.onChanged,
      this.autofillHints,
      this.textStyle,
      this.hintStyle,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.errorBorderColor,
      this.focusedErrorBorderColor,
      this.onTap,
      this.expands,
      this.keyboardAppearance,
      this.maxLength,
      this.obscureText,
      this.onEditingComplete,
      this.onSaved,
      this.restorationId,
      this.showCursor,
      this.smartDashesType,
      this.smartQuotesType,
      this.strutStyle,
      this.textAlignVertical,
      this.textCapitalization,
      this.textDirection,
      this.toolbarOptions,
      this.autofocus,
      this.buildCounter,
      this.border,
      this.borderRadius,
      this.borderWidth,
      this.errorText,
      this.errorLines,
      this.prefixWidget,
      this.prefixIconWidget,
      this.shadowColor,
      this.enable,
      this.width,
      this.fontFamily,
      this.prefixIconWidgetConstraints,
      this.suffixIconWidgetConstraints,
      this.labelText,
      this.borderColor})
      : super(key: textFormFieldKey);

  @override
  Widget build(BuildContext context) {
    final double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        (labelText?.isNotEmpty ?? false) && labelText != null
            ? BodyMediumText(
                title: labelText ?? '',
                titleColor: AppTheme.of(context).primary,
                fontWeight: FontWeight.w600,
              )
            : const SizedBox.shrink(),
        (labelText?.isNotEmpty ?? false) && labelText != null
            ? 6.0.spaceY
            : const SizedBox.shrink(),
        SizedBox(
          child: TextFormField(
            textAlign: textAlign ?? TextAlign.left,
            inputFormatters: [
              ...?inputFormatters,
              FilteringTextInputFormatter.deny(RegExp(r"^\s*")),
              FilteringTextInputFormatter.deny(
                  RegExp(RegexConstants.emojiRegex)),
            ],
            validator: validator,
            focusNode: focusNode,
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            maxLength: maxLength,
            textInputAction: textInputAction ?? TextInputAction.next,
            readOnly: isReadOnly ?? false,
            style: textStyle ??
                TextStyle(
                    color: AppTheme.of(context).primary,
                    fontSize: 14 / scaleFactor,
                    fontWeight: FontWeight.w600),
            keyboardType: textInputType ?? TextInputType.text,
            controller: controller,
            decoration: decoration ??
                InputDecoration(
                  counterText: '',
                  prefixIconConstraints: prefixIconWidgetConstraints,
                  suffixIconConstraints: suffixIconWidgetConstraints,
                  prefixIcon: prefixIconWidget,
                  prefix: prefixWidget ?? const SizedBox.shrink(),
                  errorText:
                      errorText != null && (errorText?.isNotEmpty ?? false)
                          ? errorText
                          : null,
                  suffixIcon: suffixIcon,
                  hintStyle: hintStyle ??
                      TextStyle(
                          color: AppTheme.of(context).secondaryText,
                          fontSize: 14 / scaleFactor,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily),
                  hintText: hintText ?? '',
                  border: border ?? InputBorder.none,
                  contentPadding: contentPadding ??
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                  fillColor: fillColor ?? AppTheme.of(context).background,
                  filled: true,
                  errorStyle: TextStyle(
                      color: AppTheme.of(context).error,
                      fontSize: 12 / scaleFactor,
                      fontWeight: FontWeight.w600),

                  ///textfield without text field
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: const BorderSide(color: Colors.transparent),
                  //   borderRadius: BorderRadius.circular(RadiusConstant.commonRadius),
                  // ),
                  ///text field with shadow
                  enabledBorder: DecoratedInputBorder(
                    child: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius:
                          BorderRadius.circular(RadiusConstant.commonRadius),
                    ),
                    shadow: buildBoxShadow(context),
                  ),
                  focusedBorder: DecoratedInputBorder(
                    child: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppTheme.of(context).primary),
                      borderRadius:
                          BorderRadius.circular(RadiusConstant.commonRadius),
                    ),
                    shadow: buildBoxShadow(context),
                  ),
                  errorBorder: DecoratedInputBorder(
                    child: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.of(context).error),
                      borderRadius:
                          BorderRadius.circular(RadiusConstant.commonRadius),
                    ),
                    shadow: buildBoxShadow(context),
                  ),
                  focusedErrorBorder: DecoratedInputBorder(
                    child: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppTheme.of(context).primary),
                      borderRadius:
                          BorderRadius.circular(RadiusConstant.commonRadius),
                    ),
                    shadow: buildBoxShadow(context),
                  ),
                  errorMaxLines: errorLines ?? 3,
                ),
            onChanged: onChanged,
            autofillHints: autofillHints,
            onFieldSubmitted: onFieldSubmitted,
            onTap: onTap ?? () {},
            autocorrect: false,
            autofocus: autofocus ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: AppTheme.of(context).primary,
            cursorRadius: const Radius.circular(100),
            cursorHeight: 24,
            enabled: enable ?? true,
            enableIMEPersonalizedLearning: true,
            enableInteractiveSelection: true,
            enableSuggestions: true,
            expands: expands ?? false,
            keyboardAppearance: keyboardAppearance ?? Brightness.light,
            obscureText: obscureText ?? false,
            obscuringCharacter: '●',
            onEditingComplete: onEditingComplete ?? () {},
            onSaved: onSaved ?? (val) {},
            textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            textDirection: textDirection ?? TextDirection.ltr,
            contextMenuBuilder: (context, editableTextState) {
              ///refer this link
              ///https://docs.flutter.dev/release/breaking-changes/context-menus
              final List<ContextMenuButtonItem> buttonItems = [
                ContextMenuButtonItem(
                    onPressed: () {
                      editableTextState
                          .cutSelection(SelectionChangedCause.longPress);
                    },
                    type: ContextMenuButtonType.cut),
                ContextMenuButtonItem(
                    onPressed: () {
                      editableTextState
                          .pasteText(SelectionChangedCause.longPress);
                    },
                    type: ContextMenuButtonType.paste),
                ContextMenuButtonItem(
                    onPressed: () {
                      editableTextState
                          .copySelection(SelectionChangedCause.longPress);
                    },
                    type: ContextMenuButtonType.copy),
                ContextMenuButtonItem(
                    onPressed: () {
                      editableTextState
                          .selectAll(SelectionChangedCause.longPress);
                    },
                    type: ContextMenuButtonType.selectAll),
              ];
              return AdaptiveTextSelectionToolbar.buttonItems(
                anchors: editableTextState.contextMenuAnchors,
                buttonItems: (obscureText ?? false) ? [] : buttonItems,
              );
            },
          ),
        ),
      ],
    );
  }

  BoxShadow buildBoxShadow(context) => BoxShadow(
      color: AppTheme.of(context).primary.withOpacity(0.1),
      blurRadius: 6,
      offset: const Offset(0, 0));
}
