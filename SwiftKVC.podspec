Pod::Spec.new do |s|
    s.name         = "SwiftKVC"
    s.version      = "3.0.0"
    s.summary      = "Key-Value Coding (KVC) for native Swift classes and structs"
    s.description  = <<-DESC
                        SwiftKVC enables Key-Value Coding (KVC) for native Swift classes and structs.
                        DESC
    s.homepage     = "https://github.com/bradhilton/SwiftKVC"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { "Brad Hilton" => "brad@skyvive.com" }
    s.source       = { :git => "https://github.com/bradhilton/SwiftKVC.git", :tag => "3.0.0" }
    s.ios.deployment_target = "8.0"
    s.osx.deployment_target = "10.9"
    s.source_files  = "SwiftKVC", "SwiftKVC/**/*.{swift,h,m}"
    s.requires_arc = true
    s.dependency 'Reflection', '~> 0.14.3'
end
