import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/configs/app_config.dart';
import '../../../../core/i18n/strings.g.dart';
import '../../../../core/utils/theme/app_theme.dart';
import '../../domain/entities/todo.dart';
import '../bloc/todo_bloc.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _taskController = TextEditingController();
  late final TextEditingController _titleController = TextEditingController();
  late final TextEditingController _descriptionController =
      TextEditingController();
  String _reminderTime = "";

  @override
  void dispose() {
    _taskController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      // Save the task logic here
      String task = _taskController.text;
      Todo newTodo = Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: task,
        description: _descriptionController.text,
        isCompleted: false,
        createdAt: DateTime.now(),
        reminderAt: _reminderTime.isNotEmpty
            ? DateFormat('yyyy-MM-dd').parse(_reminderTime)
            : null,
      );
      // context.read<TodoBloc>().add(AddTodo(todo:newTodo));
      BlocProvider.of<TodoBloc>(context).add(AddTodo(todo: newTodo));

      logger.d('Saving task: $task');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _taskController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.please_enter_task_name;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: t.task_name,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _descriptionController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: t.description,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          _reminderTime =
                              DateFormat('yyyy-MM-dd').format(selectedDate);
                          setState(() {});
                        }
                      },
                      child: _reminderTime.isEmpty
                          ? Icon(
                              Icons.notifications_active,
                              color: AppTheme.of(context).background,
                            )
                          : Text(
                              _reminderTime,
                              style: TextStyle(
                                color: AppTheme.of(context).background,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.of(context).primary,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  t.add_task,
                  style: TextStyle(
                    color: AppTheme.of(context).background,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
