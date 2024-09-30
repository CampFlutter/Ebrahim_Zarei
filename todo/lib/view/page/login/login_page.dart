import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view/page/login/login_controller.dart';
import 'package:todo/view/page/task/to_do_list.dart';
import 'package:todo/view/widget/text_field_login.dart';
import 'package:todo/view/widget/wave_painter.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginController>(context);
    // final taskController = Provider.of<TasksController>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 150),
            painter: WavePainter(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                child: TextFieldLogin(
                  hint: 'نشانی پست الکترونیکی',
                  icon: Icons.email,
                  controller: _username,
                  onChanged: (value) {
                    loginProvider.username = value;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                child: TextFieldLogin(
                  hint: 'گذرواژه',
                  icon: Icons.vpn_key,
                  password: true,
                  controller: _password,
                  onChanged: (value) {
                    loginProvider.password = value;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (loginProvider.login()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const ToDoList(),
                        ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                ),
                child: const Text('ورود'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
