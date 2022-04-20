import 'package:flutter/material.dart';

class ReGForm extends StatefulWidget {
  const ReGForm({Key? key}) : super(key: key);

  @override
  State<ReGForm> createState() => _ReGFormState();
}

class _ReGFormState extends State<ReGForm> {
  final _value = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Text Form Fields"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Registration Here",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Enter Your Name",
                            hintText: "input name here",
                            fillColor: Colors.greenAccent,
                            filled: true,
                            icon: Icon(Icons.people_alt_sharp),
                            prefixIcon: Icon(Icons.free_breakfast_outlined),
                            suffixIcon: Icon(Icons.people_alt_sharp),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Enter Your Phone Number",
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Enter Your Email Address",
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Enter Your Password",
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DropdownButtonFormField(
                  hint: Text("Your Marital Status"),
                  items: [
                    DropdownMenuItem(
                      child: Text("Married"),
                      value: "m",
                    ),
                    DropdownMenuItem(
                      child: Text("Unmarried"),
                      value: "un",
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      print(val);
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Gender: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: _value,
                          groupValue: _value,
                          onChanged: (val) {
                            setState(() {
                              val = _value;
                            });
                          }),
                      Text("Male.",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "female",
                          groupValue: _value,
                          onChanged: (val) {
                            setState(() {
                              val = _value;
                            });
                          }),
                      Text("Female.",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: (){}, child: Text("This Is Text Button"),),
              FloatingActionButton(onPressed: (){}, child: Text("This Is Floating Button"),),
              FlatButton(onPressed: (){}, child: Text("This Is Flat Button"),),
              ElevatedButton(onPressed: (){}, child: Text("This Is Elevated Button"),),
              ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite),),
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite),),

            ],
          ),
        ),
      ),
    );
  }
}
