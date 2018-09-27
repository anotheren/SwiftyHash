Pod::Spec.new do |s|

  s.name         = "SwiftyHash"
  s.version      = "1.0"
  s.summary      = "A Swifty wrapper for CommonCrypto"
  s.homepage     = "https://github.com/anotheren/SwiftyHash"
  s.license      = { :type => "MIT" }
  s.author       = { "liudong" => "liudong.edward@qq.com" }
  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/anotheren/SwiftyHash.git",
                     :tag => s.version }
  s.source_files = "Source/*.swift"

end
