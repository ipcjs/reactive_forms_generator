import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:example/helpers.dart';

part 'delivery_list.gform.dart';

@ReactiveFormAnnotation()
class DeliveryList extends Equatable {
  final List<DeliveryPoint> deliveryList;
  final List<Client>? clientList;

  const DeliveryList({
    @FormArrayAnnotation() this.deliveryList = const [],
    @FormArrayAnnotation() this.clientList,
  });

  @override
  List<Object?> get props => [deliveryList, clientList];
}

@ReactiveFormAnnotation(name: 'StandaloneDeliveryPoint')
@FormGroupAnnotation()
class DeliveryPoint extends Equatable {
  final String name;

  final Address? address;

  const DeliveryPoint({
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
        this.name = '',
    this.address,
  });

  @override
  List<Object?> get props => [name, address];
}

enum ClientType { home, office }

@FormGroupAnnotation()
class Client extends Equatable {
  final ClientType clientType;

  final String? name;

  final String? notes;

  const Client({
    @FormControlAnnotation<ClientType>() required this.clientType,
    @FormControlAnnotation<String>() this.name,
    @FormControlAnnotation<String>() this.notes,
  });

  @override
  List<Object?> get props => [name, notes];
}

@FormGroupAnnotation()
class Address extends Equatable {
  final String? street;

  final String? city;

  const Address({
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
        this.street,
    @FormControlAnnotation<String>()
        this.city,
  });

  @override
  List<Object?> get props => [street, city];
}
