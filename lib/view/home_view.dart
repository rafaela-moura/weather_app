import 'package:converter/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/app_palette.dart';
import 'package:weather_app/utils/routes.dart';
import 'package:weather_app/view/base_view.dart';
import 'package:weather_app/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: HomeViewModel(),
      onModelReady: (model) => model.onInit(context),
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppPalette.blue,
                      AppPalette.blue,
                      AppPalette.primary,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).viewPadding.top,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.city,
                              style: TextStyle(
                                  color: AppPalette.gray, fontSize: 12),
                            ),
                            Container(
                              color: AppPalette.gray,
                              height: 1,
                              width: 258,
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, RoutesApp.LOCATION);
                            },
                            child: SvgPicture.asset('assets/icons/city.svg')),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 380,
                      width: 323,
                      decoration: BoxDecoration(
                        color: AppPalette.blue.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: AppPalette.primary.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/sunny.png",
                              fit: BoxFit.cover),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.getTemp().toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 67,
                                    color: AppPalette.white.withOpacity(0.75)),
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: AppPalette.white
                                            .withOpacity(0.75))),
                              )
                            ],
                          ),
                          Text(
                            'Cloudy',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: AppPalette.white.withOpacity(0.75)),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Today',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                fontFamily: 'Days One',
                                color: AppPalette.white.withOpacity(0.75)),
                          ),
                          Text(
                            'Lucknow',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Barlow',
                                color: AppPalette.white.withOpacity(0.75)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        _buildForecastingDays(),
                        _buildForecastingDays(),
                        _buildForecastingDays(),
                        _buildForecastingDays(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              _buildButton('assets/icons/eye.svg', 'Visibility',
                                  "1000 m"),
                              SizedBox(width: 5),
                              _buildButton(
                                  'assets/icons/wind.svg', 'Wind', "7 km\nN-E"),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              _buildButton(
                                  'assets/icons/drop.svg', 'Humidity', "21%"),
                              SizedBox(width: 5),
                              _buildButton(
                                  'assets/icons/sun.svg', 'UV', "7\nStrong"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String icon, String text, String text2) {
    return GestureDetector(
      onTap: () {
        setState(() {
          click = !click;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 163,
          height: 91,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: AppPalette.gray2,
          ),
          child: click
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(icon),
                    Text(
                      text,
                      style: TextStyle(fontSize: 13, color: AppPalette.white),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(icon),
                        Text(
                          text,
                          style:
                              TextStyle(fontSize: 13, color: AppPalette.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text2,
                          style:
                              TextStyle(fontSize: 13, color: AppPalette.white),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildForecastingDays() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 82,
        height: 164,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37), color: AppPalette.gray2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Image.asset("assets/images/sunny.png",
                fit: BoxFit.cover, height: 40),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '18',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 31,
                      color: AppPalette.white.withOpacity(0.75)),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: AppPalette.white.withOpacity(0.75))),
                )
              ],
            ),
            Text(
              'Cloudy',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'Dangrek',
                  color: AppPalette.white.withOpacity(0.75)),
            ),
            Text(
              'Tomorrow',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'Barlow',
                  color: AppPalette.white.withOpacity(0.75)),
            ),
          ]),
        ),
      ),
    );
  }
}
