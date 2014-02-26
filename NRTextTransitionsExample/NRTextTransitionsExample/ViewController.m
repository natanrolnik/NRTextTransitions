//
//  ViewController.m
//  NRTextTransitionsExample
//
//  Created by Natan Rolnik on 2/26/14.
//
//

#import "ViewController.h"
#import "UIView+NRTextTransitions.h"

@interface ViewController ()
{
    IBOutlet UILabel *standardAPILabel;
    IBOutlet UILabel *testLabel;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSTimeInterval theDuration = 0.5;
    NSTimeInterval theDelay = 3.0;
    
    [UIView animateTextTransitionForObjects:@[testLabel] withDuration:theDuration delay:theDelay animations:^{
        testLabel.text = @"And I'm animated!";
    } completion:^{
        NSLog(@"Completed NRTextTransition animations");
        testLabel.backgroundColor = [UIColor lightGrayColor];
    }];
    
    [UIView animateWithDuration:theDuration delay:theDelay options:UIViewAnimationOptionCurveEaseInOut animations:^{
        standardAPILabel.text = @"And it indeed doesn't animate";
    } completion:^(BOOL finished) {
        NSLog(@"Completed UIView changes");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
