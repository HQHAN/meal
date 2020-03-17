import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreeen extends StatefulWidget {
  static const String routeName = '/filter';
  final Function filterSaveHandler;
  final Map<String, bool> currentSetting;

  FilterScreeen(this.filterSaveHandler, {this.currentSetting});

  @override
  _FilterScreeenState createState() => _FilterScreeenState();
}

class _FilterScreeenState extends State<FilterScreeen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  get currentSettingMap => {
        'gluten': isGlutenFree,
        'vegan': isVegan,
        'vegeterian': isVegetarian,
        'lactos': isLactoseFree,
      };

  Widget _buildSwitch(
    String title,
    String subTitle,
    bool currentValue,
    Function valueChangeHandler,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: valueChangeHandler,
    );
  }

  @override
  void initState() {
    widget.currentSetting.forEach((key, value) {
      if (key == 'gluten') isGlutenFree = value;
      if (key == 'vegan') isVegan = value;
      if (key == 'vegeterian') isVegetarian = value;
      if (key == 'lactos') isLactoseFree = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.filterSaveHandler(currentSettingMap),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitch(
                'Glueten-free',
                'Only include glueten-free',
                isGlutenFree,
                (isSwitchOn) {
                  setState(() {
                    isGlutenFree = isSwitchOn;
                  });
                },
              ),
              _buildSwitch(
                'Vegan',
                'Only include Vegan',
                isVegan,
                (isSwitchOn) {
                  setState(() {
                    isVegan = isSwitchOn;
                  });
                },
              ),
              _buildSwitch(
                'Vegeterian',
                'Only include Vegeterian',
                isVegetarian,
                (isSwitchOn) {
                  setState(() {
                    isVegetarian = isSwitchOn;
                  });
                },
              ),
              _buildSwitch(
                'Lactose-free',
                'Only include Lactose-free',
                isLactoseFree,
                (isSwitchOn) {
                  setState(() {
                    isLactoseFree = isSwitchOn;
                  });
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
