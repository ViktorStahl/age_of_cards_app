import 'package:age_of_cards_app/constants/factions.dart';
import 'package:age_of_cards_app/models/warband.dart';
import 'package:age_of_cards_app/models/warband_container_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class WarbandFormPage extends StatelessWidget {
  WarbandFormPage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _factionFieldKey = GlobalKey<FormBuilderFieldState>();

  void addWarband(BuildContext context, Warband warband) {
    Provider.of<WarbandContainerModel>(context, listen: false).addWarband(warband);
  }

  Warband createWarband() {
    return Warband.create(_nameFieldKey.currentState!.value.toString(),
        _factionFieldKey.currentState!.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Warband'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                        name: 'name',
                        key: _nameFieldKey,
                        decoration: const InputDecoration(labelText: 'Name')),
                    const SizedBox(height: 10),
                    FormBuilderDropdown<String>(
                      name: 'faction',
                      key: _factionFieldKey,
                      decoration: const InputDecoration(
                        labelText: 'Faction',
                        hintText: 'Select faction',
                      ),
                      items: FACTIONS
                          .map((faction) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: faction,
                                child: Text(faction),
                              ))
                          .toList(),
                      valueTransformer: (val) => val?.toString(),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          addWarband(context, createWarband());
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Save',
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ))));
  }
}
