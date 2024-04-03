import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_promina/core/services/cache_helper.dart';
import 'package:task_promina/core/utils/components.dart';
import 'package:task_promina/core/utils/constants_keys.dart';
import 'package:task_promina/persentation/controllers/upload_image_cubit/upload_image_cubit.dart';
import 'package:task_promina/persentation/screens/login_screen.dart';
import 'package:task_promina/persentation/widgets/custom_image_container.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background2.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25.w, right: 30.w, top: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome \n  ${UploadImageCubit.getCubit(context).user!.userData.name}",
                          style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                        Image.asset(
                          "assets/images/default_pic.png",
                          width: 56.w,
                          height: 56.h,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            CacheHelper.removeData(key: ConstantsKeys.token);
                            context.goToAndKillLastWidget(screen:const LoginScreen()) ;
                                                     },
                          icon: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.white,
                              // foregroundColor: Colors.white,
                              fixedSize: Size(142.w, 45.h)),
                          label: Text(
                            "log out",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                      TextButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                backgroundColor: Colors.white.withOpacity(0.5),
                                title: Column(children: [
                                  TextButton.icon(
                                      onPressed: () {
                                          UploadImageCubit.getCubit(context)
                                              .getimage(
                                                  source: ImageSource.gallery);
                                                  ctx.goBack();},
                                      icon: const Icon(
                                        Icons.image,
                                        color: Colors.purple,
                                      ),
                                      style: TextButton.styleFrom(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor:
                                              const Color.fromRGBO(239, 216, 249, 1),
                                          // foregroundColor: Colors.white,
                                          fixedSize: Size(184.w, 65.h)),
                                      label: Text(
                                        "Gallery",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 44.h,
                                  ),
                                  TextButton.icon(
                                      onPressed: () {
                                          UploadImageCubit.getCubit(context)
                                              .getimage(
                                                  source: ImageSource.camera);
                                                  ctx.goBack();
                                                  },
                                      icon: const Icon(
                                        Icons.camera,
                                        color: Colors.purple,
                                      ),
                                      style: TextButton.styleFrom(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor:
                                              const Color.fromRGBO(235, 246, 255, 1),
                                          // foregroundColor: Colors.white,
                                          fixedSize: Size(184.w, 65.h)),
                                      label: Text(
                                        "Camera",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ]),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.white,
                              // foregroundColor: Colors.white,
                              fixedSize: Size(142.w, 45.h)),
                          icon: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                              )),
                          label: Text(
                            "upload",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Expanded(
                    child:UploadImageCubit.getCubit(context).images.isEmpty?Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children:[
                        const Icon(Icons.image_search_rounded,size:50,color:Colors.grey),
                      Text(
                            "There are no photos to display",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            )), ]
                    ) :GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      itemCount: UploadImageCubit.getCubit(context).images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15.h,
                        crossAxisSpacing: 15.w,
                      ),
                      itemBuilder: (context, index) {
                        return CustomeImageContainer(image: UploadImageCubit.getCubit(context).images[index],);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
