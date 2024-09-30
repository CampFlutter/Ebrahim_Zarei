import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/entity/task_entity.dart';
import 'package:todo/view/page/task/task.dart';
import 'package:todo/view/page/task/tasks_controller.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  void showMyModalBottomSheet(BuildContext context,
      {Task? existingTask, int? index}) async {
    final TextEditingController controller =
        TextEditingController(text: existingTask?.title ?? '');
    void submitTask() async{
      if (existingTask != null) {
        existingTask.title = controller.text;
       await Provider.of<TasksController>(context, listen: false)
            .editTask(existingTask, index!);
            Navigator.pop(context);
      } else {
        if (controller.text.isNotEmpty) {
          final task = Task.fromExisting(TaskEntity(title: controller.text));

         await Provider.of<TasksController>(context, listen: false).addTask(task);
          Navigator.pop(context);
        }
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'کار جدید',
                  style: TextStyle(
                      color: Color.fromARGB(255, 138, 187, 217), fontSize: 20),
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'بنویسید ...',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 165, 183, 196),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 124, 176, 214),
                              width: 3))),
                  controller: controller,
                  onSubmitted: (value) {
                    submitTask();
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        submitTask();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 1, 89, 139),
                          padding: const EdgeInsets.symmetric(vertical: 20)),
                      child:  Text(existingTask == null ? 
                        'اضافه کردن' : 'ویرایش کردن',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final isar = Provider.of<TasksController>(context).isar;
    final taskController = Provider.of<TasksController>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showMyModalBottomSheet(context);
          },
          shape: const CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 1, 89, 139),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        // backgroundColor: Color.fromARGB(255, 89, 193, 254),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await taskController.getTasks();
            },
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 89, 193, 254)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'انجام وظایف',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            taskController.titleText(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 171, 228, 238),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        padding: const EdgeInsets.all(20),
                        child: taskController.taskList.isEmpty
                            ? const Center(
                                child: Text(
                                  'هیچ کاری اضافه نشده',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            :
                             ReorderableListView.builder(
                                onReorder: (oldIndex, newIndex) {
                                   print('Reordering from $oldIndex to $newIndex'); // Add log for debugging
                                  taskController.reorderTask(
                                      oldIndex, newIndex);
                                },
                                itemCount: taskController.taskList.length,
                                itemBuilder: (context, index) => Dismissible(
                                  key: Key(taskController.taskList[index].id
                                      .toString()),
                                  direction: DismissDirection.startToEnd,
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onDismissed: (direction) async {
                                    await taskController.removeTask(
                                        taskController.taskList[index]);
                                  },
                                  child: ListTile(
                                    tileColor: Colors.black,
                                    title: AnimatedDefaultTextStyle(
                                      style: taskController
                                              .taskList[index].isChecked
                                          ? const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  Color.fromARGB(255, 190, 124, 0), // Line color
                                              decorationThickness:
                                                  4, // Line thickness
                                              fontSize: 18, // Font size
                                              color: Colors
                                                  .grey) // Text color when checked
                                          : const TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 18,
                                              color: Colors.black),
                                      duration: const Duration(milliseconds: 400),
                                      child: Text(
                                        taskController.taskList[index].title!,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    trailing: Checkbox(
                                      value: taskController
                                          .taskList[index].isChecked,
                                      onChanged: (value) {
                                        taskController.toggleChecked(index);
                                      },
                                    ),
                                    onTap: () {
                                      showMyModalBottomSheet(context,
                                          existingTask:
                                              taskController.taskList[index],
                                          index: index);
                                    },
                                  ),
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
