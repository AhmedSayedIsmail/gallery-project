import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_promina/domain/entities/user_entities.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());
  static UploadImageCubit getCubit(context) => BlocProvider.of(context);
  LoginUserEntity? user;
  List<File> images = [];
  getUserProfile({required LoginUserEntity currentuser}) {
    user = currentuser;
    emit(UploadImageInitial());
  }

  Future<void> getimage({required ImageSource source}) async {
    XFile? picker = await ImagePicker().pickImage(source: source);
    if (picker != null) {
      var file = await ImageCropper().cropImage(
          sourcePath: picker.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
      images.add(File(file!.path));
      log("FilePath: ${file.path}");
    } else {
      log('No image selected.');
    }
    emit(UploadImageInitial());
  }
}
