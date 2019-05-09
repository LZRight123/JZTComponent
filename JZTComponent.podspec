Pod::Spec.new do |s|
  s.name = "JZTComponent"
  s.version = "1.0.2"
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
  s.frameworks='Foundation'
#  s.source_files  = "JZTComponent/**/*.swift"

  s.subspec 'Categorys' do |categorys|
    categorys.source_files = 'JZTComponent/Categorys/*.swift'
    # categorys.compiler_flags = '-Wno-incomplete-implementation -Wno-missing-prototypes'
    # categorys.dependency 'Alamofire'
  end
  
  s.subspec 'Tool' do |tool|
    tool.source_files = 'JZTComponent/Tool/*.swift'
  end
  
  s.subspec 'Animator' do |animator|
    animator.source_files = 'JZTComponent/Animator/*.swift'
  end
  
  s.subspec 'TransitioningAnimate' do |transitioningAnimate|
    transitioningAnimate.source_files = 'JZTComponent/TransitioningAnimate/*.swift'
  end

  
end
