#
# Be sure to run `pod lib lint JSBinding.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JSBinding'
  s.version          = '0.1.0'
  s.summary          = 'A short description of JSBinding.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/qianhongqiang2012@163.com/JSBinding'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qianhongqiang2012@163.com' => 'qianhongqiang2012@163.com' }
  s.source           = { :git => 'https://github.com/qianhongqiang2012@163.com/JSBinding.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.default_subspec = 'UIKitBinding'

  s.subspec "UIKitBinding" do |ss|
    ss.ios.source_files = 'JSBinding/UIKit/**/*'
    ss.resources = "JSBinding/Resource/*.js"
  end

  s.subspec "SDWebImageBinding" do |ss|
    ss.ios.source_files = 'JSBinding/SDWebImage/**/*'
    ss.dependency 'SDWebImage'
  end

  s.subspec "AFNetworkingBinding" do |ss|
    ss.ios.source_files = 'JSBinding/AFNetworking/**/*'
    ss.dependency 'AFNetworking'
  end

end
