import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/features/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/features/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
        )
      
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            FlutterLogo(size: 100),
            _RegisterForm(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          CustomTextFormFied(
            label: 'User name',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
            ),
          const SizedBox(height: 10),
          CustomTextFormFied(
            label: 'email',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
            ),
          const SizedBox(height: 10),
          CustomTextFormFied(
            label: 'Password',
            onChanged: registerCubit.passwordChanged,
            obscureText: true,
            errorMessage: password.errorMessage
            ),

          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {

              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Create user'),
          ),
        ],
      ),
    );
  }
}
