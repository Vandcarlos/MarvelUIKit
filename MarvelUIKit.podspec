#
# Be sure to run `pod lib lint MarvelUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MarvelUIKit'
  s.version          = '0.1.0'
  s.summary          = 'The UI kit'
  s.swift_version    = '5.2'
  s.ios.deployment_target = '12.0'

  s.description      = 'The UI kit'

  s.homepage         = 'https://github.com/Vandcarlos/MarvelUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vandcarlos' => 'vandcarlosjunior@gmail.com' }
  s.source           = { :git => 'https://github.com/Vandcarlos/MarvelUIKit.git', :tag => s.version.to_s }

  s.source_files = 'MarvelUIKit/Classes/**/*'
  s.resources = 'MarvelUIKit/Assets/**/*'

end
