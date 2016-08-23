Pod::Spec.new do |s|

  s.name         = "YCHelpKit"
  s.version      = "1.1.0"
  s.summary      = "积累的工具"

  s.description  = <<-DESC
        工作中积累的工具
                   DESC

  s.homepage     = "https://github.com/yangchenjava/YCHelpKit"
  s.license      = "MIT"
  s.author       = { "yangchenjava" => "yangchen_java@126.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/yangchenjava/YCHelpKit.git", :tag => "#{s.version}" }
  s.source_files = "YCHelpKit/Classes/**/*.{h,m}"

  s.framework    = "UIKit"
  s.requires_arc = true
  s.dependency "AFNetworking", "~> 3.0"
  s.dependency "Mantle", "2.0.7"
  s.dependency "MBProgressHUD", "0.9.2"
  s.dependency "SDWebImage", "3.8.1"

end
