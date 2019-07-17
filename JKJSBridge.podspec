#
#  Be sure to run `pod spec lint JKJSBridge.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "JKJSBridge"
  spec.version      = "0.0.1"
  spec.summary      = "JKJSBridge"
  spec.description  = "JKJSBridge"

  spec.homepage     = "https://github.com/jokerwking/JKJSBridge"
  spec.license      = "MIT"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "joker" => "https://github.com/jokerwking" }

  spec.platform     = :ios
  spec.platform     = :ios, "8.0"

  spec.source       = { :git => "https://github.com/jokerwking/JKJSBridge.git", :tag => "#{spec.version}" }

  spec.source_files  = "JKJSBridge", "JKJSBridge/**/*.{h,m}"

  spec.public_header_files = "JKJSBridge/**/*.h"
  spec.frameworks = 'UIKit', 'Foundation', 'WebKit'

end
