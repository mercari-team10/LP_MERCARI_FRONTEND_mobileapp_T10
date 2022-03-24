import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hms_patient_frontend/routes/routes.dart';
import 'package:hms_patient_frontend/ui/screen/auth/register.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../injection.dart';
import '../../../providers/auth/auth_cubit.dart';
import '../../theme/colors.dart';
import '../../widgets/flush_toast.dart';
import '../../widgets/text_input.dart';

class SignIn extends HookWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _obsecureText = useState(true);
    // final _isRegister = useState(true);
    final TextEditingController _username = useTextEditingController();
    final TextEditingController _password = useTextEditingController();
    final _passFocusNode = useFocusNode();
    final _usernameFocusNode = useFocusNode();
    final _formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (c, p) => c.inProgress != p.inProgress,
        listener: (context, state) {
          if (!state.inProgress) {
            if (state.isAuthenticated) {
							state.patient.fold(
								() {
									Toast.createError(
                      message: 'An error occurred while proceeding with your request').show(context);
									log('Returned Patient was null', name: 'SignIN Page');
								}, 
								(p) => context.router.replace(HomeRootRoute(patient: p))
							);
            } else {
              state.authFailure.fold(
                  () {},
                  (f) => Toast.createError(
                      message: f.map(
                          errorWhileMakingRequest: (_) =>
                              'An error occurred while proceeding with your request',
                          serverError: (_) => 'A server error occurred',
                          unknownError: (_) => 'An unknown error occurred',
                          userNameAlreadyInUse: (_) =>
                              'This username is already registered with us',
                          tooManyRequests: (_) =>
                              'Too many requests have been reported from your side, try agin later',
                          notVerified: (_) =>
                              'Please verify your account through the link sent to your mail',
                          disabledAccount: (_) =>
                              'Your account has been disabled, try contacting the admin',
                          noInternet: (_) => 'Seems like you are offline 😑',
                          invalidEmailAndPasswordCombination: (_) =>
                              'Wrong credentials 🤔'))
                    ..show(context));
            }
          }
        },
        buildWhen: (c, p) => c.inProgress != p.inProgress,
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                fit: StackFit.expand,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      "assets/auth_bg.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align( 
										alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1),
                      child: SafeArea(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  const Text("Don't have an account?"),
                                  TextButton(
                                    onPressed: () => context.router
                                        .replace(const RegisterRoute()),
                                    child: const Text(
                                      "Register !",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Form(
                                  key: _formKey,
                                  autovalidateMode: AutovalidateMode.always,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextInputWidget(
                                          hint: 'Username',
                                          iconData: FontAwesome.id_badge,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          onFieldSubmit: (_) =>
                                              FocusScope.of(context)
                                                  .requestFocus(_passFocusNode),
                                          textEditingController: _username,
                                          validator: (val) => (val.isEmpty == true
                                              ? 'This field can\'t be empty!'
                                              : null),
                                          // autoValidate: true,
                                          focusNode: _usernameFocusNode,
                                        ),
                                        TextInputWidget(
                                          hint: 'Password',
                                          iconData: Icons.lock,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obsecureText: _obsecureText.value,
                                          focusNode: _passFocusNode,
                                          textInputAction: TextInputAction.send,
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 15.0, 0.0, 0.0),
                                          onFieldSubmit: (text) {
                                            // return onButtonPress()
                                          },
                                          hasSuffix: true,
                                          toolTipMsg: _obsecureText.value
                                              ? "Show Password"
                                              : "Hide Password",
                                          onSuffixTap: () => _obsecureText.value =
                                              !_obsecureText.value,
                                          // autoValidate: true,
                                          helperText:
                                              'Length of password should be greater than 6',
                                          textEditingController: _password,
                                          validator: (val) => (val.isEmpty == true
                                              ? 'This field can\'t be empty!'
                                              : (val.length >6
                                                  ? null
                                                  : 'Password should be greater than 6 chars')),
                                          // autoValidate: true,
                                        ),
                                        const SizedBox(height: 30),
                                        AbsorbPointer(
                                          absorbing: state.inProgress,
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<AuthCubit>()
                                                    .signInUser(
                                                        username: _username.text,
                                                        password: _password.text);
                                              },
                                              child: context
                                                      .read<AuthCubit>()
                                                      .state
                                                      .inProgress
                                                  ? const Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 4.0, bottom: 6.0),
                                                      child: SpinKitFadingCircle(
                                                        color: Colors.white,
                                                        size: 32,
                                                      ),
                                                    )
                                                  : const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.0),
                                                      child: Text('Sign In',
                                                          style: TextStyle(
                                                              fontSize: 20.0,
                                                              color:
                                                                  Colors.white)),
                                                    ),
                                            ),
                                          ),
                                          // Padding(
                                          //     padding:
                                          //         const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                                          //     child: SizedBox(
                                          //       height: 40.0,
                                          //       child: ElevatedButton(
                                          //         // elevation: 5.0,
                                          //         // shape: RoundedRectangleBorder(
                                          //         //     borderRadius: BorderRadius.circular(30.0)),
                                          // 	style: ButtonStyle(
                                          // 		elevation: MaterialStateProperty.all(5.0),
                                          // 		shape: MaterialStateProperty.all(
                                          // 			RoundedRectangleBorder(
                                          //             	borderRadius: BorderRadius.circular(30.0)))
                                          // 	),
                                          //         onPressed: (){
                                          // 		context.read<AuthCubit>().signInUser(
                                          // 				phNo: _phNo.text,
                                          // 				password: _password.text
                                          // 			);
                                          // 	},
                                          //         child: context
                                          //                 .read<AuthCubit>()
                                          //                 .state
                                          //                 .inProgress
                                          //             ? const Padding(
                                          //                 padding: EdgeInsets.only(
                                          //                     top: 4.0, bottom: 6.0),
                                          //                 child: SpinKitFadingCircle(
                                          //                   color: Colors.white,
                                          //                   size: 32,
                                          //                 ),
                                          //               )
                                          //             : const Text('Login',
                                          //                 style: TextStyle(
                                          //                     fontSize: 20.0, color: Colors.white)),
                                          //       ),
                                          //     )),
                                        ),
                                      ],
                                    ),
                                  )),
																	SizedBox(
																			height: MediaQuery.of(context).size.height*0.3,
																	)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AuthLoading extends StatelessWidget {
  final bool isLogin;
  const AuthLoading({Key? key, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // if(state.isSubmitting && BlocProvider.of<AuthBloc>(context).state.maybeMap(
          // 		orElse: () => true,
          // 		authenticated: (_) => false))
          ...[
            if (!isLogin)
              const Text('Signing in', style: TextStyle(color: Colors.white))
            else
              const Text('Signing up', style: TextStyle(color: Colors.white)),
          ],
          // else const Text('Fetching up your data from server!!!',style: TextStyle(color: Colors.white)),
          const SizedBox(
            height: 10,
          ),
          SpinKitThreeBounce(color: CustomColors(context).accentColor, size: 30)
        ],
      )),
    );
  }
}
