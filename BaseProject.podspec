#
#  Be sure to run `pod spec lint BaseProject.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "BaseProject"
  s.version      = "0.0.1"
  s.summary      = "集合工具"
s.homepage     = "https://github.com/wangxiangzhao/BaseProject"
  s.social_media_url = 'https://www.baidu.com'
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "wangxiangzhao" => "13269532539@163.com" }
  s.source       = { :git => 'https://github.com/wangxiangzhao/BaseProject.git', :tag => s.version}
  s.requires_arc = true
  s.source_files = 'BaseProject/Tools/*'
  #s.public_header_files = 'BaseProject/Tools/WXZImportHeader.h'


end
