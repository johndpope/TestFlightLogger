//
//  TestFlightLogger.m
//  TestFlightLogger
//
//  Created by Alex Billingsley on 10/28/12.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
//  to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of
//  the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
//  THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import "TestFlightLogger.h"
#import "TestFlight.h"

#if !__has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

@interface TestFlightLogger ()

@property (nonatomic, assign) BOOL running;

@end


@implementation TestFlightLogger

+ (TestFlightLogger *)sharedInstance {
    static TestFlightLogger *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TestFlightLogger alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        [TestFlight setOptions:@{ TFOptionLogToConsole: @NO }];
        [TestFlight setOptions:@{ TFOptionLogToSTDERR:  @NO }];
    }
    return self;
}

- (void)start {
    if (self.running) {
        return;
    }
    //  LoggerStart(NULL);
    self.running = YES;
}

- (void)stop {
    if (!self.running) {
        return;
    }
    // LoggerStop(NULL);
    self.running = NO;
}

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logMsg = (self.logFormatter ? [self.logFormatter formatLogMessage:logMessage] : logMessage->_message);
    
    
    if (self.logFormatter) {
        // formatting is supported but not encouraged!
        if (logMsg) {
            logMsg = [self.logFormatter formatLogMessage:logMessage];
            TFLog(@"%@", logMsg);
        }
    }
    
    if (logMsg) {
        //        int nsloggerLogLevel;
        //        switch (logMessage.flag) {
        //                // NSLogger log levels start a 0, the bigger the number,
        //                // the more specific / detailed the trace is meant to be
        //            case LOG_FLAG_ERROR: nsloggerLogLevel = 0; break;
        //
        //            case LOG_FLAG_WARN: nsloggerLogLevel  = 1; break;
        //
        //            case LOG_FLAG_INFO: nsloggerLogLevel  = 2; break;
        //
        //            default: nsloggerLogLevel             = 3; break;
        //        }
        //
        /*LogMessageF(logMessage->file, logMessage->lineNumber, logMessage->function, [logMessage fileName],
         nsloggerLogLevel, @"%@", logMsg);*/
        //TFLog(@"%@", logMsg);
    }
}

- (NSString *)loggerName {
    return @"cocoa.lumberjack.testflightlogger";
}

@end
