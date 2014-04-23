//
//  KPBlurEffectViewController.m
//  KPBlurEffect
//
//  Created by Kiran Patel on 23/04/14.
//  https://github.com/KiranPatel-iOS

#import "KPBlurEffectViewController.h"
#import "UIImage+ImageEffects.h"

typedef enum{
    KPBlurEffectNormal =1,
    KPBlurEffectLight,
    KPBlurEffectExtraLight,
    KPBlurEffectDark,
    KPBlurEffectTintColor,
}KPBlurEffectType;

#define IMG_TO_BLUR @"img_kp"

@interface KPBlurEffectViewController ()
{
    UIImage              * imgKP;
    IBOutlet UIImageView * IBimgViewKP;
}
@end

@implementation KPBlurEffectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    imgKP = [UIImage imageNamed:IMG_TO_BLUR];
    [self updateBlurEffect:KPBlurEffectNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Action Event

-(IBAction)IBbtnChangeBlurEffect:(UIButton *)sender{
    [self updateBlurEffect:(int)sender.tag];
}

#pragma mark - Blurr Effect Event

-(void)updateBlurEffect: (int)index{
    switch (index) {
        case KPBlurEffectNormal:
            IBimgViewKP.image=imgKP;
            break;
        case KPBlurEffectLight:
            IBimgViewKP.image=[imgKP applyLightEffect];
            break;
        case KPBlurEffectExtraLight:
           IBimgViewKP.image=[imgKP applyExtraLightEffect];
            break;
        case KPBlurEffectDark:
            IBimgViewKP.image=[imgKP applyDarkEffect];
            break;
        case KPBlurEffectTintColor:
            IBimgViewKP.image=[imgKP applyTintEffectWithColor:[UIColor grayColor]];
            break;
        default:
            break;
    }
}

@end
