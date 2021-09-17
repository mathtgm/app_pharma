import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class formUser extends StatelessWidget {
  const formUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var maskDate = new MaskTextInputFormatter(
        mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
    var maskCPF = new MaskTextInputFormatter(
        mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
    var maskCel = new MaskTextInputFormatter(
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
                    "Cadastro de usuário",
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
                        labelText: "Nome"),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Nome não preenchido";
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
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskCPF],
                    decoration: InputDecoration(
                      labelText: "CPF",
                      hintText: "123.456.789-90",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 49, 175, 180),
                      )),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "CPF não preenchido";
                      else {
                        if (CPFValidator.isValid(value))
                          return null;
                        else
                          return "CPF Invalído";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskDate],
                    decoration: InputDecoration(
                      labelText: "Nascimento",
                      hintText: "dd/MM/yyyy",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Data de nascimento não preenchida";
                      else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskCel],
                    decoration: InputDecoration(
                      labelText: "Celular",
                      hintText: "(  )      -    ",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Celular não preenchido";
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
