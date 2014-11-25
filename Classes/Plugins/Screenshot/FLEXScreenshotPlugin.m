//
//  FLEXScreenshotPlugin.m
//  UICatalog
//
//  Created by Dal Rupnik on 25/11/14.
//  Copyright (c) 2014 f. All rights reserved.
//

#import <Haystack/Haystack.h>

#import "FLEXWindow.h"
#import "FLEXResources.h"
#import "FLEXFileManager.h"
#import "FLEXMenuItem.h"

#import "FLEXScreenshotPlugin.h"

@interface FLEXScreenshotPlugin ()

@end

@implementation FLEXScreenshotPlugin

- (id)init
{
    self = [super initWithIdentifier:@"com.flex.plugin.screenshot"];
    
    if (self)
    {
        FLEXActionItem *touchAction = [FLEXActionItem itemWithIdentifier:@"com.flex.plugin.screenshot.make"];
        touchAction.title = @"Screenshot";
        touchAction.icon = [FLEXResources dragHandle];
        touchAction.action = ^(id sender)
        {
            [self saveScreenshot];
        };
        
        [self registerAction:touchAction];
        
        FLEXMenuItem* menuAction = [FLEXMenuItem itemWithIdentifier:@"com.flex.plugin.screenshot.main"];
        menuAction.icon = @"📱";
        menuAction.title = @"Screenshots";
        menuAction.viewControllerClass = @"FLEXScreenshotTableViewController";
        
        [self registerAction:menuAction];
    }
    
    return self;
}

- (void)saveScreenshot
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    
    NSMutableArray *excludedWindows = [NSMutableArray array];
    
    for (UIWindow *window in windows)
    {
        if ([window isKindOfClass:[FLEXWindow class]])
        {
            [excludedWindows addObject:window];
        }
    }
    
    UIImage *screenshot = [[UIApplication sharedApplication] screenshotExcludingWindows:excludedWindows ];
    
    [self saveImage:screenshot];
}

- (void)saveImage:(UIImage *)image
{
    NSData *imageData = UIImagePNGRepresentation(image);
    
    NSString *directory = [NSString stringWithFormat:@"%@FLEX/Screenshots", [[FLEXFileManager sharedManager] documentsDirectory].absoluteString];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", directory, [self stringForFile]];
    
    NSURL *fileURL = [NSURL URLWithString:filePath];
    
    BOOL isDir;
    BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:directory isDirectory:&isDir];
    
    if (!exists || !isDir)
    {
        NSError *error;
        
        [[NSFileManager defaultManager] createDirectoryAtURL:[NSURL URLWithString:directory] withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSError* error;
        [imageData writeToURL:fileURL options:NSDataWritingAtomic error:&error];
    }
}

- (NSString *)stringForFile
{
    return [NSString stringWithFormat:@"FLEX_SS_%@.png", [[FLEXFileManager sharedManager].fileDateFormatter stringFromDate:[NSDate date]]];
}

@end
