import 'package:flutter/material.dart';

class UserFormPopUp extends StatefulWidget {
  const UserFormPopUp({super.key});

  @override
  State<UserFormPopUp> createState() => _UserFormPopUpState();
}

class _UserFormPopUpState extends State<UserFormPopUp> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _prescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade900,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(" Add User",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 20),
              _buildTextField(_nameController, "User Name", true),
              const SizedBox(height: 12),
              _buildTextField(_ageController, "Age", true, inputType: TextInputType.number),
              const SizedBox(height: 12),
              _buildTextField(_phoneController, "Phone", true, inputType: TextInputType.phone),
              const SizedBox(height: 12),
              _buildTextField(_addressController, "Address", true, maxLines: 2),
              const SizedBox(height: 12),
              _buildTextField(_prescriptionController, "Prescription Info (optional)", false, maxLines: 2),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white, side: const BorderSide(color: Colors.white70)),
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("User Added: ${_nameController.text}");
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text("Save"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, bool required,
      {TextInputType inputType = TextInputType.text, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: required
          ? (value) => value == null || value.isEmpty ? "$label is required" : null
          : null,
    );
  }
}
