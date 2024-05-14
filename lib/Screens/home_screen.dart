import 'package:add_to_cart_system/Models/cart_data.dart';
import 'package:add_to_cart_system/widgets/alert_dialog.dart';
import 'package:add_to_cart_system/widgets/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int totalprice;
  @override
  void initState() {
    totalprice = calculateTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 25,
              ))
        ],
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          margin: const EdgeInsets.all(10.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Bag',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return
                   Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    height: (orientation == Orientation.portrait)
                        ? screenHeight * .16
                        : screenHeight * .4,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.00),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          blurStyle: BlurStyle.normal,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.34,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.00),
                                bottomLeft: Radius.circular(10.00)),
                            color: const Color(0xFFE3E3E3),
                            image: DecorationImage(
                                image: AssetImage(info[index].dressImage),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * .01,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    info[index].dressName,
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_vert)),
                                ],
                              ),
                              Row(
                                children: [
                                 const Text(
                                    'Color:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: screenWidth * .009,
                                  ),
                                  Text(info[index].dressColor),
                                  SizedBox(
                                    width: screenWidth * .03,
                                  ),
                                const  Text(
                                    'Size:',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: screenWidth * .009,
                                  ),
                                  Text(info[index].dressSize)
                                ],
                              ),
                              SizedBox(
                                  height: (orientation == Orientation.portrait)
                                      ? screenHeight * .01
                                      : screenHeight * .04),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  QuantityButton(
                                      icon: Icons.remove,
                                      onPressed: () {
                                        decreaseQuantity(index);
                                      }),
                                  Text(info[index].quantity.toString()),
                                  QuantityButton(
                                      icon: Icons.add,
                                      onPressed: () {
                                        increaseQuantity(index, orientation);
                                      }),
                                  Text('${info[index].quantity*info[index].dressPrice}\$'),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              )),
              SizedBox(
                height: (orientation == Orientation.portrait)
                    ? screenHeight * 0.14
                    : screenHeight * 0.22,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     const    Wrap(
                          children: [
                            Text(
                              "Total amount",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontFamily: "WorkSans",
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            Text(
                              '${totalprice.toString()}\$',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "WorkSans",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: (orientation == Orientation.portrait) ? 20 : 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: screenWidth * 0.9,
                        height: (orientation == Orientation.portrait)
                            ? MediaQuery.of(context).size.height * 0.06
                            : MediaQuery.of(context).size.height * 0.12,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(showSnackBar());
                          },
                          child: const Text(
                            "CHECK OUT",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  int calculateTotalPrice() {
    totalprice = 0;
    for (CartData data in info) {
      totalprice += data.dressPrice;
    }
    return totalprice;
  }

  void increaseQuantity(int index, Orientation orientation) {
    if (info[index].quantity < 5) {
      info[index].quantity = info[index].quantity + 1;
      totalprice += info[index].dressPrice;
    }
    if (info[index].quantity == 5) {
      showAlertDialog(index, orientation);
    }
    setState(() {});
  }

  void showAlertDialog(int index, Orientation orientation) {
    showDialog(
      context: context,
      builder: (context) {
        return Show_AlertDialog(
            title: "Congratulations!",
            content:
                "You have added 5 ${info[index].dressName.toString()} in your bag!",
            orientation: orientation);
      },
    );
  }

  void decreaseQuantity(int index) {
    if (info[index].quantity > 1) {
      info[index].quantity = info[index].quantity - 1;
      totalprice -= info[index].dressPrice;
    }
    setState(() {});
  }

  SnackBar showSnackBar() {
    return SnackBar(
      content: const Text(
        "Congratulations! Product Added to your cart.",
        style: TextStyle(
          fontSize: 15,
          fontFamily: "WorkSans",
        ),
      ),
      padding: const EdgeInsets.all(20.00),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green[600],
      elevation: 10,
    );
  }
}
