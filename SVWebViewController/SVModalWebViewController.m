//
//  SVModalWebViewController.m
//
//  Created by Oliver Letterer on 13.08.11.
//  Copyright 2011 Home. All rights reserved.
//
//  https://github.com/samvermette/SVWebViewController

#import "SVModalWebViewController.h"
#import "SVWebViewController.h"

@interface SVModalWebViewController ()

@property (nonatomic, assign) SVWebViewController *webViewController;

@end


@implementation SVModalWebViewController

@synthesize barsTintColor, webViewController;

// These delegate to the ViewController
@dynamic availableActions, titleView;

#pragma mark - Initialization

- (void)dealloc {
    self.barsTintColor = nil;
    [super dealloc];
}

- (id)initWithAddress:(NSString*)urlString {
    return [self initWithURL:[NSURL URLWithString:urlString]];
}

- (id)initWithURL:(NSURL *)URL {
    self.webViewController = [[[SVWebViewController alloc] initWithURL:URL] autorelease];
    if (self = [super initWithRootViewController:self.webViewController]) {
        self.webViewController.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:webViewController action:@selector(doneButtonClicked:)] autorelease];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationBar.tintColor = self.toolbar.tintColor = self.barsTintColor;
}

- (UIView *)titleView
{
    return self.webViewController.titleView;
}

- (void)setTitleView:(UIView *)newTitleView
{
    self.webViewController.titleView = newTitleView;
}

- (SVWebViewControllerAvailableActions)availableActions
{
    return self.webViewController.availableActions;
}

- (void)setAvailableActions:(SVWebViewControllerAvailableActions)newAvailableActions {
    self.webViewController.availableActions = newAvailableActions;
}

@end
