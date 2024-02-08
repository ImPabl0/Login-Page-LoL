import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:league_of_legends_login/login/components/social_media_buttons.dart';

import 'components/riot_checkbox.dart';
import 'components/riot_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            LeftSideBar(),
            RightSideBar(),
          ],
        ),
      ),
    );
  }
}

class LeftSideBar extends StatelessWidget {
  const LeftSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(children: [
        Container(
            margin: const EdgeInsets.only(top: 70),
            height: 40,
            child: Image.asset("assets/images/logo.png")),
        Container(
          margin: const EdgeInsets.only(top: 65),
          child: Text(
            "Fazer login",
            style: GoogleFonts.inter(fontSize: 23, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
            child: SizedBox(
          width: 288,
          child: Column(
            children: [
              const SizedBox(
                height: 38,
              ),
              const RiotInput(labelText: "NOME DE USUÁRIO"),
              const SizedBox(
                height: 16,
              ),
              const RiotInput(
                labelText: "SENHA",
                inputType: InputType.password,
              ),
              Container(
                margin: const EdgeInsets.only(top: 28),
                width: double.infinity,
                height: 32,
                child: const Row(
                  children: [
                    Expanded(
                        child: SocialMediaButton(
                      socialMedia: SocialMedia.facebook,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: SocialMediaButton(
                      socialMedia: SocialMedia.google,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: SocialMediaButton(
                      socialMedia: SocialMedia.apple,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: SocialMediaButton(
                      socialMedia: SocialMedia.xbox,
                    )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: const RiotCheckbox(),
              ),
              const SizedBox(
                height: 200,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                      color: const Color(0xFFb62c2e),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        )),
      ]),
    );
  }
}

class RightSideBar extends StatelessWidget {
  const RightSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
                fit: BoxFit.cover, "assets/images/2024_Key_Art.jpg")));
  }
}
