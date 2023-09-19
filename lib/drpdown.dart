//@dart=2.9
import 'package:flutter/material.dart';
class DropDown extends StatefulWidget {

  const DropDown({Key key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
 List<String> items=[
    'mumbai'
    'kolkata'
    'delhi'
    'kerala'

  ];


   String dropdownvalue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
                child: DropdownButton(
                  hint: Text('select cities'),
                  value: dropdownvalue,
                  items: items.map((String items){
                    return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                );
                }).toList(),
                  onChanged: (String newvalue) {
                    setState(() {
                      dropdownvalue = newvalue;
                    });
                  },isExpanded: true,

    ),
                ),
      );

  }
}
