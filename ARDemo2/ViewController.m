//
//  ViewController.m
//  ARDemo2
//
//  Created by 薛飞龙 on 2017/6/10.
//  Copyright © 2017年 薛飞龙. All rights reserved.
//

#import "ViewController.h"
#import "Scene.h"

@interface ViewController () <ARSKViewDelegate>

@property (nonatomic, strong) IBOutlet ARSKView *sceneView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the view's delegate
    self.sceneView.delegate = self;
    
    self.sceneView.backgroundColor = [UIColor colorNamed:@"红色"];
    // Show statistics such as fps and node count
    self.sceneView.showsFPS = YES;
    self.sceneView.showsNodeCount = YES;
    
    // Load the SKScene from 'Scene.sks'
    Scene *scene = (Scene *)[SKScene nodeWithFileNamed:@"Scene"];
    
    // Present the scene
    [self.sceneView presentScene:scene];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingSessionConfiguration *configuration = [ARWorldTrackingSessionConfiguration new];
    
    // Run the view's session
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.sceneView.session pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - ARSKViewDelegate

- (SKNode *)view:(ARSKView *)view nodeForAnchor:(ARAnchor *)anchor {
    // Create and configure a node for the anchor added to the view's session.
    NSArray  * array = @[@"😄",@"😆",@"😜",@"🤡"];
    
    NSString * string = array[arc4random_uniform(array.count)];
    
    SKLabelNode *labelNode = [SKLabelNode labelNodeWithText:string];
    labelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    labelNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    return labelNode;
}

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}

@end
