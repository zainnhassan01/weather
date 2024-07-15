  import 'package:flutter/material.dart';

  class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
  }

  class _homeState extends State<home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {
  data = data.isNotEmpty ? data = data : data = ModalRoute.of(context)?.settings.arguments as Map ?? {};
  print(data["cityname"]);
  return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Center(
        child: SingleChildScrollView(
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data['cityname'],style: TextStyle(fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.96),),
                        SizedBox(height: 20,),
                        Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(100) 
                                ),
                              child: Center(child: Text(data['date'],
                             style: TextStyle(fontSize: 20,
                             color: Colors.white),)),
                          ),
                        ),
                        SizedBox(height: 20,),
                              Text(data['weather_main'],
                                  style: TextStyle(fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.72)),
                        SizedBox(height: 20,),
                            Text("${data['maintemp']}°ᶜ",
                                style: TextStyle(fontSize: 128,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.72)),
                        SizedBox(width: 20,), 
                        Text("${data['description']}",
                            style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                        )
                        ),
                  SizedBox(height: 30,),
                  Container(
                      height: 330,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                       child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Card(
                                    color: Colors.black,
                                    child: InkWell(
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.air_rounded,color: Colors.blue.shade400,size: 40,),
                                          SizedBox(height:20),
                                          Text("${data['windspeed']} km/h",style: TextStyle(
                                            color: Colors.blue.shade400,
                                            fontSize: 23
                                          ),),
                                          Text("${data['degrees']} wind",style: TextStyle(
                                            color: Colors.blue.shade400,
                                            fontSize: 20
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.black,
                                    child: InkWell(
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.water_drop,color: Colors.blue.shade400,size: 40,),
                                          SizedBox(height:20),
                                          Text("${data['humidity']}%",style: TextStyle(
                                            color: Colors.blue.shade400,
                                            fontSize: 23
                                          ),),
                                          Text("Humidity",style: TextStyle(
                                            color: Colors.blue.shade400,
                                            fontSize: 20
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.black,
                                    child: InkWell(
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.remove_red_eye,color: Colors.blue.shade400,size: 40,),
                                          SizedBox(height:20),
                                          Text("${data['visibility']} km",style: TextStyle(
                                            color: Colors.blue.shade400,
                                            fontSize: 23
                                          ),),
                                          Text("Visibility",style: TextStyle(
                                            color: Colors.blue.shade400,
                                            fontSize: 20
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Card(
                                      color: Colors.black,
                                      child: InkWell(
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.sunny,color: Colors.blue.shade400,size: 40,),
                                            SizedBox(height:20),
                                            Text("${data['sunrise']}",style: TextStyle(
                                              color: Colors.blue.shade400,
                                              fontSize: 23
                                            ),),
                                            Text("Sunrise",style: TextStyle(
                                              color: Colors.blue.shade400,
                                              fontSize: 20
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Card(
                                      color: Colors.black,
                                      child: InkWell(
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.sunny,color: Colors.blue.shade400,size: 40,),
                                            SizedBox(height:20),
                                            Text("${data['sunset']}",style: TextStyle(
                                              color: Colors.blue.shade400,
                                              fontSize: 23
                                            ),),
                                            Text("Sunset",style: TextStyle(
                                              color: Colors.blue.shade400,
                                              fontSize: 20
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                         ],
                       ),
                       ),
                      ]
                    ),
                ),
            ],
          ),
          ),
        ),
      ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
  floatingActionButton: FloatingActionButton(
    onPressed: () async{
      dynamic  result = await Navigator.pushNamed(context, '/location');
      setState(() {
        data = result;
      });
    },
    disabledElevation: 0,
    backgroundColor: Colors.black,
    child: Icon(Icons.public,size: 30,color: Colors.blue.shade400,),
    ),
  );
}
}