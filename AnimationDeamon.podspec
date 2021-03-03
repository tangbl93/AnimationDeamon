Pod::Spec.new do |s|
  s.name             = 'AnimationDeamon'
  s.version          = '1.0'
  s.summary          = 'Animation Deamon'
  s.description      = 'Prevent animation being paused automatically'
  s.homepage         = 'https://github.com/tangbl93/AnimationDeamon'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tangbl93' => 'tangbl93@gmail.com' }
  s.source           = { :git => 'https://github.com/tangbl93/AnimationDeamon.git', :tag => s.version.to_s }

  s.swift_version = "5.0"
  s.ios.deployment_target = '9.0'
  s.source_files = 'AnimationDeamon/Classes/**/*'
  
end
