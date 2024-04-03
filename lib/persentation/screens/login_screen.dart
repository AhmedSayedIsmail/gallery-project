import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_promina/core/services/cache_helper.dart';
import 'package:task_promina/core/services/dependancy_injection.dart';
import 'package:task_promina/core/utils/components.dart';
import 'package:task_promina/core/utils/constants_keys.dart';
import 'package:task_promina/persentation/controllers/auth_cubit/auth_cubit.dart';
import 'package:task_promina/persentation/controllers/upload_image_cubit/upload_image_cubit.dart';
import 'package:task_promina/persentation/screens/upload_image_screen.dart';
import 'package:task_promina/persentation/widgets/app_text_form_field.dart';
import 'package:task_promina/persentation/widgets/app_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Form(
                key: AuthCubit.getCubit(context).formKey,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppTextWidget(
                        text: 'MY \n Gellary',
                        textAlign: TextAlign.center,
                        fontsize: 50,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.5)),
                        width: 345.w,
                        height: 388.h,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppTextWidget(
                                text: 'LOG IN',
                                fontsize: 30.sp,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              AppTextFormField(
                                controller:
                                    AuthCubit.getCubit(context).emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your email';
                                  } else if (!value.isValidEmail) {
                                    return 'invaled email';
                                  }
                                  return null;
                                },
                                hintName: 'Enter your email',
                                fontSize: 16.sp,
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              AppTextFormField(
                                  controller: AuthCubit.getCubit(context)
                                      .passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'enter your password';
                                    } else if (value.length < 8) {
                                      return 'weak password';
                                    }
                                    return null;
                                  },
                                  hintName: 'Enter your Password',
                                  ispass: true,
                                  fontSize: 16.sp,
                                  textInputAction: TextInputAction.done,
                                  onsubmit: (value) {
                                    if (AuthCubit.getCubit(context)
                                        .formKey
                                        .currentState!
                                        .validate()) {
                                      AuthCubit.getCubit(context).login();
                                    }
                                  }),
                              SizedBox(
                                height: 25.h,
                              ),
                              BlocConsumer<AuthCubit, AuthState>(
                                builder: (context, state) => state
                                        is LoginLoading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : SizedBox(
                                        width: 285.w,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        123, 179, 255, 1)),
                                            onPressed: () {
                                              if (AuthCubit.getCubit(context)
                                                  .formKey
                                                  .currentState!
                                                  .validate()) {
                                                AuthCubit.getCubit(context)
                                                    .login();
                                              }
                                            },
                                            child: Text(
                                              'SUBMIT',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                listener: (context, state) async {
                                  if (state is LoginFauild) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      state.errorMessage,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 18.sp),
                                    )));
                                  }
                                  if (state is LoginSuccessfully) {
                                    await CacheHelper.saveData(
                                            key: ConstantsKeys.token,
                                            value: state.loginUserEntity.token)
                                        .then((_) {
                                      context.goToAndKillLastWidget(
                                          screen: BlocProvider(
                                        create: (context) =>
                                            sl<UploadImageCubit>()
                                              ..getUserProfile(
                                                  currentuser:
                                                      state.loginUserEntity),
                                        child: const UploadImageScreen(),
                                      ));
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  
  }
}
