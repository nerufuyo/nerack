import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ISBNType { isbn10, isbn13 }

class ISBNInputField extends StatefulWidget {
  final ISBNType type;
  final String? value;
  final void Function(String) onChanged;
  final String? errorText;
  final bool isValid;
  final bool isValidating;

  const ISBNInputField({
    super.key,
    required this.type,
    this.value,
    required this.onChanged,
    this.errorText,
    this.isValid = false,
    this.isValidating = false,
  });

  @override
  State<ISBNInputField> createState() => _ISBNInputFieldState();
}

class _ISBNInputFieldState extends State<ISBNInputField> {
  final _controller = TextEditingController();
  late final TextInputFormatter _formatter;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value ?? '';
    _formatter = widget.type == ISBNType.isbn10
        ? _ISBN10InputFormatter()
        : _ISBN13InputFormatter();
  }

  @override
  void didUpdateWidget(ISBNInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && widget.value != _controller.text) {
      _controller.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isISBN10 = widget.type == ISBNType.isbn10;
    
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: isISBN10 ? 'ISBN-10' : 'ISBN-13',
        hintText: isISBN10 ? '0-123-45678-9' : '978-0-123-45678-9',
        prefixIcon: const Icon(Icons.qr_code),
        suffixIcon: _buildSuffixIcon(),
        errorText: widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // Show green border when valid
        enabledBorder: widget.isValid && _controller.text.isNotEmpty
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              )
            : null,
      ),
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      inputFormatters: [
        _formatter,
        LengthLimitingTextInputFormatter(isISBN10 ? 13 : 17), // Including hyphens
      ],
      onChanged: (value) {
        // Remove hyphens for validation
        final cleanISBN = value.replaceAll('-', '');
        widget.onChanged(cleanISBN);
      },
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isValidating) {
      return const Padding(
        padding: EdgeInsets.all(12),
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    if (_controller.text.isNotEmpty) {
      if (widget.isValid) {
        return Icon(
          Icons.check_circle,
          color: Theme.of(context).colorScheme.primary,
        );
      } else if (widget.errorText != null) {
        return Icon(
          Icons.error,
          color: Theme.of(context).colorScheme.error,
        );
      }
    }

    return IconButton(
      icon: const Icon(Icons.qr_code_scanner),
      onPressed: _scanISBN,
      tooltip: 'Scan ISBN barcode',
    );
  }

  void _scanISBN() {
    // TODO: Implement barcode scanning
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Barcode scanning feature coming soon!'),
      ),
    );
  }
}

class _ISBN10InputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^0-9Xx]'), '');
    
    if (text.length > 10) {
      return oldValue;
    }

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 1 || i == 4 || i == 9) {
        buffer.write('-');
      }
      buffer.write(text[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _ISBN13InputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    
    if (text.length > 13) {
      return oldValue;
    }

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 3 || i == 4 || i == 7 || i == 12) {
        buffer.write('-');
      }
      buffer.write(text[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
