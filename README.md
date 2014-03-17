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
  // required, setup DDLog
  [DDLog addLogger:[DDASLLogger sharedInstance]];
  [DDLog addLogger:[DDTTYLogger sharedInstance]];
  
  // use NXVLogFormatter as custom log formmater
  [[DDTTYLogger sharedInstance] setLogFormatter:[NXVLogFormatter new]];
    
  // optional, enable colors
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

## Installation ##

### Automatic ###
If you use [Cocoapods](http://cocoapods.org/), you can add `pod 'NXVLogFormatter'` to your `Podfile`. Then run `pod install` to integrate NXVLogFormatter to your project, like so:

```ruby
# somewhere in your Podfile
pod 'NXVLogFormatter'
```

then just install and open your project's workspace:

```ruby
pod install --verbose && YourProject.xcworkspace
```

### Manually ###

Just drag both `NXVLogFormatter.{h,m}` files to your project and start using it like [this](https://github.com/vinhnx/NXVLogFormatter#How).

## License ##

See LICENSE.

## Contact ##

I'm @vinhnx on almost anywhere.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/vinhnx/nxvlogformatter/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

