// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_class.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveFreezedClassFormConsumer extends StatelessWidget {
  const ReactiveFreezedClassFormConsumer(
      {Key? key, required this.builder, this.child})
      : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, FreezedClassForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveFreezedClassForm.of(context);

    if (formModel is! FreezedClassForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class FreezedClassFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const FreezedClassFormInheritedStreamer(
      {Key? key,
      required this.form,
      required Stream<dynamic> stream,
      required Widget child})
      : super(stream, child, key: key);

  final FreezedClassForm form;
}

class ReactiveFreezedClassForm extends StatelessWidget {
  const ReactiveFreezedClassForm(
      {Key? key, required this.form, required this.child, this.onWillPop})
      : super(key: key);

  final Widget child;

  final FreezedClassForm form;

  final WillPopCallback? onWillPop;

  static FreezedClassForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              FreezedClassFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        FreezedClassFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as FreezedClassFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return FreezedClassFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class FreezedClassFormBuilder extends StatefulWidget {
  const FreezedClassFormBuilder(
      {Key? key,
      required this.model,
      this.child,
      this.onWillPop,
      required this.builder})
      : super(key: key);

  final FreezedClass model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, FreezedClassForm formModel, Widget? child) builder;

  @override
  _FreezedClassFormBuilderState createState() =>
      _FreezedClassFormBuilderState();
}

class _FreezedClassFormBuilderState extends State<FreezedClassFormBuilder> {
  late FormGroup _form;

  late FreezedClassForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = FreezedClassForm(widget.model, _form, null);

    _form.addAll(_formModel.formElements().controls);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFreezedClassForm(
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveForm(
        formGroup: _form,
        onWillPop: widget.onWillPop,
        child: widget.builder(context, _formModel, widget.child),
      ),
    );
  }
}

class FreezedClassForm {
  FreezedClassForm(this.freezedClass, this.form, this.path) {}

  static String idControlName = "id";

  static String nameControlName = "name";

  static String yearControlName = "year";

  final FreezedClass freezedClass;

  final FormGroup form;

  final String? path;

  String idControlPath() => pathBuilder(idControlName);
  String nameControlPath() => pathBuilder(nameControlName);
  String yearControlPath() => pathBuilder(yearControlName);
  String? get idValue => idControl.value;
  String? get nameValue => nameControl.value;
  double? get yearValue => yearControl.value;
  bool get containsId => form.contains(idControlPath());
  bool get containsName => form.contains(nameControlPath());
  bool get containsYear => form.contains(yearControlPath());
  Object? get idErrors => idControl.errors;
  Object? get nameErrors => nameControl.errors;
  Object? get yearErrors => yearControl.errors;
  void get idFocus => form.focus(idControlPath());
  void get nameFocus => form.focus(nameControlPath());
  void get yearFocus => form.focus(yearControlPath());
  void idRemove({bool updateParent = true, bool emitEvent = true}) =>
      form.removeControl(idControlPath(),
          updateParent: updateParent, emitEvent: emitEvent);
  void nameRemove({bool updateParent = true, bool emitEvent = true}) =>
      form.removeControl(nameControlPath(),
          updateParent: updateParent, emitEvent: emitEvent);
  void yearRemove({bool updateParent = true, bool emitEvent = true}) =>
      form.removeControl(yearControlPath(),
          updateParent: updateParent, emitEvent: emitEvent);
  void idValueUpdate(String? value,
          {bool updateParent = true, bool emitEvent = true}) =>
      idControl.updateValue(value,
          updateParent: updateParent, emitEvent: emitEvent);
  void nameValueUpdate(String? value,
          {bool updateParent = true, bool emitEvent = true}) =>
      nameControl.updateValue(value,
          updateParent: updateParent, emitEvent: emitEvent);
  void yearValueUpdate(double? value,
          {bool updateParent = true, bool emitEvent = true}) =>
      yearControl.updateValue(value,
          updateParent: updateParent, emitEvent: emitEvent);
  void idValuePatch(String? value,
          {bool updateParent = true, bool emitEvent = true}) =>
      idControl.patchValue(value,
          updateParent: updateParent, emitEvent: emitEvent);
  void nameValuePatch(String? value,
          {bool updateParent = true, bool emitEvent = true}) =>
      nameControl.patchValue(value,
          updateParent: updateParent, emitEvent: emitEvent);
  void yearValuePatch(double? value,
          {bool updateParent = true, bool emitEvent = true}) =>
      yearControl.patchValue(value,
          updateParent: updateParent, emitEvent: emitEvent);
  void idValueReset(String? value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      idControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void nameValueReset(String? value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      nameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void yearValueReset(double? value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      yearControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get idControl =>
      form.control(idControlPath()) as FormControl<String>;
  FormControl<String> get nameControl =>
      form.control(nameControlPath()) as FormControl<String>;
  FormControl<double> get yearControl =>
      form.control(yearControlPath()) as FormControl<double>;
  FreezedClass get model =>
      FreezedClass(id: idValue, name: nameValue, year: yearValue);
  void updateValue(FreezedClass value,
          {bool updateParent = true, bool emitEvent = true}) =>
      form.updateValue(
          FreezedClassForm(value, FormGroup({}), null).formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void resetValue(FreezedClass value,
          {bool updateParent = true, bool emitEvent = true}) =>
      form.reset(
          value: FreezedClassForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void reset({bool updateParent = true, bool emitEvent = true}) => form.reset(
      value: this.formElements().rawValue,
      updateParent: updateParent,
      emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  FormGroup formElements() => FormGroup({
        idControlName: FormControl<String>(
            value: freezedClass.id,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        nameControlName: FormControl<String>(
            value: freezedClass.name,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        yearControlName: FormControl<double>(
            value: freezedClass.year,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}
