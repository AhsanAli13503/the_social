import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socially/pages/home_page.dart';
import 'package:socially/pages/profile.page.dart';
import '../components/AppIcons.dart';
import '../components/AppStrings.dart';
import '../styles/colors.dart';


class MainPage extends StatefulWidget {
   const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
 
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex.index],
      bottomNavigationBar:MyBottomNavigation(
        currentIndex: currentIndex,
        onTap: (value) { 
          setState(() { 
            currentIndex = value;
          });
        },
      ),
    );
  }
}

final pages = [
    const HomePage(),
    const Center(child:Text(AppStrings.favourites),),
    const Center(child:Text(AppStrings.add),),
    const Center(child:Text(AppStrings.chat),),
     ProfilePage(),
];

enum Menus{ home, favourites, add, chat, profile }



class MyBottomNavigation extends StatelessWidget{ 
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;
  const MyBottomNavigation({super.key, 
  required this.currentIndex, 
  required this.onTap});

    @override 
  Widget build(BuildContext context){
    return Container(
      height: 87,
      margin: const EdgeInsets.all(24),
      width: 17,
      child: Stack(
        children: [ 
          Positioned(
            right: 0,
            left: 0,
            top: 17,
            child: Container( 
              height: 70,
              decoration: const BoxDecoration(  
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                 children: [ 
                  Expanded(  
                    child: IconButton(  
                      onPressed: () => onTap(Menus.home),
                      icon: SvgPicture.asset(
                        AppIcons.ic_home,
                        colorFilter: ColorFilter.mode(  
                          currentIndex == Menus.home 
                          ? Colors.black
                          : Colors.black.withOpacity(0.3),
                          BlendMode.srcIn
                        ) 
                        ),
                    )
                  ),
                   Expanded(  
                    child: IconButton(  
                      onPressed: () => onTap(Menus.favourites),
                      icon: SvgPicture.asset(
                        AppIcons.ic_favorite,
                        colorFilter: ColorFilter.mode(  
                          currentIndex == Menus.favourites 
                          ? Colors.black
                          : Colors.black.withOpacity(0.3),
                          BlendMode.srcIn
                        ) 
                      ),
                    )
                  ),
                   const Spacer(),
                   Expanded(  
                    child: IconButton(  
                      onPressed: () =>  onTap(
                        Menus.chat
                      ),
                      icon: SvgPicture.asset(AppIcons.ic_chat,
                          colorFilter: ColorFilter.mode(  
                          currentIndex == Menus.chat 
                          ? Colors.black
                          : Colors.black.withOpacity(0.3),
                          BlendMode.srcIn
                        ) 
                      ),
                    )
                  ),
                   Expanded(  
                    child: IconButton(  
                      onPressed: () => onTap(Menus.profile),
                     icon: SvgPicture.asset(
                      AppIcons.ic_profile,
                        colorFilter: ColorFilter.mode(  
                          currentIndex == Menus.profile 
                          ? Colors.black
                          : Colors.black.withOpacity(0.3),
                          BlendMode.srcIn
                        ) 
                      
                      ),
                    )
                  ),
                 ],
              )
            ),
          ),
          Center(
            heightFactor: 25,
            widthFactor: 50,
            child: SizedBox(
              child: Positioned(
                left: 0, right: 0, top: 0,
            
                child: GestureDetector(
                  onTap: () => onTap(Menus.add),
                  child: Container(
                      height:64,
                      width: 64,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: MyColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        height: 40,
                        width: 30,
                        child: SvgPicture.asset(AppIcons.ic_add
                        ),
                      )
                    ),
                ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}