import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parmacy_billing_system/views/common/common_color.dart';

class MedicineFormPopUp extends StatefulWidget {
  const MedicineFormPopUp({super.key});

  @override
  State<MedicineFormPopUp> createState() => _MedicineFormPopUpState();
}

class _MedicineFormPopUpState extends State<MedicineFormPopUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _buyDateController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _retailPriceController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _otherNotesController = TextEditingController();

  // 🔹 Date picker helper
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CmmonColors.backgroundColor,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "➕ Add Medicine",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Medicine Name
                _buildTextField(_nameController, "Medicine Name", true),

                const SizedBox(height: 12),

                // Date of Purchase
                _buildDateField(_buyDateController, "Date of Purchase"),

                const SizedBox(height: 12),

                // Date of Expiry
                _buildDateField(_expiryDateController, "Date of Expiry"),

                const SizedBox(height: 12),

                // Description (optional)
                _buildTextField(_descriptionController, "Description (optional)", false, maxLines: 3),

                const SizedBox(height: 12),

                // Retail Price
                _buildTextField(_retailPriceController, "Retail Price", true, inputType: TextInputType.number),

                const SizedBox(height: 12),

                // Selling Price
                _buildTextField(_sellingPriceController, "Selling Price", true, inputType: TextInputType.number),

                const SizedBox(height: 12),

                // Other Notes
                _buildTextField(_otherNotesController, "Other Notes", false, maxLines: 2),

                const SizedBox(height: 20),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white70),
                      ),
                      child: const Text("Cancel"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // ✅ Save medicine data logic here
                          print("Medicine Saved: ${_nameController.text}");
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Save"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CmmonColors.navigationColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable text field
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

  // 🔹 Reusable date picker field
  Widget _buildDateField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () => _selectDate(context, controller),
      validator: (value) => value == null || value.isEmpty ? "$label is required" : null,
    );
  }
}
