Pod::Spec.new do |s|
  s.name             = 'FlexiJSONCoder'
  s.version          = '0.0.1'
  s.summary          = 'A FlexiJSONCoder implementation to supports type coercion with fallback'
  s.description      = 'FlexiJSONCoder is a flexible Swift package for decoding various types with fallback logic (String, Int, Float, etc.)'
  s.homepage         = 'https://github.com/Forgwhiz/FlexiJSONCoder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Forgwhiz' => 'mailtosathish05@gmail.com' }
  s.source           = { :git => 'https://github.com/Forgwhiz/FlexiJSONCoder.git', :tag => s.version.to_s }
  s.source_files     = 'FlexiJSONCoder/Sources/**/*.{h,m,swift}'
  s.platform         = :ios, '13.5'
  s.swift_version    = '5.0'
  
   # Define as dynamic framework
  s.frameworks       = 'Foundation'
  s.requires_arc     = true

  # Dynamic framework
  s.static_framework = false
end
