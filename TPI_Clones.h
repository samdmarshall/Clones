//
//  TPI_Clones.h
//  Clones
//
//  Created by Sam Marshall on 1/7/12.
//  Copyright 2012 Sam Marshall. All rights reserved.
//

#import "TextualApplication.h"


@interface TPI_Clones : NSObject {

}

- (void)messageSentByUser:(IRCClient *)client message:(NSString *)messageString command:(NSString *)commandString;
- (NSArray *)pluginSupportsUserInputCommands;

@end
