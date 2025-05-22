import 'package:coffee_app_4sa/color_palette.dart';
import 'package:coffee_app_4sa/models/coffee_item.dart';
import 'package:coffee_app_4sa/screens/item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';


// estaremos manejando todo en un widget en el que cambia su estado cada que tocamos un tipo diferente de café, los items
// que aparecen se actualizan por otros
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  //listado de tipos de café
  final List<String> coffeeTypes = [
    'Cappuccino',
    'Espresso',
    'Latte',
    'Flat White'
  ];

  //variable para almacenar el tipo de café seleccionado
  String selectedItem = 'Cappuccino';
  int counter = -1;

  //listado de cafés (en este caso para la pestaña de Capuccino)
  final List<CoffeeItem> coffeeList = [
    CoffeeItem(rating: 4.5, itemImg: 'assets/images/coffeemain.jpg', price: 4.21, subtitle: 'With Oat Milk', title: 'Cappuccino'),
    CoffeeItem(rating: 4.2, itemImg: 'assets/images/secondary.jpg', price: 3.14, subtitle: 'With Chocolate', title: 'Cappuccino'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //barra superior (iconos de perfil y para ver opciones)
      backgroundColor: ColorPalette().scaffoldBg,
      bottomNavigationBar: _buildBottomBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    //primer icono, donde definimos su forma y otros parámetros estéticos
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1F232C),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Iconify(HeroiconsSolid.view_grid, size: 12.0, color: Color(0xFF4D4F52)),
                    ),
                  ),
                  //segundo icono, perteneciente al perfil
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/model.png'),
                        fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //pertenece al texto debajo de nuestro appbar
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
              child: Text('Find the best coffee for you',
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40.0
              )),
            ),

            //nuestro listado de bebidas
            SizedBox(height: 20.0),
            SearchBar(),
            SizedBox(height: 20.0),
            Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment(0.7, -1.0),
                  end: Alignment(1.0, -1.0),
                  colors: <Color>[Colors.black, Colors.transparent]
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstATop,
              child: Container(
                color: Color(0xFF0D0F14),
                width: MediaQuery.of(context).size.width - 20.0,
                height: 40.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...coffeeTypes.map((e) {
                      counter++;
                      if(counter<=3) return _buildTypes(e,counter);
                      else {
                        counter = 0;
                        return _buildTypes(e, counter);
                      }
                    }).toList()
                  ],
                ),
              ),
              ),
            ),

            //esta parte es pura estética, ya que sólo estamos poniendo parámetros para que se vea de manera correcta
            //de igual manera con los iconos de las bebidas
            Container(
              height: (MediaQuery.of(context).size.height/2) - 50.0,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                padding: EdgeInsets.only(top: 5.0),
                children: [
                  Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    color: Color(0xFF0D0F14),
                    width: MediaQuery.of(context).size.width - 10.0,
                    height: 250.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...coffeeList.map((e) {
                          return _buildCoffeeItem(e);
                        }).toList()
                      ],
                    ),
                  ),
                  ),

                  //texto de special for you
                  Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                  child: Text('Special for you',
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25.0
                  ),
                  ),
                  ),

                  //recuadro debajo del texto special for you
                  Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: 150.0,
                    width: MediaQuery.of(context).size.width -20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          ColorPalette().gradientTopLeft,
                          Colors.black
                        ]
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 125.0,
                          width: 125.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(image: AssetImage('assets/images/beansbottom.jpg'),
                            fit: BoxFit.cover)
                          ),
                        ),
                        //texto dentro del recuadro de special for you
                        Container(
                          height: 125.0,
                          child: Column(
                            children: [
                              Container(
                                height: 100.0,
                                width: MediaQuery.of(context).size.width - 185.0,
                                child: Text('5 Coffee Beans You Must Try !',
                                style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 23.0
                                ),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  //widget que llamamos en el contenedor debajo de nuestra barra de búsqueda
  //esta parte es para dar forma a nuestras pestañas de bebidas y apenas hagamos un clic nos despliegue otra pantalla con más detalles
  Widget _buildCoffeeItem(CoffeeItem cItem) {
    return Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),

    //al hacer un clic en uno de nuestras bebidas, nos direcciona a la pestalla de detalles
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemDetails(cItem: cItem)));
      },

      //parte visual, donde empezamos a construir los recuadros donde irá la imagen, su calificación, etc
      child: Container(
        //recuadro principal
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              ColorPalette().gradientTopLeft,
              Colors.black
            ]
          )
        ),
        height: 200.0,
        width: 160.0,
        //imagen dentro del recuadro
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140.0,
              width: 150.0,
              //como estaremos poniendo elementos uno encima de otro, manejaremos un stack
              child: Stack(
                children: [
                  Positioned(
                    top: 10.0,
                    left: 10.0,
                    //hero es una transición suave de la imagen a la pantalla de detalles
                    child: Hero(
                      tag: cItem.itemImg.toString(),
                      child: Container(
                        height: 130.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: 
                          AssetImage(cItem.itemImg!),
                          fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                      ),
                    ),
                  ),
                  //recuadro donde va el rating de la bebida
                  Positioned(
                    right: 0.0,
                    top: 10.0,
                    child: Container(
                      height: 25.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF342520).withOpacity(0.7),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0)
                        )
                      ),
                      //el icono y la valoración de la bebida
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorPalette().coffeeSelected,
                              size: 15.0,
                            ),
                            Text(cItem.rating.toString(),
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13.0
                            ),)
                          ],
                        ),
                      ),
                    ))
                ],
              ),
            ),

            //nombre del producto
            Padding(padding: EdgeInsets.only(left: 15.0, top: 8.0),
            child: Text(cItem.title!,
            style: GoogleFonts.sourceSansPro(
              color: Colors.white,
              fontSize: 20.0),
            ),
            ),
            //a base de qué está hecha la bebida
            Padding(padding: EdgeInsets.only(left: 15.0, bottom: 7.0),
            child: Text(cItem.subtitle!,
            style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.w200,
              color: Colors.white,
              fontSize: 14.0),
            ),
            ),
            //precio de la bebida, dividida en dos
            Padding(padding: EdgeInsets.only(left: 15.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40.0,
                  width: 60.0,
                  child: Row(
                    //la divisa de un color distinto
                    children: [
                      Text('\$',
                      style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.bold,
                        color: ColorPalette().coffeeSelected,
                        fontSize: 25.0,)
                      ),
                      //al del precio
                      Text(
                        cItem.price.toString(),
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25.0,)
                      )
                    ],
                  ),
                ),
                //icono para añadir al carrito
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      color: ColorPalette().coffeeSelected,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Center(
                      child: Icon(Icons.add,
                      size: 18.0,
                      color: Colors.white,),
                    ),
                  ),
                )
              ],
            ),)
          ],
        ),
      ),
    ),
    
    );
  }

  //widget de nuestro selector de bebidas
  Widget _buildTypes(coffee, counter) {
    return Padding(
      //color del fondo de nuestro contenedor
      padding: counter !=0 
      ? EdgeInsets.only(left: 25.0)
      : EdgeInsets.only(left: 7.0),
      child: Container(
        height: 50.0,
        color: Color(0xFF0D0F14),
        child: Column(
          children: [
            GestureDetector(
              //cuando toco un tipo de café, acá se actualiza el estado cambiando los valores, en caso de haber puesto más en las demás pestañas
              onTap: () {
                setState(() {
                  selectedItem = coffee;
                });
              },
              //condición que ayuda a saber en qué sección estamos
              //si seleccionamos una bebida, esta pasa a tener el texto en naranja
              //mientras que los demás pasan a estar de color gris
              child: Text(coffee,
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold,
                color: coffee == selectedItem ?
                ColorPalette().coffeeSelected : ColorPalette().coffeeUnselected,
                fontSize: 22.0
              ),
              ),
            ),
            //debajo del texto tenemos un circulito, que sirve de la misma manera
            SizedBox(height: 4.0),
            Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: coffee == selectedItem ? ColorPalette().coffeeSelected : Colors.transparent
              ),
            )
          ],
        ),
      ),
    );
  }

  //widget que construye la barra inferior con los íconos de navegación
  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0xFF1A1819)
      ),
      //como estamos colocándolo de manera horizontal, deben estar en un row,
      //asignando de manera manual los colores de cada ícono
      //como estamos en la página principal, este tendrá un color "iluminado"
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Icon(Icons.home,
            color: Color(0xFFD17742),
            ),

          ),
          Iconify(
            Ph.handbag_fill,
            color: Color(0xFF4E4F53),
          ),
          Iconify(
            Ri.heart_2_fill,
            color: Color(0xFF4E4F53),
          ),
          //usaremos nuevamente el stack, ya que haremos que el ícono de la campana tenga
          //un circulito, simulando una notificación
          Container(
            child: Stack(
              children: [
                Iconify(HeroiconsSolid.bell,
                color: Color(0xFF4E4F53),
                ),
                Positioned(
                  top: 2.0,
                  left: 15.0,
                  child: Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Colors.red
                    ),
                  ))
              ],
            ),
          )
        ],
      ),
    );
  }
}