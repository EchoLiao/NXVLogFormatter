# [NXVLogFormatter](http://vinhnx.github.io/NXVLogFormatter/) #
[![Build Status](https://travis-ci.org/vinhnx/NXVLogFormatter.png)](https://travis-ci.org/vinhnx/NXVLogFormatter)


Simple custom log formatter for the awesome [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack).

It logs output with following pattern:

```bash
(Date, Time) -[FileName MethodName](line number): "LogMessage"
```

## Why? ##

Because traditional NSLog() is not debug-friendly et al

## How ##

## Use NXVLogFormatter in Your Project ##

Just drag the `NXVLogFormatter` folder to your Xcode project windows. And in your AppDelegate, import `NXVLogFormatter.h`; like [this](https://github.com/vinhnx/NXVLogFormatter#how).

Then, just add couple lines of code and you are up and running

```objC

// first, you need to import CocoaLumberjack files
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "DDASLLogger.h"

// then, you could also add NXVLogFormatter whenever you need it 
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

Here is what it looks like with [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack)'s built-in [color](https://github.com/CocoaLumberjack/CocoaLumberjack/wiki/XcodeColors) mode in Xcode Console.
![screenshot](https://raw.github.com/vinhnx/NXVLogFormatter/master/screenshot/NXVLogFormatter-ss.png)

## Running the Example Project ##

### CocoaPods ###

If you use [CocoaPods](http://cocoapods.org/),  simply run `pod install` to install [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack) dependency into sample workspace.

```bash
$ pod install
```

Then, you can open the workspace and run it

```bash
$ open NXVLogFormatterSample.xcworkspace
```

## License ##

See LICENSE.

## Contact ##

I'm @vinhnx on almost anywhere.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/vinhnx/nxvlogformatter/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

