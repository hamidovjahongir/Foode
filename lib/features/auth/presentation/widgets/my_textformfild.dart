import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foode/core/extension/size_extension.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool required;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final OutlineInputBorder? border;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? errorBorder;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? disabledBorder;
  final double borderRadius;
  final bool showVisibilityToggle;
  final IconData? visibilityIcon;
  final IconData? visibilityOffIcon;

  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.initialValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.required = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.onFieldSubmitted,
    this.focusNode,
    this.inputFormatters,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.borderRadius = 12.0,
    this.showVisibilityToggle = false,
    this.visibilityIcon,
    this.visibilityOffIcon,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget? _buildSuffixIcon() {
    if (widget.showVisibilityToggle && widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText
              ? (widget.visibilityOffIcon ?? Icons.visibility_off)
              : (widget.visibilityIcon ?? Icons.visibility),
          color: _isFocused ? Theme.of(context).primaryColor : Colors.grey,
        ),
        onPressed: _toggleVisibility,
      );
    }
    return widget.suffixIcon;
  }

  String? _buildValidator(String? value) {
    if (widget.required && (value == null || value.trim().isEmpty)) {
      return '${widget.labelText ?? 'Bu maydon'} to\'ldirilishi shart';
    }
    return widget.validator?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null) ...[
          Row(
            children: [
              Text(
                widget.labelText!,
                style:
                    widget.labelStyle ??
                    theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: _isFocused ? theme.primaryColor : Colors.grey[700],
                    ),
              ),
              if (widget.required)
                Text(
                  ' *',
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          8.height,
        ],
        TextFormField(
          key: widget.key,
          controller: widget.controller,
          initialValue: widget.initialValue,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: _obscureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          validator: _buildValidator,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          onTap: widget.onTap,
          onFieldSubmitted: widget.onFieldSubmitted,
          style: widget.textStyle ?? theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: widget.hintText,
            helperText: widget.helperText,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: _buildSuffixIcon(),
            filled: widget.filled,
            fillColor:
                widget.fillColor ??
                (widget.enabled
                    ? theme.colorScheme.surface
                    : theme.disabledColor.withOpacity(0.1)),
            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            hintStyle:
                widget.hintStyle ??
                theme.textTheme.bodyLarge?.copyWith(color: Colors.grey[500]),
            counterText: widget.maxLength != null ? null : '',

            // Border configurations
            border: widget.border ?? _defaultBorder(),
            enabledBorder: widget.enabledBorder ?? _defaultBorder(),
            focusedBorder: widget.focusedBorder ?? _focusedBorder(),
            errorBorder: widget.errorBorder ?? _errorBorder(),
            focusedErrorBorder: _focusedErrorBorder(),
            disabledBorder: widget.disabledBorder ?? _disabledBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _defaultBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
    );
  }

  OutlineInputBorder _focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 1.0,
      ),
    );
  }

  OutlineInputBorder _focusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 2.0,
      ),
    );
  }

  OutlineInputBorder _disabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(color: Colors.grey[200]!, width: 1.0),
    );
  }
}

class FieldValidators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) return null;

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Noto\'g\'ri email format';
    }
    return null;
  }

  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) return null;

    if (value.length < minLength) {
      return 'Parol kamida $minLength ta belgidan iborat bo\'lishi kerak';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return null;

    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s\-\(\)]'), ''))) {
      return 'Noto\'g\'ri telefon raqam format';
    }
    return null;
  }

  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'Bu maydon'} to\'ldirilishi shart';
    }
    return null;
  }

  static String? minLength(String? value, int minLength) {
    if (value == null || value.isEmpty) return null;

    if (value.length < minLength) {
      return 'Kamida $minLength ta belgi kiriting';
    }
    return null;
  }

  static String? maxLength(String? value, int maxLength) {
    if (value == null || value.isEmpty) return null;

    if (value.length > maxLength) {
      return 'Maksimum $maxLength ta belgi kiriting';
    }
    return null;
  }
}

class CustomTextFieldExamples extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  CustomTextFieldExamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom TextField Examples')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: 'Email',
              hintText: 'Email manzilingizni kiriting',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              required: true,
              validator: FieldValidators.email,
            ),

            16.height,

            CustomTextFormField(
              labelText: 'Parol',
              hintText: 'Parolingizni kiriting',
              controller: passwordController,
              obscureText: true,
              showVisibilityToggle: true,
              prefixIcon: const Icon(Icons.lock_outlined),
              required: true,
              validator:
                  (value) => FieldValidators.password(value, minLength: 8),
            ),

            16.height,

            CustomTextFormField(
              labelText: 'Telefon raqam',
              hintText: '+998 90 123 45 67',
              controller: phoneController,
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone_outlined),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9+\s\-\(\)]')),
              ],
              validator: FieldValidators.phone,
            ),
          ],
        ),
      ),
    );
  }
}
