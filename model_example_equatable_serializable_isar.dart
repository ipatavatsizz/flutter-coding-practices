/// Taken from my QR code scanner&generator app. I believe it is a good choice to build models with this way, more flexible and reusable.

import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setting_model.g.dart';

@JsonSerializable()
@Collection(accessor: 'settings', inheritance: false)
class AppSetting extends Equatable {
  final Id id;

  final String option;
  final bool value;
  final String text;
  final bool visible;

  @Enumerated(EnumType.name)
  final SettingType type;

  AppSetting({
    this.id = Isar.autoIncrement,
    required this.option,
    required this.value,
    required this.text,
    this.visible = true,
    this.type = SettingType.standard,
  });

  factory AppSetting.fromJson(Map<String, dynamic> json) =>
      _$AppSettingFromJson(json);
  Map<String, dynamic> toJson() => _$AppSettingToJson(this);

  AppSetting copyWith({
    int? id,
    String? option,
    bool? value,
    String? text,
    bool? visible,
    SettingType? type,
  }) {
    return AppSetting(
      id: id ?? this.id,
      option: option ?? this.option,
      value: value ?? this.value,
      text: text ?? this.text,
      visible: visible ?? this.visible,
      type: type ?? this.type,
    );
  }

  @ignore
  @override
  List<Object?> get props => [id, option, value, text, visible, type];
}

enum SettingType { experimental, standard }
