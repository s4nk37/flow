import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/date_time_picker.dart';
import '../../../../core/configs/app_config.dart';
import '../../../../core/i18n/strings.g.dart';
import '../../../../core/utils/constants/layout_constants.dart';
import '../../../../core/utils/extensions/sizebox_extension.dart';
import '../../../../core/utils/theme/app_theme.dart';
import '../../../../core/widgets/base_textformfield.dart';
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
  DateTime? _reminderTime;

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
        createdAt: DateTime.now().toUtc(),
        reminderAt: _reminderTime?.toUtc(),
      );
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
              BaseTextFormField(
                controller: _taskController,
                hintText: t.task_name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.please_enter_task_name;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: BaseTextFormField(
                      controller: _descriptionController,
                      hintText: t.description,
                      maxLines: 2,
                    ),
                  ),
                  15.0.spaceX,
                  // Expanded(
                  //   flex: 4,
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 17, horizontal: 16),
                  //     decoration: BoxDecoration(
                  //       color: AppTheme.of(context).primary,
                  //       borderRadius:
                  //           BorderRadius.circular(RadiusConstant.commonRadius),
                  //     ),
                  //     // child: GestureDetector(
                  //     //   onTap: () async {
                  //     //     DatePickerWidget(
                  //     //       onDateTimeChanged: () {},
                  //     //     );
                  //     //     // DateTime? selectedDate = await showDatePicker(
                  //     //     //   context: context,
                  //     //     //   initialDate: DateTime.now(),
                  //     //     //   firstDate: DateTime.now(),
                  //     //     //   lastDate: DateTime(2100),
                  //     //     // );
                  //     //     // if (selectedDate != null) {
                  //     //     //   _reminderTime =
                  //     //     //       selectedDate.toString().toDateFormat();
                  //     //     //   setState(() {});
                  //     //     // }
                  //     //   },
                  //     //   child: _reminderTime.isEmpty
                  //     //       ? Icon(
                  //     //           Icons.notifications_active,
                  //     //           color: AppTheme.of(context).background,
                  //     //         )
                  //     //       : Text(
                  //     //           _reminderTime,
                  //     //           style: TextStyle(
                  //     //             color: AppTheme.of(context).background,
                  //     //           ),
                  //     //         ),
                  //     // ),
                  //     child: DatePickerWidget(
                  //       onDateTimeChanged: () {},
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              DateTimePickerWidget(
                onDateTimeChanged: (date) {
                  logger.d("Date: $date");
                  _reminderTime = date;
                },
              ),
              ElevatedButton(
                onPressed: _saveTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.of(context).primary,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(RadiusConstant.commonRadius),
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
