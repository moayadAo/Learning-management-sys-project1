
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_system/core/cubit_helper/image_cubit.dart';
import 'package:learning_system/core/cubit_helper/image_state.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/widgets/white_blue_button.dart';

class ImagePickerButton extends StatelessWidget {
  final Function(XFile?) onImageSelected;

  const ImagePickerButton({super.key, required this.onImageSelected});

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    onImageSelected(pickedFile);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        return WhiteBlueButton(
          onPressed: () => _pickImage(context),
          label: state is ImageSuccessState ? 'Image Uploaded' : 'Choose Image',
          isBlue: state is ImageSuccessState ? false : true,
          colorbut: state is ImageSuccessState
              ? ColorManager.greenLightButton
              : ColorManager.blackColorLogo,
          height: 40,
          width: 150,
        );
      },
    );
  }
}
