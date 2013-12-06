//
//  Logging.h
//  NXVLogFormatterSample
//
//  Created by Vinh Nguyen on 6/12/13.
//  Copyright (c) 2013 Vinh Nguyen. All rights reserved.
//

#import "NXVLogFormatter.h"
#import "DDLog.h"
#import <CocoaLumberjack/DDTTYLogger.h>

#if DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_WARN;
#endif

#define NSLog DDLogInfo
