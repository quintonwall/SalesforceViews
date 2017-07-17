platform :ios, '10.3'
use_frameworks!

#pods shared between targets
def shared_pods
 pod 'SObjectKit'
end

target 'SalesforceViews' do
  source 'https://github.com/CocoaPods/Specs.git'
  pod 'SwiftlySalesforce'
  pod 'Mapbox-iOS-SDK', '~> 3.6'

  #to allow stored properties on extensions
  pod 'AssociatedValues'
  shared_pods
end

