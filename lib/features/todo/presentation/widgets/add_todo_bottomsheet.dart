import 'package:flow/core/utils/validations/form_validations.dart';
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
  late final TextEditingController _descriptionController =
      TextEditingController();
  DateTime? _reminderTime;
  bool showDateTimePicker = false;

  @override
  void dispose() {
    _taskController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      // Save the task logic here
      String task = _taskController.text;
      Todo newTodo = Todo(
        id: uuid.v4(),
        title: task,
        description: _descriptionController.text,
        isCompleted: false,
        createdAt: DateTime.now().toUtc(),
        reminderAt: showDateTimePicker ? _reminderTime?.toUtc() : null,
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
                denyEmoji: false,
                validator: (value) {
                  return FormValidations.validateRequired(
                      value, t.please_enter_task_name);
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: BaseTextFormField(
                      controller: _descriptionController,
                      hintText: t.description,
                      maxLines: 2,
                    ),
                  ),
                  15.0.spaceX,
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      decoration: BoxDecoration(
                        color: showDateTimePicker
                            ? AppTheme.of(context).primary
                            : AppTheme.of(context).disabled,
                        borderRadius:
                            BorderRadius.circular(RadiusConstant.commonRadius),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            showDateTimePicker = !showDateTimePicker;
                            _reminderTime = _reminderTime == null
                                ? DateTime.now().add(const Duration(hours: 1))
                                : null;
                          });
                        },
                        child: _reminderTime == null
                            ? Icon(
                                Icons.notifications_off,
                                color: AppTheme.of(context).secondaryBackground,
                              )
                            : Icon(
                                Icons.notifications_active,
                                color: AppTheme.of(context).background,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                margin: EdgeInsets.symmetric(
                    vertical: showDateTimePicker ? 15.0 : 7.5),
                decoration: BoxDecoration(
                  color: AppTheme.of(context).background,
                  borderRadius:
                      BorderRadius.circular(RadiusConstant.commonRadius),
                ),
                height: showDateTimePicker ? 150.0 : 0.001,
                duration: const Duration(seconds: 1),
                curve: Curves.ease,
                child: DateTimePickerWidget(
                  onDateTimeChanged: (date) {
                    logger.d("Reminder Date: $date");
                    _reminderTime = date;
                  },
                ),
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
