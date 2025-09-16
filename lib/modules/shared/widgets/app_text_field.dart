import 'package:conectar_challenge_front/core/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool obsecureText;
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.obsecureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.inputFormatters,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _internalObsecureText = false;
  @override
  void initState() {
    super.initState();
    _internalObsecureText = widget.obsecureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          obscureText: _internalObsecureText,
          scrollPadding: EdgeInsets.zero,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          style: const TextStyle(fontSize: 14),
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            hintText: widget.hint,
            enabledBorder: OutlineInputBorder(
              gapPadding: 2,
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            contentPadding: const EdgeInsets.only(left: 12),
            border: OutlineInputBorder(
              gapPadding: 2,
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary, width: 1),
            ),
            suffixIconColor: AppColors.primary,
            suffixIcon: !widget.obsecureText
                ? null
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: 60,
                        height: constraints.minHeight + 6,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.4),
                          borderRadius: const BorderRadius.horizontal(right: Radius.circular(10)),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 24,
                            child: IconButton(
                              visualDensity: VisualDensity.compact,
                              icon: Icon(
                                size: 20,
                                _internalObsecureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                color: AppColors.primary,
                              ),
                              onPressed: () {
                                setState(() {
                                  _internalObsecureText = !_internalObsecureText;
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
