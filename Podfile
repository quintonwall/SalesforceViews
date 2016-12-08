use_frameworks!

#pods shared between the phone and watch app
def shared_pods
 pod 'SwiftyJSON', '~>2.2'
end

target 'SalesforceViews' do
  platform :ios, '9.3'
  source 'https://github.com/CocoaPods/Specs.git'
  source 'https://github.com/goinstant/pods-specs-public'

 pod "SwiftlySalesforce"
 pod 'SObjectKit'
 #pod 'RealmSwift'
 pod 'SDWebImage'
 pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift2'
 pod 'FCAlertView', :git => 'https://github.com/nimati/FCAlertView'

  shared_pods

end

