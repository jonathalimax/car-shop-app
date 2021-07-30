import 'package:car_shop_app/features/feed/models/optionals.model.dart';
import 'package:car_shop_app/features/feed/widgets/vehicle.optionals.dart';
import 'package:flutter/material.dart';

class VehicleDetails extends StatefulWidget {
  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  List<OptionalsModel> optionals = [
    OptionalsModel(id: 1, name: "Ar-condicionado", description: ""),
    OptionalsModel(id: 1, name: "Direção elétrica", description: ""),
    OptionalsModel(id: 1, name: "Alarme", description: ""),
    OptionalsModel(id: 1, name: "Sensor de estacionamento", description: ""),
    OptionalsModel(id: 1, name: "Controle de estabilidade", description: ""),
    OptionalsModel(id: 1, name: "Rádio", description: ""),
    OptionalsModel(id: 1, name: "Teto solar", description: ""),
    OptionalsModel(id: 1, name: "Bancos de couro", description: ""),
    OptionalsModel(id: 1, name: "Air bag", description: ""),
    OptionalsModel(id: 1, name: "Travas elétricas", description: ""),
    OptionalsModel(id: 1, name: "Vidros elétricos", description: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 14, top: 14, right: 14),
              child: Row(
                children: [
                  Text(
                    'Marca',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Modelo',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'R\$100.000,00',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Cor',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Branco',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Ano',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '2012/2013',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hodômetro: ',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '105.000 km',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 14, top: 8, right: 14),
              child: Text(
                'Título completo do anúncio gerado auto',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Divider(height: 40),
            VehicleOptionals(optionals: optionals),
          ],
        ),
      ),
    );
  }
}
