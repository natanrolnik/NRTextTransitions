//
//  ViewController.m
//  NRTextTransitionsExample
//
//  Created by Natan Rolnik on 2/26/14.
//
//

#import "ViewController.h"
#import "UIView+NRTextTransitions.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
{
    IBOutlet UILabel *standardAPILabel;
    IBOutlet UILabel *exampleLabel;
    IBOutlet UIButton *animateAgainButton;
}

-(IBAction)animateAgain:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    exampleLabel.layer.cornerRadius = 5;
    standardAPILabel.layer.cornerRadius = 5;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self animateLabelsWithDelay:2];
}

-(void)animateAgain:(id)sender
{
    [self animateLabelsWithDelay:0.5];
}

- (void)animateLabelsWithDelay:(NSTimeInterval)theDelay
{
    [animateAgainButton setEnabled:NO];

    exampleLabel.text = @"I'm the old text!";
    exampleLabel.backgroundColor = [UIColor whiteColor];
    
    standardAPILabel.text = @"UIView animateWithDuration API won't work";
    standardAPILabel.backgroundColor = [UIColor whiteColor];
    
    NSTimeInterval theDuration = 0.75;
    
    //using NRTextTransitions methods, it works!
    [UIView animateTextTransitionForObjects:@[exampleLabel] withDuration:theDuration delay:theDelay animations:^{
        exampleLabel.text = @"And I'm animated!";
    } completion:^{
        
        //Completed NRTextTransition animations, change the background color to "show" completion in UI
        exampleLabel.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
        [animateAgainButton setEnabled:YES];
    }];

    //standard +[UIView animateWithDuration...] methods only works for animatable
    //properties. text, font and textColor aren't animatable.
    [UIView animateWithDuration:theDuration delay:theDelay options:UIViewAnimationOptionCurveEaseInOut animations:^{
        standardAPILabel.text = @"And it indeed doesn't animate";
    } completion:^(BOOL finished) {

        //Completed NRTextTransition animations, change the background color to "show" completion in UI
        standardAPILabel.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    }];
}

@end
