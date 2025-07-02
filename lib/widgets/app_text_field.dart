import 'package:flutter/material.dart';

// --- Reusable AppTextField  ---

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const AppTextField({
    Key? key,
    this.controller,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: widget.enabled ? Colors.white : Colors.grey[100],
        border: Border.all(color: Colors.grey[300]!, width: 1.0),
      ),
      child:
          widget.enabled
              ? TextFormField(
                controller: widget.controller,
                enabled: widget.enabled,
                obscureText: _isObscured,
                keyboardType: widget.keyboardType,
                validator: widget.validator,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                decoration: InputDecoration(
                  labelText: widget.label,
                  hintText: widget.hintText,
                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: _buildSuffixIcon(),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.label != null)
                    Text(
                      widget.label!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  if (widget.controller?.text.isNotEmpty == true) ...[
                    const SizedBox(height: 4),
                    Text(
                      widget.controller!.text,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ],
              ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _isObscured ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey[600],
          size: 20,
        ),
        onPressed:
            widget.enabled
                ? () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                }
                : null,
      );
    }
    return widget.suffixIcon;
  }
}

// --- Example usage ---

class ProfileInfoScreen extends StatefulWidget {
  @override
  _ProfileInfoScreenState createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _activityController = TextEditingController();

  String? _notEmptyValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Save logic here
      setState(() {
        _isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Header with edit icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    },
                    child: const Icon(Icons.edit, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Form Starts Here
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  // Always show scrollbar (optional)
                  thickness: 4,
                  radius: const Radius.circular(10),
                  trackVisibility: true,
                  interactive: true,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            controller: _nameController,
                            label: "Name:",
                            hintText: "your name",
                            keyboardType: TextInputType.text,
                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _genderController,
                            label: "Gender:",
                            hintText: "your gender",
                            keyboardType: TextInputType.text,
                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _dobController,
                            label: "DOB:",
                            hintText: "DD/MM/YYYY",
                            keyboardType: TextInputType.datetime,

                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _heightController,
                            label: "Height:",
                            hintText: "Enter height in cm",
                            keyboardType: TextInputType.number,

                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _weightController,
                            label: "Weight:",
                            hintText: "Enter weight in kg",
                            keyboardType: TextInputType.number,

                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _activityController,
                            label: "Activity Level:",
                            hintText: "e.g., Sedentary, Active, Very Active",
                            keyboardType: TextInputType.text,

                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          const SizedBox(height: 20),

                          if (_isEditing)
                            ElevatedButton(
                              onPressed: _saveProfile,
                              child: const Text("Save"),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _dobController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _activityController.dispose();
    super.dispose();
  }
}
