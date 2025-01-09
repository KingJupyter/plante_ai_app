import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../Component/bmi_parameters.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  int _selectedGoal = 1;
  int _selectedActivityLevel = 1;
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  bool _isLoading = false;
  double _age = 20;
  double _height = 1.8;
  double _weight = 85;
  double _waist = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          iconSize: 30,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _saveProfile,
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text(
                    "Save",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildProfileImage(),
              _buildInputFields(),
              _buildGoalSection(),
              _buildActivityLevelSection(),
              BMI_Parameters(
                data: UserData(
                  age: _age,
                  height: _height,
                  weight: _weight,
                  waist: _waist,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // TODO: Implement image selection
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              alignment: Alignment.center,
              child: const Text(
                "AB",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text('Tap to change photo',
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildInputFields() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildTextField(
            controller: firstNameController,
            label: 'First Name',
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter first name' : null,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            controller: lastNameController,
            label: 'Last Name',
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter last name' : null,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            controller: emailController,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: _emailValidator,
          ),
          const SizedBox(height: 20),
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) =>
                setState(() => this.number = number),
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              showFlags: true,
            ),
            initialValue: number,
            textFieldController: phoneController,
            formatInput: true,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            inputBorder: const OutlineInputBorder(),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Goal",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                _buildRadioTile(
                  'Weight Loss',
                  1,
                  groupValue: _selectedGoal,
                  onChanged: (value) => setState(() => _selectedGoal = value!),
                ),
                _buildRadioTile(
                  'Muscle Gain',
                  2,
                  groupValue: _selectedGoal,
                  onChanged: (value) => setState(() => _selectedGoal = value!),
                ),
                _buildRadioTile(
                  'Maintain Weight',
                  3,
                  groupValue: _selectedGoal,
                  onChanged: (value) => setState(() => _selectedGoal = value!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityLevelSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Activity Level",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                _buildRadioTile(
                  'Sedentary',
                  1,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) =>
                      setState(() => _selectedActivityLevel = value!),
                ),
                _buildRadioTile(
                  'Lightly Active',
                  2,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) =>
                      setState(() => _selectedActivityLevel = value!),
                ),
                _buildRadioTile(
                  'Moderately Active',
                  3,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) =>
                      setState(() => _selectedActivityLevel = value!),
                ),
                _buildRadioTile(
                  'Very Active',
                  4,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) =>
                      setState(() => _selectedActivityLevel = value!),
                ),
                _buildRadioTile(
                  'Extra Active',
                  5,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) =>
                      setState(() => _selectedActivityLevel = value!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioTile(String title, int value,
      {required int groupValue, required ValueChanged<int?> onChanged}) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: label,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
    );
  }

  String? _emailValidator(String? value) {
    if (value?.isEmpty ?? true) return 'Please enter email';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> _saveProfile() async {
    if (formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        await Future.delayed(const Duration(seconds: 1));

        formKey.currentState!.save();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile Updated Successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update profile'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
