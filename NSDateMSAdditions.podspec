Pod::Spec.new do |s|
  s.name             = "NSDateMSAdditions"
  s.version          = "0.1.0"
  s.summary          = "Additions to the NSDate class"
  s.homepage         = "https://github.com/messeb/NSDateMSAdditions"
  s.license          = 'MIT'
  s.author           = { "messeb" => "sebastian@messeb.com" }
  s.source           = { :git => "https://github.com/messeb/NSDateMSAdditions.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'

  s.source_files = 'Pod/Classes/NSDateMSAdditions.swift'
end
