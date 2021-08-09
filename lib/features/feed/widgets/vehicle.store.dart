import 'package:car_shop_app/wrappers/custom.colors.dart';
import 'package:car_shop_app/wrappers/whatsapp.message.dart';
import 'package:car_shop_app/components/custom/custom.button.dart';
import 'package:car_shop_app/components/maps/maps.sheet.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class VehicleStore extends StatefulWidget {
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
              SizedBox(height: 15),
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
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    MapsSheet.show(
                      context: context,
                      onMapTap: (map) {
                        map.showDirections(
                          destination: Coords(
                            -22.8569037,
                            -47.0574117,
                          ),
                          destinationTitle: "Loja 1",
                          origin: Coords(-22.9114663, -47.1212839),
                          originTitle: "",
                          directionsMode: DirectionsMode.driving,
                        );
                      },
                    );
                  },
                  child: Text(
                    "Navegar para loja".toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(),
              ),
              SizedBox(height: 20),
              CustomButton(
                title: 'Enviar mensagem'.toUpperCase(),
                color: CustomColors.purple,
                action: () => {
                  // TODO: Insert information about the car
                  _wppMessage.send(
                      'Gostaria de obter mais informações sobre o carro X',
                      '5511988419332'),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
