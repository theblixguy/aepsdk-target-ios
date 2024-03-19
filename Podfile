# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

# Comment the next line if you don't want to use dynamic frameworks
use_frameworks!

$dev_repo = 'https://github.com/adobe/aepsdk-core-ios.git'
$dev_branch = 'staging'

workspace 'AEPTarget'
project 'AEPTarget.xcodeproj'

pod 'SwiftLint', '0.52.0'

# ==================
# SHARED POD GROUPS
# ==================
def lib_main
    pod 'AEPCore'
    pod 'AEPServices'
    pod 'AEPRulesEngine'
end

def lib_dev
    pod 'AEPCore', :git => $dev_repo, :branch => $dev_branch
    pod 'AEPServices', :git => $dev_repo, :branch => $dev_branch
    pod 'AEPRulesEngine', :git => 'https://github.com/adobe/aepsdk-rulesengine-ios.git', :branch => $dev_branch
end

def app_main
    pod 'AEPCore'
    pod 'AEPServices'
    pod 'AEPRulesEngine'
    pod 'AEPIdentity'
    pod 'AEPLifecycle'
    pod 'AEPSignal'
    pod 'AEPAnalytics'
    pod 'AEPAssurance'
end

def app_dev
    pod 'AEPCore', :git => $dev_repo, :branch => $dev_branch
    pod 'AEPServices', :git => $dev_repo, :branch => $dev_branch
    pod 'AEPRulesEngine', :git => 'https://github.com/adobe/aepsdk-rulesengine-ios.git', :branch => $dev_branch
    pod 'AEPIdentity', :git => $dev_repo, :branch => $dev_branch
    pod 'AEPLifecycle', :git => $dev_repo, :branch => $dev_branch
    pod 'AEPSignal', :git => $dev_repo, :branch => $dev_branch
    pod 'AEPAnalytics'
    pod 'AEPAssurance', :git => 'https://github.com/adobe/aepsdk-assurance-ios.git', :branch => $dev_branch
end

# ==================
# TARGET DEFINITIONS
# ==================
target 'AEPTarget' do
  lib_dev
end

target 'AEPTargetDemoApp' do
  app_dev
end
  
target 'AEPTargetDemoObjCApp' do
  app_dev
end

target 'AEPTargetTests' do
  app_dev
  pod 'SwiftyJSON', '~> 5.0'
end
