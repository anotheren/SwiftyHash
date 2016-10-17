Pod::Spec.new do |s|

  s.name         = "SwiftyHash"
  s.version      = "0.3.0"
  s.summary      = "A Swifty wrapper for CommonCrypto"
  s.homepage     = "https://github.com/anotheren/SwiftyHash"
  s.license      = { :type => "MIT" }
  s.author       = { "liudong" => "liudong.edward@qq.com" }
  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/anotheren/SwiftyHash.git",
                     :tag => s.version }
  s.source_files = "Source/*.swift"
  s.xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/SwiftyHash/CommonCrypto' }
  s.preserve_paths = "CommonCrypto/module.modulemap"

end
