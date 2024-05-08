import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/widget/general_app_bar.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor(),isLeadingActive: true,),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalMedium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //walletCard
              Stack(
                children: [
                  Container(
                    padding: context.padding.onlyRightMedium,
                    margin: context.padding.onlyTopMedium,
                    height: context.sized.dynamicHeight(0.225),
                    width: context.sized.width,
                    decoration: BoxDecoration(
                      color: ProjectColor.lightGrey.getColor(),
                      borderRadius: context.border.normalBorderRadius,
                      border: Border.all(width: 1,color: Colors.black12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: context.padding.onlyRightMedium,
                          child: Text('Cüzdanım:',style: context.general.textTheme.titleLarge,),
                        ),
                        Text('368,00 TL',style: context.general.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700,color: ProjectColor.apricot.getColor()),),
                      ],
                    ),
                  ),
                  Positioned(
                    left: -context.sized.dynamicWidth(0.06),
                    bottom: -context.sized.dynamicWidth(0.06),
                    child: SizedBox(
                      width: context.sized.width,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Transform.rotate(
                          angle: -12 * (3.14 / 180),
                          child: Image.asset(
                            "assets/images/wallet.png",
                            height: context.sized.dynamicHeight(0.225),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _buildMovementsText(context),
              _buildRecentTransactionsText(context),
              Container(
                margin: context.padding.onlyTopNormal,
                height: context.sized.dynamicHeight(0.18),
                decoration: BoxDecoration(
                  borderRadius: context.border.normalBorderRadius,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: const GradientRotation(0.5),
                    colors: [
                      ProjectColor.apricot.getColor(),
                      ProjectColor.lightGrey.getColor(),
                      ProjectColor.lightGrey.getColor(),
                      ProjectColor.apricot.getColor(),
                    ],
                    stops: const [0.0, 0.2,0.8, 1.0],
                    tileMode: TileMode.repeated,
                  ),
                ),
                child: Padding(
                  padding: context.padding.horizontalMedium,
                  child: Row(
                    children: [
                      //productimage
                      Container(
                        margin: context.padding.onlyRightNormal,
                        decoration: BoxDecoration(
                          image: const DecorationImage(image: AssetImage("assets/images/product.png")),
                            borderRadius: context.border.normalBorderRadius,
                        ),
                        width: context.sized.dynamicWidth(0.2),
                        height: context.sized.dynamicWidth(0.2),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text('10-05-2024 08.37',
                              style: context.general.textTheme.bodySmall?.copyWith(color: Colors.grey),),
                            ),
                            Row(
                              children: [
                                Text('El Kremi - ', style: context.general.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),),
                                const Text("Dynamic 100 ml",overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                            const Text('Nivea'),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '-368,00 TL',
                                  style: context.general.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600,color: ProjectColor.apricot.getColor()),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildRecentTransactionsText(BuildContext context) {
    return Padding(
              padding: context.padding.onlyTopMedium,
              child: Text('Recent Transactions',
              style: context.general.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),),
            );
  }

  Padding _buildMovementsText(BuildContext context) {
    return Padding(
              padding: context.padding.onlyTopNormal,
              child: Text('Haraketlerim',style:
                context.general.textTheme.titleLarge,),
            );
  }
}
