import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_system/core/helper/sizer_media_query.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/validator_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/textfield_app.dart';
import 'package:learning_system/core/widgets/textfield_with_label.dart';

class AddScholarshipsPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _endDateController = TextEditingController();
  final _startDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _dateFormat = DateFormat('dd/MM/yy');

  AddScholarshipsPage({super.key});

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.text = _dateFormat.format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: getHeight(context) / 3,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                AssetsManager.createVideo1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppPadding.p35),
                    TextFiledApp(
                      hintText: 'Enter Scholarship name',
                      controller: _nameController,
                      iconData: Icons.title,
                      validator: (value) => ValidatorManager().validateName(
                        value!,
                        message: 'please enter Title of Scholarships',
                      ),
                    ),
                    const SizedBox(height: AppPadding.p20),
                    TextFiledApp(
                      controller: _descriptionController,
                      hintText: 'Enter Scholarships description',
                      iconData: Icons.description,
                      maxLine: 3,
                    ),
                    const SizedBox(height: AppPadding.p20),
                    TextFiledApp(
                      controller: _durationController,
                      hintText: 'Enter the conditions of scholarship',
                      iconData: Icons.description,
                      validator: (value) => ValidatorManager().validateName(
                        value!,
                        message: 'please enter the conditions of scholarship',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: AppPadding.p10),
                    TextFieldWithLabel(
                      textColor: ColorManager.primary,
                      label: 'Start Date',
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                      child: TextFiledApp(
                        controller: _startDateController,
                        readOnly: true,
                        hintText: "DD/MM/YY",
                        onTap: () => _selectDate(context, _startDateController),
                        validator: (value) =>
                            ValidatorManager().validateName(value!),
                      ),
                    ),
                    const SizedBox(height: AppPadding.p10),
                    TextFieldWithLabel(
                      textColor: ColorManager.primary,
                      label: 'End Date',
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                      child: TextFiledApp(
                        controller: _endDateController,
                        readOnly: true,
                        hintText: "DD/MM/YY",
                        onTap: () => _selectDate(context, _endDateController),
                        validator: (value) =>
                            ValidatorManager().validateName(value!),
                      ),
                    ),
                    const SizedBox(height: AppPadding.p32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // تنفيذ العملية بعد التحقق من صحة الإدخال
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.blueLightButton,
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                        textStyle: const TextStyle(
                          fontSize: FontSize.s18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.celebration_rounded),
                          SizedBox(width: AppMargin.m6),
                          Text('Create Scholarships'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
