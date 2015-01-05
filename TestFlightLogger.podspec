Pod::Spec.new do |s|
  s.name         = "TestFlightLogger"
  s.version      = "0.0.4"
  s.summary      = "A CocoaLumberjack logger for TestFlight."
  s.homepage     = "https://github.com/abillingsley/TestFlightLogger"
  s.license      = 'MIT'
  s.author       = { "Alex Billingsley" => "abillingsley@dyknow.com" }
  s.source   	 = { :git => 'https://github.com/johndpope/TestFlightLogger.git', :commit => '437e3763292f4357459b7ffc271cbd33382914bb' }  	
  s.source_files = '*.{h,m}'
  s.requires_arc = true
  s.platform = :ios
  s.dependency 'CocoaLumberjack'
 # s.dependency 'TestFlightSDK'
end
