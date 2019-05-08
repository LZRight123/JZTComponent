Pod::Spec.new do |s|
  s.name = "JZTComponent"
  s.version = "1.0.0"
  s.license = 'MIT'
  s.summary = "Categorys，tools，TransitioningAnimate."
  s.homepage = "https://github.com/LZRight123/JZTComponent.git"
  s.author = { "梁泽" => "350442340@qq.com" }
  s.source = { :git => "https://github.com/LZRight123/JZTComponent.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'
  # s.osx.deployment_target = '10.12'
  # s.tvos.deployment_target = '10.0'
  # s.watchos.deployment_target = '3.0'

  s.swift_version = '5.0'

  s.source_files  = "JZTComponent/**/*.swift"

  s.frameworks='Foundation'
end
