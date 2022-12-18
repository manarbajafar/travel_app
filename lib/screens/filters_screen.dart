import 'package:flutter/material.dart';
import 'package:travel/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen ({ Key? key }) : super(key: key);
  static const screenRoute = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  void initState() {
    // TODO: implement initState
    _summer = widget.currentFilters['summer'];
    _winter = widget.currentFilters['winter'];
    _family = widget.currentFilters['family'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('التصفية'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'summer': _summer,
                  'winter': _winter,
                  'family': _family,
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile('الرحلات الصيفية',
                      'إظهار الرحلات في فصل الصيف فقط', _summer, (newValue) {
                    setState(() {
                      _summer = newValue;
                    });
                  }),
                  buildSwitchListTile('الرحلات الشتوية فقط',
                      'إظهار الرحلات في فصل الشتاء فقط', _winter, (newValue) {
                    setState(() {
                      _winter = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'للعائلات', 'إظهار الرحلات التي للعائلات فقط', _family,
                      (newValue) {
                    setState(() {
                      _family = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }

  SwitchListTile buildSwitchListTile(
      String title, String subtitle, var currentValue, Function ubdateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: ubdateValue,
    );
  }
}
