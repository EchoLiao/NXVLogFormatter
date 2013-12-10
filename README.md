NXVLogFormatter
===============

Simple custom log formatter for CocoaLumberjack.

Check out the sample project for more info.

## Usage ##

```objC

#import "DDLog.h"
#import "DDTTYLogger.h"
#import "DDASLLogger.h"

#import "NXVLogFormatter.h"

// setup logger
- (void)initializeLogger
{

  [DDLog addLogger:[DDASLLogger sharedInstance]];
  [DDLog addLogger:[DDTTYLogger sharedInstance]];
  
  // use NXVLogFormatter as custom log formmater
  [[DDTTYLogger sharedInstance] setLogFormatter:[NXVLogFormatter new]];
    
  // enable colors
  [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
}


// then in application:didFinishLaunchingWithOptions:, just bind 
// that log method to it
- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  // initialize it
  [self initializeLogger];
  
  // ...

  return YES;
}
```

## Screenshot ##

Here is what it looks like with CocoaLumberjack built-in [color enable](https://github.com/CocoaLumberjack/CocoaLumberjack/wiki/XcodeColors) in XCode Console.
![screenshot](https://raw.github.com/vinhnx/NXVLogFormatter/master/screenshot/NXVLogFormatter-ss.png)

## Running the Example Project ##

### CocoaPods ###

If you use [CocoaPods](http://cocoapods.org/),  simply run `pod install` to install [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack) dependency into sample workspace.

`$ pod install`

Then, you can open the workspace and run it

`$ open NXVLogFormatter.xcworkspace`
