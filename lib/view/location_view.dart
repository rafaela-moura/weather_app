import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/app_palette.dart';
import 'package:weather_app/utils/routes.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutesApp.HOME);
                        },
                        child: SvgPicture.asset('assets/icons/back.svg')),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "City Management",
                      style: TextStyle(
                          color: AppPalette.gray3,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Barlow'),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SvgPicture.asset('assets/icons/menu.svg'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 341,
                height: 37,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppPalette.gray.withOpacity(0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'search',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppPalette.gray3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset('assets/icons/search.svg'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
