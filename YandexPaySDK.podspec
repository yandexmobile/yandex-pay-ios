Pod::Spec.new do |s|
  s.name                  = 'YandexPaySDK'
  s.version               = '2.1.2'
  s.summary               = 'Yandex Pay Modular SDK for iOS'
  s.homepage              = 'https://pay.yandex.ru'
  s.license               = { :type => 'Proprietary', :text => 'License Agreement is available at https://yandex.ru/legal/ypay_sdk_agreement/?lang=ru.' }
  s.author                = { 'Yandex LLC' => 'yandexpay@yandex-team.com' }
  s.source                = { :git => 'https://github.com/yandexmobile/yandex-pay-ios.git', :tag => "v#{s.version}" }
  s.swift_versions        = '6.0'
  s.ios.deployment_target = '15.0'
  s.pod_target_xcconfig   = { 'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO' }
  s.user_target_xcconfig  = { 'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO' }

  # Internal xcframework subspecs — installed only as transitive deps of product subspecs.
  # Each corresponds to one .binaryTarget in Package.swift.

  s.subspec 'FintechSDKLoginAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKLoginAdapter.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKAuthInterfaces'
  end

  s.subspec 'FintechSDKAuthInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAuthInterfaces.xcframework'
  end

  s.subspec 'FintechSDKAppMetricaAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKAppMetricaAdapter.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'AppMetricaCore', '~> 5.15'
  end

  s.subspec 'FintechSDKAnalyticsInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAnalyticsInterfaces.xcframework'
  end

  s.subspec 'FintechSDKFontsAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKFontsAdapter.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKFontsInterfaces'
  end

  s.subspec 'FintechSDKFontsInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKFontsInterfaces.xcframework'
  end

  s.subspec 'FintechSDKRealTimeAnalyticsAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKRealTimeAnalyticsAdapter.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
  end

  s.subspec 'FintechSDKRealUserMonitoringAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKRealUserMonitoringAdapter.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
  end

  s.subspec 'ExternalBduiAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/ExternalBduiAdapter.xcframework'
    ss.dependency 'YandexPaySDK/FintechBDUIWrapper'
    ss.dependency 'YandexPaySDK/FintechSDKBDUICore'
    ss.dependency 'YandexPaySDK/FintechSDKBDUIFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPaySDK/FintechPlusSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKCoreAnalytics'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUI'
    ss.dependency 'YandexPaySDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkImplementation'
    ss.dependency 'YandexPaySDK/FintechYBSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKRemoteResourcesData'
  end

  s.subspec 'FintechBDUIWrapper' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechBDUIWrapper.xcframework'
  end

  s.subspec 'FintechSDKBDUICore' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKBDUICore.xcframework'
  end

  s.subspec 'FintechSDKBDUIFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKBDUIFeatures.xcframework'
  end

  s.subspec 'FintechSDKNetworkInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNetworkInterfaces.xcframework'
  end

  s.subspec 'FintechSDKCoreUtils' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKCoreUtils.xcframework'
  end

  s.subspec 'FintechPlusSDKInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechPlusSDKInterfaces.xcframework'
  end

  s.subspec 'FintechSDKCoreAnalytics' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKCoreAnalytics.xcframework'
  end

  s.subspec 'FintechSDKCoreUI' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKCoreUI.xcframework'
  end

  s.subspec 'FintechSDKCommonEntity' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKCommonEntity.xcframework'
  end

  s.subspec 'FintechSDKNetworkImplementation' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNetworkImplementation.xcframework'
  end

  s.subspec 'FintechYBSDKInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechYBSDKInterfaces.xcframework'
  end

  s.subspec 'FintechSDKRemoteResourcesData' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKRemoteResourcesData.xcframework'
  end

  s.subspec 'FintechSDKPayBoxEntity' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayBoxEntity.xcframework'
  end

  s.subspec 'FintechSDKMerchantRedirect' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKMerchantRedirect.xcframework'
  end

  s.subspec 'FintechSDKPollingScenario' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPollingScenario.xcframework'
  end

  s.subspec 'FintechSDKPayBoxResources' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayBoxResources.xcframework'
  end

  s.subspec 'FintechSDKPayOrderData' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayOrderData.xcframework'
  end

  s.subspec 'FintechSDKPayMerchantData' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayMerchantData.xcframework'
  end

  s.subspec 'FintechSDKRedirectScenario' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKRedirectScenario.xcframework'
  end

  s.subspec 'FintechSDKPayFormFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayFormFeatures.xcframework'
  end

  s.subspec 'FintechSDKPayButton' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayButton.xcframework'
  end

  s.subspec 'FintechSDKPayBadge' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayBadge.xcframework'
  end

  s.subspec 'FintechSDKPayWidget' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayWidget.xcframework'
  end

  s.subspec 'FintechSDKUltimateWidget' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKUltimateWidget.xcframework'
  end

  s.subspec 'FintechSDKAuthCoreImplementation' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAuthCoreImplementation.xcframework'
  end

  s.subspec 'FintechSDKAuthorizationScenario' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAuthorizationScenario.xcframework'
  end

  s.subspec 'FintechSDKNativeErrorFeature' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNativeErrorFeature.xcframework'
  end

  s.subspec 'FintechSDKDivKitWidgetsFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKDivKitWidgetsFeatures.xcframework'
  end

  s.subspec 'FintechSDKWebViewFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKWebViewFeatures.xcframework'
  end

  s.subspec 'FintechSDKLoaderScreen' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKLoaderScreen.xcframework'
  end

  s.subspec 'FintechSDKAssistant' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAssistant.xcframework'
  end

  s.subspec 'FintechSDKQuickPayment' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKQuickPayment.xcframework'
  end

  s.subspec 'FintechSDKQuickPaymentEntity' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKQuickPaymentEntity.xcframework'
  end

  s.subspec 'FintechSDKQuickPaymentShared' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKQuickPaymentShared.xcframework'
  end

  s.subspec 'FintechSDKNavigationInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNavigationInterfaces.xcframework'
  end

  s.subspec 'FintechSDKNavigationImplementation' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNavigationImplementation.xcframework'
  end

  # Consumer product subspecs — use these in your Podfile.
  # pod 'YandexPayModularSDK/YandexPayAuth'
  # pod 'YandexPayModularSDK/YandexQuickPay'

  s.subspec 'YandexPayConfiguration' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayConfiguration.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxEntity'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUI'
    ss.dependency 'YandexPaySDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkInterfaces'
    ss.script_phase = {
      :name => 'Embed YandexPayConfiguration Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPaySDK:YandexPayConfiguration" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPaySDK:YandexPayConfiguration\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPaySDK:YandexPayConfiguration\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
  end

  s.subspec 'YandexPayAuth' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayAuth.xcframework'
    ss.dependency 'YandexPaySDK/YandexPayConfiguration'
    ss.dependency 'YandexPaySDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPaySDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxEntity'
    ss.dependency 'YandexPaySDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUI'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkInterfaces'
    ss.script_phase = {
      :name => 'Embed YandexPayAuth Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPaySDK:YandexPayAuth" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPaySDK:YandexPayAuth\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayAuth/YandexPayAuth.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayAuth/YandexPayAuth.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPaySDK:YandexPayAuth\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
  end

  s.subspec 'YandexPayWithRedirect' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayWithRedirect.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKMerchantRedirect'
    ss.dependency 'YandexPaySDK/FintechSDKPollingScenario'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxEntity'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxResources'
    ss.dependency 'YandexPaySDK/FintechSDKPayOrderData'
    ss.dependency 'YandexPaySDK/FintechSDKPayMerchantData'
    ss.dependency 'YandexPaySDK/FintechSDKRedirectScenario'
    ss.dependency 'YandexPaySDK/FintechSDKPayFormFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKPayButton'
    ss.dependency 'YandexPaySDK/FintechSDKPayBadge'
    ss.dependency 'YandexPaySDK/FintechSDKPayWidget'
    ss.dependency 'YandexPaySDK/FintechSDKUltimateWidget'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUI'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKBDUICore'
    ss.dependency 'YandexPaySDK/FintechSDKBDUIFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPaySDK/FintechSDKCoreAnalytics'
    ss.dependency 'YandexPaySDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKAuthCoreImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKAuthorizationScenario'
    ss.dependency 'YandexPaySDK/FintechSDKNativeErrorFeature'
    ss.dependency 'YandexPaySDK/FintechSDKRemoteResourcesData'
    ss.dependency 'YandexPaySDK/FintechSDKDivKitWidgetsFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKWebViewFeatures'
    ss.dependency 'YandexPaySDK/FintechPlusSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechYBSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKLoaderScreen'
    ss.dependency 'YandexPaySDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKFontsAdapter'
    ss.dependency 'YandexPaySDK/ExternalBduiAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealUserMonitoringAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPaySDK/YandexPayConfiguration'
    ss.script_phase = {
      :name => 'Embed YandexPayWithRedirect Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPaySDK:YandexPayWithRedirect" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPaySDK:YandexPayWithRedirect\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayWithRedirect/YandexPayWithRedirect.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayWithRedirect/YandexPayWithRedirect.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKMerchantRedirect/FintechSDKMerchantRedirect.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKMerchantRedirect/FintechSDKMerchantRedirect.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPollingScenario/FintechSDKPollingScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPollingScenario/FintechSDKPollingScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxResources/FintechSDKPayBoxResources.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxResources/FintechSDKPayBoxResources.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayOrderData/FintechSDKPayOrderData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayOrderData/FintechSDKPayOrderData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayMerchantData/FintechSDKPayMerchantData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayMerchantData/FintechSDKPayMerchantData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRedirectScenario/FintechSDKRedirectScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRedirectScenario/FintechSDKRedirectScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayFormFeatures/FintechSDKPayFormFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayFormFeatures/FintechSDKPayFormFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayButton/FintechSDKPayButton.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayButton/FintechSDKPayButton.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBadge/FintechSDKPayBadge.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBadge/FintechSDKPayBadge.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayWidget/FintechSDKPayWidget.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayWidget/FintechSDKPayWidget.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKUltimateWidget/FintechSDKUltimateWidget.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKUltimateWidget/FintechSDKUltimateWidget.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPaySDK:YandexPayWithRedirect\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
  end

  s.subspec 'YandexPayInApp' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayInApp.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKMerchantRedirect'
    ss.dependency 'YandexPaySDK/FintechSDKPollingScenario'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxEntity'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxResources'
    ss.dependency 'YandexPaySDK/FintechSDKPayOrderData'
    ss.dependency 'YandexPaySDK/FintechSDKPayMerchantData'
    ss.dependency 'YandexPaySDK/FintechSDKRedirectScenario'
    ss.dependency 'YandexPaySDK/FintechSDKPayFormFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKPayButton'
    ss.dependency 'YandexPaySDK/FintechSDKPayBadge'
    ss.dependency 'YandexPaySDK/FintechSDKPayWidget'
    ss.dependency 'YandexPaySDK/FintechSDKUltimateWidget'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUI'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKBDUICore'
    ss.dependency 'YandexPaySDK/FintechSDKBDUIFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPaySDK/FintechSDKCoreAnalytics'
    ss.dependency 'YandexPaySDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKAuthCoreImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKAuthorizationScenario'
    ss.dependency 'YandexPaySDK/FintechSDKNativeErrorFeature'
    ss.dependency 'YandexPaySDK/FintechSDKRemoteResourcesData'
    ss.dependency 'YandexPaySDK/FintechSDKDivKitWidgetsFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKWebViewFeatures'
    ss.dependency 'YandexPaySDK/FintechPlusSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechYBSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKLoaderScreen'
    ss.dependency 'YandexPaySDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKFontsAdapter'
    ss.dependency 'YandexPaySDK/ExternalBduiAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealUserMonitoringAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPaySDK/YandexPayConfiguration'
    ss.script_phase = {
      :name => 'Embed YandexPayInApp Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPaySDK:YandexPayInApp" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPaySDK:YandexPayInApp\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayInApp/YandexPayInApp.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayInApp/YandexPayInApp.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKMerchantRedirect/FintechSDKMerchantRedirect.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKMerchantRedirect/FintechSDKMerchantRedirect.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPollingScenario/FintechSDKPollingScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPollingScenario/FintechSDKPollingScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxResources/FintechSDKPayBoxResources.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxResources/FintechSDKPayBoxResources.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayOrderData/FintechSDKPayOrderData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayOrderData/FintechSDKPayOrderData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayMerchantData/FintechSDKPayMerchantData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayMerchantData/FintechSDKPayMerchantData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRedirectScenario/FintechSDKRedirectScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRedirectScenario/FintechSDKRedirectScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayFormFeatures/FintechSDKPayFormFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayFormFeatures/FintechSDKPayFormFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayButton/FintechSDKPayButton.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayButton/FintechSDKPayButton.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBadge/FintechSDKPayBadge.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBadge/FintechSDKPayBadge.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayWidget/FintechSDKPayWidget.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayWidget/FintechSDKPayWidget.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKUltimateWidget/FintechSDKUltimateWidget.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKUltimateWidget/FintechSDKUltimateWidget.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPaySDK:YandexPayInApp\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
  end

  s.subspec 'YandexPayAssistant' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayAssistant.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKAssistant'
    ss.dependency 'YandexPaySDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKAuthCoreImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKAuthorizationScenario'
    ss.dependency 'YandexPaySDK/FintechSDKLoaderScreen'
    ss.dependency 'YandexPaySDK/FintechSDKBDUIFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKBDUICore'
    ss.dependency 'YandexPaySDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPaySDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUI'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPaySDK/FintechSDKCoreAnalytics'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPaySDK/FintechPlusSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechYBSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKDivKitWidgetsFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKWebViewFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKRemoteResourcesData'
    ss.dependency 'YandexPaySDK/FintechSDKNativeErrorFeature'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxResources'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxEntity'
    ss.dependency 'YandexPaySDK/ExternalBduiAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKFontsAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealUserMonitoringAdapter'
    ss.dependency 'YandexPaySDK/YandexPayConfiguration'
    ss.script_phase = {
      :name => 'Embed YandexPayAssistant Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPaySDK:YandexPayAssistant" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPaySDK:YandexPayAssistant\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayAssistant/YandexPayAssistant.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayAssistant/YandexPayAssistant.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAssistant/FintechSDKAssistant.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAssistant/FintechSDKAssistant.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxResources/FintechSDKPayBoxResources.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxResources/FintechSDKPayBoxResources.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPaySDK:YandexPayAssistant\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
  end

  s.subspec 'YandexPayInventory' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayInventory.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKMerchantRedirect'
    ss.dependency 'YandexPaySDK/FintechSDKPollingScenario'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxEntity'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxResources'
    ss.dependency 'YandexPaySDK/FintechSDKPayOrderData'
    ss.dependency 'YandexPaySDK/FintechSDKPayMerchantData'
    ss.dependency 'YandexPaySDK/FintechSDKRedirectScenario'
    ss.dependency 'YandexPaySDK/FintechSDKPayFormFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKPayButton'
    ss.dependency 'YandexPaySDK/FintechSDKPayBadge'
    ss.dependency 'YandexPaySDK/FintechSDKPayWidget'
    ss.dependency 'YandexPaySDK/FintechSDKUltimateWidget'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUI'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKBDUICore'
    ss.dependency 'YandexPaySDK/FintechSDKBDUIFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPaySDK/FintechSDKCoreAnalytics'
    ss.dependency 'YandexPaySDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKAuthCoreImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKAuthorizationScenario'
    ss.dependency 'YandexPaySDK/FintechSDKNativeErrorFeature'
    ss.dependency 'YandexPaySDK/FintechSDKRemoteResourcesData'
    ss.dependency 'YandexPaySDK/FintechSDKDivKitWidgetsFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKWebViewFeatures'
    ss.dependency 'YandexPaySDK/FintechPlusSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechYBSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKLoaderScreen'
    ss.dependency 'YandexPaySDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKFontsAdapter'
    ss.dependency 'YandexPaySDK/ExternalBduiAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealUserMonitoringAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPaySDK/YandexPayConfiguration'
    ss.script_phase = {
      :name => 'Embed YandexPayInventory Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPaySDK:YandexPayInventory" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPaySDK:YandexPayInventory\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayInventory/YandexPayInventory.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayInventory/YandexPayInventory.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKMerchantRedirect/FintechSDKMerchantRedirect.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKMerchantRedirect/FintechSDKMerchantRedirect.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPollingScenario/FintechSDKPollingScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPollingScenario/FintechSDKPollingScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxResources/FintechSDKPayBoxResources.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxResources/FintechSDKPayBoxResources.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayOrderData/FintechSDKPayOrderData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayOrderData/FintechSDKPayOrderData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayMerchantData/FintechSDKPayMerchantData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayMerchantData/FintechSDKPayMerchantData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRedirectScenario/FintechSDKRedirectScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRedirectScenario/FintechSDKRedirectScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayFormFeatures/FintechSDKPayFormFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayFormFeatures/FintechSDKPayFormFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayButton/FintechSDKPayButton.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayButton/FintechSDKPayButton.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBadge/FintechSDKPayBadge.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBadge/FintechSDKPayBadge.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayWidget/FintechSDKPayWidget.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayWidget/FintechSDKPayWidget.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKUltimateWidget/FintechSDKUltimateWidget.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKUltimateWidget/FintechSDKUltimateWidget.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPaySDK:YandexPayInventory\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
  end

  s.subspec 'YandexQuickPay' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexQuickPay.xcframework'
    ss.dependency 'YandexPaySDK/FintechSDKQuickPayment'
    ss.dependency 'YandexPaySDK/FintechSDKQuickPaymentEntity'
    ss.dependency 'YandexPaySDK/FintechSDKQuickPaymentShared'
    ss.dependency 'YandexPaySDK/FintechSDKPollingScenario'
    ss.dependency 'YandexPaySDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKBDUIFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKBDUICore'
    ss.dependency 'YandexPaySDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPaySDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUI'
    ss.dependency 'YandexPaySDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPaySDK/FintechSDKCoreAnalytics'
    ss.dependency 'YandexPaySDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPaySDK/FintechPlusSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechYBSDKInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKNetworkImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKDivKitWidgetsFeatures'
    ss.dependency 'YandexPaySDK/FintechSDKRemoteResourcesData'
    ss.dependency 'YandexPaySDK/FintechSDKAuthCoreImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKAuthorizationScenario'
    ss.dependency 'YandexPaySDK/FintechSDKNativeErrorFeature'
    ss.dependency 'YandexPaySDK/FintechSDKLoaderScreen'
    ss.dependency 'YandexPaySDK/FintechSDKNavigationInterfaces'
    ss.dependency 'YandexPaySDK/FintechSDKNavigationImplementation'
    ss.dependency 'YandexPaySDK/FintechSDKPayBoxEntity'
    ss.dependency 'YandexPaySDK/FintechSDKWebViewFeatures'
    ss.dependency 'YandexPaySDK/ExternalBduiAdapter'
    ss.dependency 'YandexPaySDK/FintechBDUIWrapper'
    ss.dependency 'YandexPaySDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKFontsAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter'
    ss.dependency 'YandexPaySDK/FintechSDKRealUserMonitoringAdapter'
    ss.dependency 'YandexPaySDK/YandexPayConfiguration'
    ss.script_phase = {
      :name => 'Embed YandexQuickPay Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPaySDK:YandexQuickPay" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPaySDK:YandexQuickPay\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexQuickPay/YandexQuickPay.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexQuickPay/YandexQuickPay.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKQuickPayment/FintechSDKQuickPayment.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKQuickPayment/FintechSDKQuickPayment.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKQuickPaymentEntity/FintechSDKQuickPaymentEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKQuickPaymentEntity/FintechSDKQuickPaymentEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKQuickPaymentShared/FintechSDKQuickPaymentShared.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKQuickPaymentShared/FintechSDKQuickPaymentShared.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPollingScenario/FintechSDKPollingScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPollingScenario/FintechSDKPollingScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNavigationInterfaces/FintechSDKNavigationInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNavigationInterfaces/FintechSDKNavigationInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNavigationImplementation/FintechSDKNavigationImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKNavigationImplementation/FintechSDKNavigationImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKPayBoxEntity/FintechSDKPayBoxEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechBDUIWrapper/FintechBDUIWrapper.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechBDUIWrapper/FintechBDUIWrapper.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPaySDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPaySDK:YandexQuickPay\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
  end

end
