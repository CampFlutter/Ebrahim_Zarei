import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_1/controller/user_provider.dart';

class WeightBox extends StatelessWidget {
  const WeightBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Consumer<UserProvider>(
        builder: (context, user, _) => Container(
          margin: const EdgeInsets.all(10),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 20, 14, 41)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Weight',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              Text(
                user.weight.toString(),
                style: const TextStyle(
                    height: 1,
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () {},
                      shape: const CircleBorder(),
                      backgroundColor: const Color.fromARGB(255, 30, 26, 51),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(
                          Icons.remove,
                          // size: 20,
                        ),
                        onPressed: () {
                          user.weight--;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: RawMaterialButton(
                      shape: const CircleBorder(),
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      fillColor: const Color.fromARGB(255, 30, 26, 51),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(
                          Icons.add,
                          // size: 20,
                        ),
                        onPressed: () {
                          user.weight++;
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
