// NXVLogFormatter.m
//
// Copyright (c) 2013 Vinh Nguyen
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NXVLogFormatter.h"

@implementation NXVLogFormatter

static NSDateFormatter *dateFormatter;

- (id)init
{
    self = [super init];

    if (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
            dateFormatter = [threadDictionary objectForKey:@"cachedDateFormatter"];
            if (dateFormatter == nil) {
                dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setLocale:[NSLocale currentLocale]];
                [dateFormatter setDateFormat: @"YYYY-MM-dd HH:mm:ss:SSS"];
                [threadDictionary setObject:dateFormatter forKey:@"cachedDateFormatter"];
            }

        });
    }

    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *dateString = [dateFormatter stringFromDate:(logMessage->timestamp)];
    int v = logMessage->logFlag;
    return [NSString stringWithFormat:@"(%@) [%@ %@][%@:%d]: %@",
            dateString,
            logMessage.fileName,
            logMessage.methodName,
            (v==LOG_FLAG_ERROR) ? @"E" : ((v==LOG_FLAG_WARN) ? @"W" : ((v==LOG_FLAG_DEBUG) ? @"D" : (v==LOG_FLAG_INFO) ? @"I" : @"V")),
            logMessage->lineNumber,
            logMessage->logMsg];
}

@end