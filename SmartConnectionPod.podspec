#
#  Be sure to run `pod spec lint SmartConnectionPod.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name               = "SmartConnectionPod"
  spec.version            = "0.0.1"
  spec.summary            = "小喜的私有庫"
  spec.description        = <<-DESC
  透過 SSID 、 PAWSSWORD 與 CUSTINFO 進行 SmartConnection 連線。 
                   DESC
  spec.homepage           = "https://jeff.com/SmartConnectionPod"
  spec.license            = "MIT"
  spec.author             = { "Jeff Chiu" => "neonn80085@hotmail.com" }
    
  spec.platform           = :ios, "9.0"
  spec.source             = { :git => "https://github.com/smallhappy/SmartConnectionPod.git", :tag => "#{spec.version}" }

  spec.source_files       = 'SmartConnectionPod/SourceCode/**/*.{h,m,mm}'

  # spec.static_framework = true
  spec.frameworks = 'CoreFoundation', 'SystemConfiguration'
  spec.libraries = 'SmartConnection'
  spec.vendored_libraries = 'SmartConnectionPod/Lib/libSmartConnection.a'

  # spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 'VALID_ARCHS' => 'arm64', 'FRAMEWORK_SEARCH_PATHS' => 'SmartConnectionPod/Lib/libSmartConnection.a' }

end
