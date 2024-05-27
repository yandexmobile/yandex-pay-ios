DEPLOYMENT_VERSION = '13.0'

platform :ios, DEPLOYMENT_VERSION

inhibit_all_warnings!

target 'YandexPaySDKDemoApp' do
  pod 'YandexPaySDK', '~> 1.7.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
