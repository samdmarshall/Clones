//
//  TPI_Clones.m
//  Clones
//
//  Created by Sam Marshall on 1/7/12.
//  Copyright 2012 Sam Marshall. All rights reserved.
//

#import "TPI_Clones.h"


@implementation TPI_Clones

- (void)messageSentByUser:(IRCClient *)client message:(NSString *)messageString command:(NSString *)commandString {
	if ([commandString isEqualToString:@"CLONES"]) {
		if ([[client.world selectedChannel] isChannel] == YES) {
			NSMutableArray *members = [client.world selectedChannel].members;
			NSMutableArray *list_clones = [[[NSMutableArray alloc] init] autorelease];
			for (IRCUser *user in members) {
				NSArray *clones = [members copy];
				NSPredicate *predicate = [NSPredicate predicateWithFormat:@"address == %@",user.address];
				clones = [clones filteredArrayUsingPredicate:predicate];
				if ([clones count] > 1) {
					[list_clones addObject:user];
				}
			}
			if ([list_clones count] > 0) {
				NSString *print_line = [NSString stringWithFormat:@"Found %i Clones on %@", [list_clones count], [client.world selectedChannel].config.name];
				[client printDebugInformation:print_line];
				for (IRCUser *clone_user in list_clones) {
					print_line = [NSString stringWithFormat:@"%@!%@@%@",clone_user.nick,clone_user.username,clone_user.address];
					[client printDebugInformation:print_line];
				}
			}
		}
	}
}

- (NSArray *)pluginSupportsUserInputCommands {
	return [NSArray arrayWithObjects:@"clones",nil];
}

@end
