Pod::Spec.new do |s|

  s.name         = "YCHelpKit"
  s.version      = "1.2.18"
  s.summary      = "工作中积累的工具"

  s.homepage     = "https://github.com/yangchenjava/YCHelpKit"
  s.license      = "MIT"
  s.author       = { "yangchenjava" => "yangchen_java@126.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/yangchenjava/YCHelpKit.git", :tag => s.version }
  s.source_files = "YCHelpKit/**/*.{h,m}"
  s.resource     = "YCHelpKit/**/*.{bundle,png,lproj}"

  s.requires_arc = true
  s.framework    = "UIKit"
  s.dependency "AFNetworking", "~> 3.0"
  s.dependency "MBProgressHUD", "~> 1.0"
  s.dependency "SDWebImage", "~> 4.0"

end
