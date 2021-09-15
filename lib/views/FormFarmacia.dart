import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class formFarm extends StatelessWidget {
  const formFarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var maskDate = new MaskTextInputFormatter(
        mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
    var maskCNPJ = new MaskTextInputFormatter(
        mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
    var maskCel = new MaskTextInputFormatter(
        mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});
    var maskCRF = new MaskTextInputFormatter(
        mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

    final _formKey = GlobalKey<FormState>();

    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Cadastro de Farmacia",
                    style: TextStyle(
                        color: Color.fromARGB(255, 49, 175, 180),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 175, 180),
                          ),
                        ),
                        labelText: "Razão Social"),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Razão social não preenchida";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 175, 180),
                          ),
                        ),
                        labelText: "E-mail"),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "E-mail não preenchido";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 175, 180),
                          ),
                        ),
                        labelText: "Senha"),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Senha não preenchida";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    inputFormatters: [maskCNPJ],
                    decoration: InputDecoration(
                      labelText: "CNPJ",
                      hintText: "12.345.678/0000-00",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 49, 175, 180),
                      )),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "CNPJ não preenchido";
                      else {
                        if (CNPJValidator.isValid(value))
                          return null;
                        else
                          return "CNPJ Invalído";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Endereço",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Endereço não preenchido";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Número",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Número não preenchido";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Bairro",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Bairro não preenchido";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome Farmaceutico resposável",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Farmaceutico não preenchido";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    inputFormatters: [maskCRF],
                    decoration: InputDecoration(
                      labelText: "CRF",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "CRF não preenchido";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    inputFormatters: [maskCel],
                    decoration: InputDecoration(
                      labelText: "Telefone",
                      hintText: "(  )      -    ",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Telefone não preenchido";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Cadastrar-se",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Icon(Icons.article_outlined)
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 49, 175, 180),
                        shadowColor: Colors.transparent),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Voltar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Icon(Icons.arrow_back)
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 49, 175, 180),
                      shadowColor: Colors.transparent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
