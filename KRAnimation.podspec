#
# Be sure to run `pod lib lint KRAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KRAnimation'
  s.version          = '0.1.0'
  s.summary          = 'An easy-to-use animation library, inspired by JHChainableAnimations.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
JHChainableAnimations is awesome, BUT, due to its free syntax, sometimes its hard to use timing functions, not to mention certain idiosyncracies.
KRAnimation adopts a more familiar and traditional syntax, making it really obvious what the functions will do.
                       DESC

  s.homepage         = 'https://github.com/BridgeTheGap/KRAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Josh Woomin Park' => 'wmpark@knowre.com' }
  s.source           = { :git => 'https://github.com/BridgeTheGap/KRAnimation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KRAnimation/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KRAnimation' => ['KRAnimation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
