import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:reactive_forms_generator/src/form_elements/form_array_generator.dart';
import 'package:reactive_forms_generator/src/form_elements/form_control_generator.dart';
import 'package:reactive_forms_generator/src/form_elements/form_element_generator.dart';
import 'package:reactive_forms_generator/src/types.dart';
import 'package:reactive_forms_generator/src/extensions.dart';
import 'package:recase/recase.dart';

class FormGroupGenerator extends FormElementGenerator {
  FormGroupGenerator(ClassElement root, ParameterElement field, DartType? type)
      : super(root, field, type);

  @override
  Element get fieldElement => field.type.element!;

  List<ParameterElement> get formElements =>
      (field.type.element as ClassElement)
          .constructors
          .where((e) => e.hasReactiveFormAnnotatedParameters)
          .first
          .parameters
          .where(
            (e) =>
                formControlChecker.hasAnnotationOfExact(e) ||
                formArrayChecker.hasAnnotationOfExact(e),
          )
          .toList();

  List<ParameterElement> get nestedFormElements =>
      (field.type.element as ClassElement)
          .constructors
          .where((e) => e.hasReactiveFormAnnotatedParameters)
          .first
          .parameters
          .where(
            (e) => e.type.element is ClassElement,
          )
          .where(
            (e) => formGroupChecker.hasAnnotationOfExact(e.type.element!),
          )
          .toList();

  List<String> get validators {
    List<String> _validators = syncValidatorList(formGroupChecker);
    List<String> _validatorsTyped = syncValidatorTypedList(formGroupChecker);

    _validatorsTyped = _validatorsTyped
        .map(
          (e) =>
              '(control) => $e(${field.className}(${(field.type.element as ClassElement).name.camelCase}, control as FormGroup, path))',
        )
        .toList();

    return [..._validators, ..._validatorsTyped];
  }

  List<String> get asyncValidators {
    List<String> _asyncValidators = asyncValidatorList(formGroupChecker);
    List<String> _asyncValidatorsTyped =
        asyncValidatorTypedList(formGroupChecker);

    _asyncValidators = _asyncValidators
        .map(
          (e) => '(control) => $e(this)',
        )
        .toList();

    return [..._asyncValidators, ..._asyncValidatorsTyped];
  }

  @override
  String element() {
    final _formElements = formElements
        .map(
          (f) {
            FormElementGenerator? formElementGenerator;

            if (formControlChecker.hasAnnotationOfExact(f)) {
              formElementGenerator = FormControlGenerator(root, f, type);
            }

            if (formArrayChecker.hasAnnotationOfExact(f)) {
              formElementGenerator = FormArrayGenerator(root, f, type);
            }

            if (formElementGenerator != null) {
              return '${f.fieldControlNameName}: ${formElementGenerator.element()}';
            }

            return null;
          },
        )
        .whereType<String>()
        .toList();

    _formElements.addAll(
      nestedFormElements.map(
        (f) {
          // final nullabilitySuffix = root.isNullable ? '?' : '';
          // return '${f.fieldControlNameName}: ${f.name}Form$nullabilitySuffix.formElements()';
          return '${f.fieldControlNameName}: ${f.name}Form.formElements()';
        },
      ),
    );

    final props = [
      '{${_formElements.join(',')}}',
      'validators: [${validators.join(',')}]',
      'asyncValidators: [${asyncValidators.join(',')}]',
      'asyncValidatorsDebounceTime: ${asyncValidatorsDebounceTime(formGroupChecker)}',
      'disabled: ${disabled(formGroupChecker)}',
    ].join(',');

    return 'FormGroup($props)';
  }
}
