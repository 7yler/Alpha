//
//  FLEXViewHierarchyPlugin.m
//  UICatalog
//
//  Created by Dal Rupnik on 24/11/14.
//  Copyright (c) 2014 f. All rights reserved.
//

#import "ALPHAActions.h"
#import "FLEXResources.h"

#import "ALPHAManager.h"

#import "FLEXViewHierarchyPlugin.h"

#import "FLEXViewHierarchyViewController.h"

@interface FLEXViewHierarchyPlugin () <ALPHAViewControllerDelegate>

@property (nonatomic, strong) FLEXViewHierarchyViewController* viewHierarchyViewController;

@end

@implementation FLEXViewHierarchyPlugin

- (FLEXViewHierarchyViewController *)viewHierarchyViewController
{
    if (!_viewHierarchyViewController)
    {
        _viewHierarchyViewController = [[FLEXViewHierarchyViewController alloc] init];
        _viewHierarchyViewController.delegate = self;
    }
    
    return _viewHierarchyViewController;
}

- (id)init
{
    self = [super initWithIdentifier:@"com.unifiedsense.alpha.plugin.view"];
    
    if (self)
    {
        //
        // Close action always present
        //
        
        ALPHABlockActionItem *inspectAction = [ALPHABlockActionItem itemWithIdentifier:@"com.unifiedsense.alpha.plugin.view.inspect"];
        inspectAction.title = @"Inspect";
        inspectAction.icon = [FLEXResources listIcon];
        inspectAction.actionBlock = ^(id sender)
        {
            [[ALPHAManager sharedManager] addOverlayViewController:self.viewHierarchyViewController animated:YES completion:nil];
            //[[FLEXManager sharedManager].explorerWindow addSubview:self.viewHierarchyViewController.view];
            
            //[self.viewHierarchyViewController displayHierarchyExplorer];
        };

        [self registerAction:inspectAction];
    }
    
    return self;
}

- (void)viewControllerDidFinish:(UIViewController *)viewController
{
    //
    // Close was tapped on child view controller, we should remove the view controller from children
    //
    
    [[ALPHAManager sharedManager] removeOverlayViewController:self.viewHierarchyViewController];
}

- (BOOL)shouldHandleTouchAtPoint:(CGPoint)pointInWindow
{
    return [self.viewHierarchyViewController shouldReceiveTouchAtWindowPoint:pointInWindow];
}

@end
