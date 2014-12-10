Pod::Spec.new do |s|
  s.name         = 'XAspect'
  s.version      = '1.0.0'
  s.license      = 'MIT'
  s.summary      = 'Making code maintainable and reusable with aspect-oriented programming for Objective-C'
  s.homepage     = 'https://github.com/xareelee/XAspect'
  s.authors      = { 'Kang-Yu Xaree Lee' => 'xareelee@gmail.com' }
  s.source       = { :git => "https://github.com/xareelee/XAspect.git", :tag => s.version.to_s, :submodules =>  true }
  
  s.requires_arc = false  

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.library = 'c++'
  s.xcconfig = {
       'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
       'CLANG_CXX_LIBRARY' => 'libc++'
  }

  s.public_header_files = 'XAspect/*.h'
  s.source_files = 'XAspect/*.{h,m}'
  s.default_subspecs = 'Core', 'XAspectMetaprogramming'

  s.subspec 'Default' do |ss|
    ss.source_files = 'XAspect/*.{h,m}'
    ss.dependency 'XAspect/Core'
  end

  s.subspec 'Macros' do |ss|
    ss.source_files = 'XAspect/Macros/*.h'
  end  

  s.subspec 'Core' do |ss|
    ss.source_files = 'XAspect/Core/*.{h,m,mm,c,cpp}'
    ss.dependency 'XAspect/Macros'
  end

  s.subspec 'XAspectMetaprogramming' do |ss|
    ss.source_files = 'XAspect/XAspectMetaprogramming/*.{h,m,mm,c,cpp}'
    ss.dependency 'XAspect/Macros'
    ss.dependency 'XAspect/Core'
  end
  
end