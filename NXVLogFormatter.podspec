Pod::Spec.new do |s|
  s.name         = "NXVLogFormatter"
  s.version      = "0.0.2"
  s.summary      = "Simple custom log formatter for CocoaLumberjack."
  s.description = <<-DESC
                    Because traditional NSLog() is not debug-friendly et al. NXVLogFormatter simplify that with following pattern:

                    ```
                    (Date, Time) -[FileName MethodName](line number): "LogMessage"
                    ```
                   DESC
  s.homepage     = "https://github.com/vinhnx/NXVLogFormatter"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Vinh Nguyen" => "vinhnguyen2308@gmail.com" }
  s.source       = { :git => "https://github.com/vinhnx/NXVLogFormatter.git", :tag => '0.0.2' }
  s.platform     = :ios
  s.source_files = 'NXVLogFormatter', '*.{h,m}'
  s.requires_arc = true
end
