//
//  PreferencesController.m
//  Manage Conky
//
//  Created by Nickolas Pylarinos Stamatelatos on 04/10/2018.
//  Copyright © 2018 Nickolas Pylarinos. All rights reserved.
//

#import "PreferencesController.h"

@implementation PreferencesController

- (void)awakeFromNib
{
    NSNumber *logging = [[NSUserDefaults standardUserDefaults] objectForKey:@"Logging"];
    [_loggingToggle setState:logging.boolValue];
}

- (IBAction)toggleLogging:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:[sender state]] forKey:@"Logging"];
}

@end
