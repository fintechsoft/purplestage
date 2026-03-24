import 'package:purplestage/utils/core_export.dart';
import 'package:get/get.dart';

class ProviderDetailsTopCard extends StatelessWidget {
  final bool isAppbar;
  final String subcategories;
  final String providerId;
  final Color? color;
  const ProviderDetailsTopCard(
      {super.key,
      this.isAppbar = true,
      required this.subcategories,
      required this.providerId,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderBookingController>(builder: (providerController) {
      ProviderData providerDetails =
          providerController.providerDetailsContent!.provider!;
      final profile = providerDetails.provider_profile;
      final social1 = profile?.socialId1?.trim() ?? '';
      final social2 = profile?.socialId2?.trim() ?? '';
      final social3 = profile?.socialId3?.trim() ?? '';
      return Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 100,
            ),
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              border: Border.all(
                  color: color != null
                      ? Colors.transparent
                      : Theme.of(context).hintColor.withOpacity(0.3)),
            ),
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault,
                vertical: Dimensions.paddingSizeDefault),
            child:
            ResponsiveHelper.isDesktop(context)?
                Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      ClipRRect(
      borderRadius:
      BorderRadius.circular(Dimensions.radiusExtraMoreLarge),
      child: CustomImage(
      height: 100,
      width: 100,
      fit: BoxFit.cover,
      image: providerDetails.logoFullPath ?? "",
      placeholder: Images.userPlaceHolder,
      ),
      ),
      const SizedBox(
      width: Dimensions.paddingSizeSmall,
      ),
      Expanded(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(providerDetails.companyName ?? '',
      style: ubuntuMedium.copyWith(
      fontSize: Dimensions.fontSizeLarge),
      maxLines: 2,
        softWrap: true,),
      const SizedBox(height: Dimensions.paddingSizeEight),
      // Text('Contact No : ${providerDetails.companyPhone}' ?? '',
      // style: ubuntuMedium.copyWith(
      // fontSize: Dimensions.fontSizeLarge),
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis),
      // const SizedBox(height: Dimensions.paddingSizeEight),
      if (subcategories.isNotEmpty)
      Text(
      subcategories,
      style: ubuntuRegular.copyWith(
      fontSize: Dimensions.fontSizeSmall,
      color: Theme.of(context).hintColor),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      ),
      if (isAppbar)
      Padding(
      padding: const EdgeInsets.only(
      top: Dimensions.paddingSizeEight),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
      children: [
      SizedBox(
      height: 20,
      child: Row(
      children: [
      Icon(Icons.star,
      color: Theme.of(context)
          .colorScheme
          .primary,
      size: Dimensions.fontSizeLarge),
      Gaps.horizontalGapOf(5),
      Directionality(
      textDirection: TextDirection.ltr,
      child: Text(
      providerDetails.avgRating!
          .toStringAsFixed(2),
      style: ubuntuRegular.copyWith(
      color: Theme.of(context)
          .hintColor),
      ),
      ),
      ],
      ),
      ),
      Container(
      width: 1,
      height: 10,
      margin: const EdgeInsets.symmetric(
      horizontal:
      Dimensions.paddingSizeExtraSmall),
      decoration: BoxDecoration(
      color: Theme.of(context)
          .primaryColor
          .withOpacity(0.5),
      ),
      ),
      InkWell(
      onTap: () => isAppbar
      ? Get.toNamed(
      RouteHelper.getProviderReviewScreen(
      subcategories, providerId))
          : null,
      child: Text(
      '${providerDetails.ratingCount} ${'reviews'.tr}',
      style: isAppbar
      ? ubuntuRegular.copyWith(
      fontSize:
      Dimensions.fontSizeDefault,
      color: Theme.of(context)
          .colorScheme
          .primary,
      decoration: isAppbar
      ? TextDecoration.underline
          : null,
      )
          : ubuntuRegular.copyWith(
      fontSize:
      Dimensions.fontSizeDefault,
      color:
      Theme.of(context).hintColor,
      decoration: isAppbar
      ? TextDecoration.underline
          : null,
      )),
      ),
      ],
      ),
      ],
      ),
      ),
        if (social1.isNotEmpty || social2.isNotEmpty || social3.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: Dimensions.paddingSizeDefault),

              Text(
                'Social Profiles :',
                style: ubuntuMedium.copyWith(
                  fontSize: Dimensions.fontSizeDefault,
                ),
              ),

              if (social1.isNotEmpty)
                Text(
                  social1,
                  style: ubuntuBold.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                  ),
                ),

              if (social2.isNotEmpty)
                Text(
                  social2,
                  style: ubuntuBold.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                  ),
                ),

              if (social3.isNotEmpty)
                Text(
                  social3,
                  style: ubuntuBold.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                  ),
                ),
            ],
          ),
      ]),
      Expanded(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(
      children: [
      Text('Leader Name : ' ?? '',
      style: ubuntuBold.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      Text('${providerDetails.provider_profile!.rpName}' ?? '',
      style: ubuntuRegular.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      ],
      ),
      Row(
      children: [
      Text('Bio : ' ?? '',
      style: ubuntuBold.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      Text('${providerDetails.provider_profile!.bio}' ?? '',
      style: ubuntuRegular.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      ],
      ),
      Row(
      children: [
      Text('Benefits : ' ?? '',
      style: ubuntuBold.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      Text('${providerDetails.provider_profile!.benefits}' ?? '',
      style: ubuntuRegular.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      ],
      ),
      Row(
      children: [
      Text('Cash Hon. : ' ?? '',
      style: ubuntuBold.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      Text('${providerDetails.provider_profile!.cashHonorarium}' ?? '',
      style: ubuntuRegular.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      ],
      ),
      Row(
      children: [
      Text('Achivements : ' ?? '',
      style: ubuntuBold.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      Text('${providerDetails.provider_profile!.achievements}' ?? '',
      style: ubuntuRegular.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      ],
      ),
      Row(
      children: [
      Text('Other Deliverable : ' ?? '',
      style: ubuntuBold.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      Text('${providerDetails.provider_profile!.otherDeliverable}' ?? '',
      style: ubuntuRegular.copyWith(
      fontSize: Dimensions.fontSizeSmall),
      maxLines: 2,
      overflow: TextOverflow.ellipsis),
      ],
      ),
      if (isAppbar)
      Padding(
      padding: const EdgeInsets.only(
      top: Dimensions.paddingSizeEight),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      if (isAppbar &&
      providerDetails.timeSchedule != null)
      InkWell(
      onTap: () => isAppbar
      ? Get.toNamed(RouteHelper
          .getProviderAvailabilityScreen(
      subcategories, providerId))
          : null,
      child: Text(
      "more_info".tr,
      style: ubuntuMedium.copyWith(
      color: Theme.of(context)
          .colorScheme
          .primary),
      ),
      )
      ],
      ),
      ),
      ]),
      ),
      ],),

      ],
      ),
      )
      ],
      )
                :
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusExtraMoreLarge),
                      child: CustomImage(
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        image: providerDetails.logoFullPath ?? "",
                        placeholder: Images.userPlaceHolder,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: Dimensions.paddingSizeSmall,
                            ),
                            Text(providerDetails.companyName ?? '',
                                style: ubuntuMedium.copyWith(
                                    fontSize: Dimensions.fontSizeLarge),
                                maxLines: 5,
                              softWrap: true,),
                            const SizedBox(height: Dimensions.paddingSizeEight),
                            // Text('Contact No : ${providerDetails.companyPhone}' ?? '',
                            //     style: ubuntuMedium.copyWith(
                            //         fontSize: Dimensions.fontSizeLarge),
                            //     maxLines: 2,
                            //     overflow: TextOverflow.ellipsis),
                            const SizedBox(height: Dimensions.paddingSizeEight),
                            if (subcategories.isNotEmpty)
                              Text(
                                subcategories,
                                style: ubuntuRegular.copyWith(
                                    fontSize: Dimensions.fontSizeSmall,
                                    color: Theme.of(context).hintColor),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            if (isAppbar)
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: Dimensions.paddingSizeEight),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          child: Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  size: Dimensions.fontSizeLarge),
                                              Gaps.horizontalGapOf(5),
                                              Directionality(
                                                textDirection: TextDirection.ltr,
                                                child: Text(
                                                  providerDetails.avgRating!
                                                      .toStringAsFixed(2),
                                                  style: ubuntuRegular.copyWith(
                                                      color: Theme.of(context)
                                                          .hintColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 10,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal:
                                              Dimensions.paddingSizeExtraSmall),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => isAppbar
                                              ? Get.toNamed(
                                              RouteHelper.getProviderReviewScreen(
                                                  subcategories, providerId))
                                              : null,
                                          child: Text(
                                              '${providerDetails.ratingCount} ${'reviews'.tr}',
                                              style: isAppbar
                                                  ? ubuntuRegular.copyWith(
                                                fontSize:
                                                Dimensions.fontSizeDefault,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                decoration: isAppbar
                                                    ? TextDecoration.underline
                                                    : null,
                                              )
                                                  : ubuntuRegular.copyWith(
                                                fontSize:
                                                Dimensions.fontSizeDefault,
                                                color:
                                                Theme.of(context).hintColor,
                                                decoration: isAppbar
                                                    ? TextDecoration.underline
                                                    : null,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ]),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text('Leader Name : ' ?? '',
                        style: ubuntuBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis),
                    Expanded(
                      child: Text('${providerDetails.provider_profile!.rpName}' ?? '',
                          style: ubuntuRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Bio : ' ?? '',
                        style: ubuntuBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Expanded(
                      child: Text('${providerDetails.provider_profile!.bio}' ?? '',
                          style: ubuntuRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Benefits : ' ?? '',
                        style: ubuntuBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Expanded(
                      child: Text('${providerDetails.provider_profile!.benefits}' ?? '',
                          style: ubuntuRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall),
                          maxLines: 2,
                          softWrap: true,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Cash Hon. : ' ?? '',
                        style: ubuntuBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Expanded(
                      child: Text('${providerDetails.provider_profile!.cashHonorarium}' ?? '',
                          style: ubuntuRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Achivements : ' ?? '',
                        style: ubuntuBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Expanded(
                      child: Text('${providerDetails.provider_profile!.achievements}' ?? '',
                          style: ubuntuRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Other Deliverable : ' ?? '',
                        style: ubuntuBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Expanded(
                      child: Text('${providerDetails.provider_profile!.otherDeliverable}' ?? '',
                          style: ubuntuRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                if (isAppbar)
                  Padding(
                    padding: const EdgeInsets.only(
                        top: Dimensions.paddingSizeEight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isAppbar &&
                            providerDetails.timeSchedule != null)
                          InkWell(
                            onTap: () => isAppbar
                                ? Get.toNamed(RouteHelper
                                .getProviderAvailabilityScreen(
                                subcategories, providerId))
                                : null,
                            child: Text(
                              "more_info".tr,
                              style: ubuntuMedium.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary),
                            ),
                          )
                      ],
                    ),
                  ),
                if (social1.isNotEmpty || social2.isNotEmpty || social3.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: Dimensions.paddingSizeDefault),

                      Text(
                        'Social Profiles :',
                        style: ubuntuMedium.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                        ),
                      ),

                      if (social1.isNotEmpty)
                        Text(
                          social1,
                          style: ubuntuBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                          ),
                        ),

                      if (social2.isNotEmpty)
                        Text(
                          social2,
                          style: ubuntuBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                          ),
                        ),

                      if (social3.isNotEmpty)
                        Text(
                          social3,
                          style: ubuntuBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
          if (isAppbar == true) const Expanded(child: SizedBox()),
        ],
      );
    });
  }
  Widget _buildProfileRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeEight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title: ',
              style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault)),
          Expanded(
            child: Text(value ?? '',
                style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                softWrap: true),
          ),
        ],
      ),
    );
  }
  Widget _buildMiniInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$title: ',
            style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
          ),
          Flexible(
            child: Text(
              value,
              style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

}
