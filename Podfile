source 'https://cdn.cocoapods.org/'
DEPLOYMENT_VERSION = '13.0'

platform :ios, DEPLOYMENT_VERSION

#use_frameworks! linkage: :static
inhibit_all_warnings!

target 'YandexPaySDKDemoApp' do
  use_frameworks!
  pod 'YandexPaySDK/Static'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end