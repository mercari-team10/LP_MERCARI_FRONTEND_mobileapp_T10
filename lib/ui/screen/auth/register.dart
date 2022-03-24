import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hms_patient_frontend/infrastructure/models/patient.dart';
import 'package:hms_patient_frontend/routes/routes.dart';
import 'package:intl/intl.dart' as i;

import '../../../injection.dart';
import '../../../providers/auth/auth_cubit.dart';
import '../../theme/colors.dart';
import '../../widgets/flush_toast.dart';
import '../../widgets/text_input.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              // fit: StackFit.expand,
              children: [
                SizedBox(
                  // height: ,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset(
                    "assets/auth_bg.svg",
                    // clipBehavior: Clip.none,
                    fit: BoxFit.fill,
                  ),
                ),
                ListView(
                  children: [
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
                                  "Register",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text("Already have an account?"),
                                    TextButton(
                                      onPressed: () => context.router
                                          .replace(const SignInRoute()),
                                      child: Text(
                                        "Sign In!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16 * 2),
                                const RegisterForm(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                )
                                // const SizedBox(height: 16 * 2),
                                // SizedBox(
                                //   width: double.infinity,
                                //   child: ElevatedButton(
                                //     onPressed: () {
                                //       if (_formKey.currentState!.validate()) {
                                //         // Sign up form is done
                                //         // It saved our inputs
                                //         _formKey.currentState!.save();
                                //       }
                                //     },
                                //     child: Text("Sign Up"),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class RegisterForm extends HookWidget {
  const RegisterForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> gender = ['M', 'F', 'O'];
    final _obsecureText = useState(true);
    final dateTime = useState(DateTime.now().millisecondsSinceEpoch);
    final TextEditingController _name = useTextEditingController();
    final TextEditingController _username = useTextEditingController();
    final TextEditingController _aadhar = useTextEditingController();
    final TextEditingController _dob = useTextEditingController(
        text: i.DateFormat("dd-MMMM-yyyy").format(DateTime.now()));
    final TextEditingController _gender = useTextEditingController();
    final TextEditingController _phNo = useTextEditingController();
    final TextEditingController _password = useTextEditingController();
    final _passFocusNode = useFocusNode();
    final _usernameFocusNode = useFocusNode();
    final _phNoFocusNode = useFocusNode();
    final _nameFocusNode = useFocusNode();
    final _aadharFocusNode = useFocusNode();
    // final _genderFocusNode = useFocusNode();
    // final _dobFocusNode = useFocusNode();
    final _formKey = GlobalKey<FormState>();
    late Patient _patient;
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (c, p) => c.inProgress != p.inProgress,
        listener: (context, state) {
          if (!state.inProgress) {
            if (state.isAuthenticated) {
              context.router.replace(HomeRootRoute(patient: _patient));
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  // shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextInputWidget(
                      hint: 'Name',
                      iconData: Icons.person,
                      onFieldSubmit: (_) => FocusScope.of(context)
                          .requestFocus(_usernameFocusNode),
                      textEditingController: _name,
                      validator: (val) => (val.isEmpty == true
                          ? 'This field can\'t be empty!'
                          : null),
                      // autoValidate: true,
                      focusNode: _nameFocusNode,
                    ),
                    TextInputWidget(
                      hint: 'Username',
                      iconData: FontAwesome.id_badge,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      onFieldSubmit: (_) =>
                          FocusScope.of(context).requestFocus(_phNoFocusNode),
                      textEditingController: _username,
                      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      validator: (val) => (val.isEmpty == true
                          ? 'This field can\'t be empty!'
                          : null),
                      // autoValidate: true,
                      focusNode: _usernameFocusNode,
                    ),
                    TextInputWidget(
                      hint: 'Phone Number',
                      iconData: Icons.phone_android_outlined,
                      onFieldSubmit: (_) =>
                          FocusScope.of(context).requestFocus(_aadharFocusNode),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      textEditingController: _phNo,
                      validator: (val) => (val.isEmpty == true
                          ? 'This field can\'t be empty!'
                          : (val.length == 10 ? null : 'Invalid phone number')),
                      // autoValidate: true,
                      focusNode: _phNoFocusNode,
                    ),
                    TextInputWidget(
                      hint: 'Aadhar',
                      iconData: AntDesign.idcard,
                      // onFieldSubmit: (_) =>
                      //     FocusScope.of(context).requestFocus(_passFocusNode),
                      textEditingController: _aadhar,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                      validator: (val) => (val.isEmpty == true
                          ? 'This field can\'t be empty!'
                          : (val.length == 12
                              ? null
                              : 'Invalid aadhar number')),
                      // autoValidate: true,
                      focusNode: _aadharFocusNode,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(0))),
                              onPressed: () async {
                                final DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(DateTime.now().day),
                                    lastDate:
                                        DateTime(DateTime.now().year + 30),
                                    builder: (context, child) {
                                      return child!;
                                    });

                                if (date != null) {
                                  _dob.text =
                                      i.DateFormat("dd-MMMM-yyyy").format(date);
                                  dateTime.value = date.millisecondsSinceEpoch;
                                }
                              },
                              icon: const Icon(AntDesign.calendar,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                              label: Text(_dob.text,
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 150, 148, 148)))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: DropdownButtonFormField<String>(
                              items: gender.map((g) {
                                return DropdownMenuItem(
                                  value: g,
                                  child: Text(g),
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                hintText: 'Choose Gender...',
                              ),
                              onChanged: (value) => _gender.text = value!,
                              value: _gender.text.isEmpty?null:_gender.text,
                              // onSaved: (value){

                              // },
                              validator: (v) => v?.isEmpty == true
                                  ? 'This field can\'t be empty !'
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextInputWidget(
                      hint: 'Password',
                      iconData: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      obsecureText: _obsecureText.value,
                      focusNode: _passFocusNode,
                      textInputAction: TextInputAction.send,
                      padding: const EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
                      onFieldSubmit: (text) {
                        // return onButtonPress()
                      },
                      hasSuffix: true,
                      toolTipMsg: _obsecureText.value
                          ? "Show Password"
                          : "Hide Password",
                      onSuffixTap: () =>
                          _obsecureText.value = !_obsecureText.value,
                      // autoValidate: true,
                      helperText: 'Length of password should be greater than 6',
                      textEditingController: _password,
                      validator: (val) => (val.isEmpty == true
                          ? 'This field can\'t be empty!'
                          : (val.length > 6
                              ? null
                              : 'Password should be greater than 6 chars')),
                      // autoValidate: true,
                    ),
                    AbsorbPointer(
                      absorbing: state.inProgress,
                      child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                          child: SizedBox(
                            height: 40.0,
                            width: double.infinity,
                            child: ElevatedButton(
                              // elevation: 5.0,
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(30.0)),
                              // style: ButtonStyle(
                              //     elevation: MaterialStateProperty.all(5.0),
                              //     shape: MaterialStateProperty.all(
                              //         RoundedRectangleBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(30.0)))),
                              onPressed: () {
                                // context.read<Patient>().
                                _patient = Patient(
                                  nhid: '',
                                  name: _name.text,
                                  phNo: _phNo.text,
                                  dob: dateTime.value,
                                  username: _username.text,
                                  aadhar: _aadhar.text,
                                  gender: _gender.text,
                                );
                                context.read<AuthCubit>().registerUser(
                                    patient: _patient,
                                    password: _password.text);
                              },
                              child: context.read<AuthCubit>().state.inProgress
                                  ? const Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.0, bottom: 6.0),
                                      child: SpinKitFadingCircle(
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    )
                                  : const Text('Register',
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white)),
                            ),
                          )),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
