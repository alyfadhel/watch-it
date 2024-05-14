import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/core/widgets/my_button.dart';
import 'package:watch_it/core/widgets/my_form_field.dart';
import 'package:watch_it/features/movies/presentation/screens/movies.dart';
import 'package:watch_it/features/user/login/cubit/cubit.dart';
import 'package:watch_it/features/user/login/cubit/states.dart';
import 'package:watch_it/features/user/network/local/cache_helper.dart';
import 'package:watch_it/main.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit()..getToken(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppLoginSuccessState) {
            CacheHelper.setData(
              key: 'token',
              value: state.requestTokenModel.requestToken,
            ).then(
              (value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(startWidget: MoviesScreen()),
                    ),
                    (route) => false);
              },
            );
            token = state.requestTokenModel.requestToken;
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      20.0,
                    ),
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          const Image(
                            height: 200.0,
                            width: 200,
                            image: AssetImage(
                              'assets/images/banner.png',
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          MyFormField(
                            controller: cubit.userNameController,
                            type: TextInputType.text,
                            label: 'user name',
                            prefix: Icons.person,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'user name must not be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          MyFormField(
                            controller: cubit.passwordController,
                            type: TextInputType.text,
                            label: 'password',
                            prefix: Icons.person,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'password must not be empty';
                              }
                              return null;
                            },
                            isPassword: cubit.isPassword,
                            suffix: cubit.suffix,
                            onPressed: () {
                              cubit.changeLoginVisibility();
                            },
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          ConditionalBuilder(
                            condition: state is! AppLoginLoadingState,
                            builder: (context) => MyButton(
                              onPressedTextButton: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.getUser(
                                    username: cubit.userNameController.text,
                                    password: cubit.passwordController.text,
                                    token: cubit.tokenController.text,
                                  );
                                }
                              },
                              text: 'login',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
