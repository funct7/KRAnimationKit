#
# Be sure to run `pod lib lint KRAnimationKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KRAnimationKit'
  s.version          = '0.13.2'
  s.summary          = 'An easy-to-use animation library, inspired by `JHChainableAnimations`.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
JHChainableAnimations is good, BUT, due to its unique syntax, the code could look very messy, if not undecipherable.

KRAnimationKit adopts a more familiar and traditional syntax, making it really obvious what the functions will do.
Not only that, it's really simple to mix and match animations for different views as well as reverse or repeat your animations.
                       DESC

  s.homepage         = 'https://github.com/funct7/KRAnimationKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Josh Woomin Park' => 'joshuaparkwm@gmail.com' }
  s.source           = { :git => 'https://github.com/funct7/KRAnimationKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KRAnimationKit/**/*'
  s.dependency 'KRTimingFunction', '1.1.0'
  # s.resource_bundles = {
  #   'KRAnimationKit' => ['KRAnimationKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

  s.swift_version = '4.2'
  
end
