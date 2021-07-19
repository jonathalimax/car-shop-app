import 'package:car_shop_app/classes/custom.colors.dart';
import 'package:car_shop_app/classes/whatsapp.message.dart';
import 'package:car_shop_app/components/custom.button.dart';
import 'package:flutter/material.dart';

class VehicleStore extends StatefulWidget {
  VehicleStore({Key key}) : super(key: key);

  @override
  _VehicleStoreState createState() => _VehicleStoreState();
}

class _VehicleStoreState extends State<VehicleStore> {
  final WhatsappMessage _wppMessage = WhatsappMessage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 14, top: 14, right: 14),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Loja Número 1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ClipOval(
                    child: Image.network(
                      'https://catarina-prd.s3.sa-east-1.amazonaws.com/clientes/8f1bc5ea774bef6b12d051b83ca22603.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Endereço',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Divider(height: 14),
              Text(
                'Rua Albatroz, 66 \nVila Padre Manoel de Nóbrega \nCampinas - SP',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Flexible(
                child: Container(),
              ),
              SizedBox(height: 20),
              CustomButton(
                title: 'Entrar em contato'.toUpperCase(),
                color: CustomColors.purple,
                action: () => {
                  // TODO: Insert information about the car
                  _wppMessage.send(
                      'Gostaria de obter mais informações sobre o carro X'),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
