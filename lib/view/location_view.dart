import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/app_palette.dart';
import 'package:weather_app/utils/routes.dart';
import 'package:weather_app/view/base_view.dart';
import 'package:weather_app/view_model/location_view_model.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        model: LocationViewModel(),
        onModelReady: (model) => model.onInit(context),
        builder: (context, model, child) => Scaffold(
                body: SingleChildScrollView(
              child: Container(
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
                                child:
                                    SvgPicture.asset('assets/icons/back.svg')),
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
                            color: AppPalette.gray4.withOpacity(0.20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: 280,
                                height: 37,
                                child: Form(
                                  key: model.formKey,
                                  child: TextFormField(
                                    initialValue: model.city,
                                    style:
                                        const TextStyle(color: AppPalette.gray),
                                    onChanged: (value) {
                                      setState(() {
                                        model.setCity(value);
                                        model.getTemp();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child:
                                  SvgPicture.asset('assets/icons/search.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    _buildLocation(),
                    const SizedBox(
                      height: 50,
                    ),
                    _buildLocation(),
                    const SizedBox(
                      height: 50,
                    ),
                    _buildLocation(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget _buildLocation() {
    return Center(
      child: Container(
        width: 327,
        height: 131,
        decoration: BoxDecoration(
          color: AppPalette.gray4.withOpacity(0.17),
          borderRadius:
              const BorderRadius.only(topRight: Radius.circular(1500)),
        ),
      ),
    );
  }
}
