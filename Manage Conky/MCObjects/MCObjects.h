//
//  MCObjects.h
//  Manage Conky
//
//  Created by npyl on 13/04/2018.
//  Copyright © 2018 Nickolas Pylarinos. All rights reserved.
//

#ifndef MCObjects_h
#define MCObjects_h

#import <Cocoa/Cocoa.h>

/* defines */
#define MC_PID_NOT_SET (-100)   /* pid not yet set */

/**
 * MCWidget
 *
 * A ManageConky Widget representation.  Pretty simple, I know.
 */
@interface MCWidget : NSObject

@property pid_t pid;
@property NSString *itemPath;

+ (instancetype)widgetWithPid:(pid_t)pid andPath:(NSString *)path;
@end

/**
 * MCTheme
 *
 * A core-representation of a ManageConky Theme.
 * Full backwards compatibility with conky-manager Themes (.cmtheme).
 */
@interface MCTheme : NSObject

@property NSString *themeName;  /* theme name */
@property NSString *themeRC;    /* resource file (.plist or .cmtheme) */
@property NSInteger startupDelay;   /* startup delay */
@property NSArray *conkyConfigs;    /* conky configs */
@property NSArray *arguments;   /* arguments for conky */
@property NSString *wallpaper;  /* wallpaper used by theme */

@property NSString *creator;    /* creator of theme */
@property NSString *source;     /* source of theme */

@property BOOL isEnabled;    /* a LaunchAgent for it exists */

+ (instancetype)themeWithResourceFile:(NSString *)themeRC
                         conkyConfigs:(NSArray *)configs
                            arguments:(NSArray *)args
                         startupDelay:(NSInteger)startupDelay
                            wallpaper:(NSString *)wallpaper
                              creator:(NSString *)creator
                            andSource:(NSString *)source;

+ (instancetype)themeRepresentationForThemeRC:(NSString *)themeRC;

/**
 * Applies a theme to computer by:
 *  - applying conky config
 *  - applying wallpaper
 *
 * supports two types of themes:
 *  - original conky-manager themes (plain files with minimal info) (backwards compatibility)
 *  - plist based (support many parameters/features in a native macOS way)
 */
- (void)applyTheme;
@end

#endif /* MCObjects_h */
