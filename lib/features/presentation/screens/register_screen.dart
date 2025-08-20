import 'package:flutter/material.dart';
import 'package:forms_app/features/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: _RegisterView(),
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormFied(
            label: 'User name',
            onChanged: (value) => username = value,
            validator: (value) {
              if(value == null || value.isEmpty) return 'required field';
              if(value.trim().isEmpty) return 'required field';
              if(value.length < 6) return 'more than 6 characters';
               return null;
            },
            ),
          const SizedBox(height: 10),
          CustomTextFormFied(
            label: 'email',
            onChanged: (value) => email = value ,
            validator: (value) {
              if(value == null || value.isEmpty) return 'required field';
              if(value.trim().isEmpty) return 'required field';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );
              if(!emailRegExp.hasMatch(value)) return 'It is not in email format';
               return null;
            }
            ),
          const SizedBox(height: 10),
          CustomTextFormFied(
            label: 'Password',
            onChanged: (value) => password = value,
            obscureText: true,
            validator: (value) {
              if(value == null || value.isEmpty) return 'required field';
              if(value.trim().isEmpty) return 'required field';
              if(value.length < 6) return 'more than 6 characters';
               return null;
            },
            ),

          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {

              final isValid = _formKey.currentState!.validate();
              if(!isValid) return;

              print('$username, $email, $password');
            },
            icon: const Icon(Icons.save),
            label: const Text('Create user'),
          ),
        ],
      ),
    );
  }
}
