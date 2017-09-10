//
//  ConkyPreferencesSheetController.m
//  Manage Conky
//
//  Created by Nickolas Pylarinos on 09/09/2017.
//  Copyright © 2017 Nickolas Pylarinos. All rights reserved.
//

#import "ConkyPreferencesSheetController.h"

#include "AHLaunchCtl/AHLaunchCtl/AHLaunchJob.h"
#include <unistd.h>


@implementation ConkyPreferencesSheetController

@synthesize runConkyAtStartupCheckbox = _runConkyAtStartupCheckbox;
@synthesize conkyConfigLocationTextfield = _conkyConfigLocationTextfield;


NSString * kConkyAgentPlistLocation = @"/Library/LaunchAgents/org.npyl.conky.plist";

NSString * kConkyAgentPlistName = @"org.npyl.conky.plist";
NSString * kConkyConfigLocation = @"/Users/develnpyl/.conky";
NSString * kManageConkyPrefsPath = @"/Users/develnpyl/prefs.plist";


- (IBAction)activatePreferencesSheet:(id)sender
{
    NSString * conkyAgentPlistPath = [[NSString alloc] initWithFormat:@"%@%@%@%@", @"/Users/", NSUserName(), @"/Library/LaunchAgents/", kConkyAgentPlistName ];
    
    NSDictionary * manageConkyPreferences = nil;
    NSString * conkyConfigLocation = @"";
    
    [super activateSheet:@"ConkyPreferences"];
    
    
    /*
     *  Conky agent present?
     */
    int res = access( [conkyAgentPlistPath UTF8String], R_OK);
    if (res < 0) {
        NSLog( @"Agent plist doesnt exist or not accessible!" );
    } else {
        [_runConkyAtStartupCheckbox setState:1];
    }
    
    
    /*
     *  Conky configuration file location?
     */
    res = access( [kManageConkyPrefsPath UTF8String], R_OK);
    if (res < 0) {
        id objects[] = { kConkyConfigLocation };
        id keys[] = { @"configLocation" };
        NSUInteger count = sizeof(objects) / sizeof(id);
        
        manageConkyPreferences = [[NSDictionary alloc] initWithObjects:objects forKeys:keys count:count];
        [manageConkyPreferences writeToFile:kManageConkyPrefsPath atomically:YES];
    }
    
    manageConkyPreferences = [[NSDictionary alloc] initWithContentsOfFile:kManageConkyPrefsPath];
    
    if (!manageConkyPreferences) {
        [_conkyConfigLocationTextfield setStringValue:@"Could not open conky preferences file!"];
        return;
    }
    
    conkyConfigLocation = [manageConkyPreferences objectForKey:@"configLocation"];
    [_conkyConfigLocationTextfield setStringValue:conkyConfigLocation];
    
    
    [_conkyConfigLocationTextfield setDelegate:self];   /* Do that to allow, getting the Enter-Key notification */
}

-(void)controlTextDidEndEditing:(NSNotification *)notification
{
    // See if it was due to a return
    
    if ( [[[notification userInfo] objectForKey:@"NSTextMovement"] intValue] == NSReturnTextMovement )
    {
        NSDictionary * manageConkyPreferences = [[NSDictionary alloc] initWithContentsOfFile:kManageConkyPrefsPath];
        [manageConkyPreferences setValue:[_conkyConfigLocationTextfield stringValue] forKey:@"configLocation"];
        [manageConkyPreferences writeToFile:kManageConkyPrefsPath atomically:YES];
    }
}

- (IBAction)runConkyAtStartupCheckboxAction:(id)sender
{
    NSString * conkyAgentPlistPath = [[NSString alloc] initWithFormat:@"%@%@%@%@", @"/Users/", NSUserName(), @"/Library/LaunchAgents/", kConkyAgentPlistName ];
    
    switch ([sender state]) {
        case 0:
            NSLog( @"Request to remove the Agent!" );
            
            unlink( [conkyAgentPlistPath UTF8String] );
            
            break;
        case 1:
            NSLog( @"Request to add the Agent!" );
            
            AHLaunchJob* job = [AHLaunchJob new];
            job.Program = @"/usr/bin/conky";
            job.Label = @"org.npyl.conky";
            job.ProgramArguments = @[ @"-c", @"" ];
            job.RunAtLoad = YES;
            
            break;
        default:
    }
}

@end
