TestFlightLogger
================

A CocoaLumberjack logger for TestFlight

## Usage

#### AppDelegate.h

```ObjC
#import "TestFlightLogger.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [TestFlight takeOff:@"your_team_token"];
    [DDLog addLogger:[TestFlightLogger sharedInstance]];

    DDLog(@"My First Log Message to TestFlight");
}

```

## Requirements

TestFlightLogger acts as a bridge between [CocoaLumberjack](https://github.com/robbiehanson/CocoaLumberjack) and [Testflight](https://testflightapp.com/) and therefore carries a dependency on both libraries

## Installation

[CocoaPods](http://cocoapods.org/) is the recommended way to add TestFlightLogger to your project

Here's an example podfile that installs TestFlightLogger and its dependencies

### Podfile

```bash
pod 'TestFlightLogger', :git => 'https://github.com/johndpope/TestFlightLogger.git', :commit => '1a293accfbf1a164e4c397c72787cfa0a3a0ce50'
```

## License

TestFlightLogger is available under the MIT license.  See the LICENSE file for more info