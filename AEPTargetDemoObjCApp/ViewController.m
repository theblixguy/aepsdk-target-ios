//
//  ViewController.m
//  AEPTargetDemoObjCApp
//
//  Created by ravjain on 3/11/21.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblThirdParty;
@property (weak, nonatomic) IBOutlet UILabel *lblTntId;
@property (weak, nonatomic) IBOutlet UITextField *textThirdPartyID;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)prefetchClicked:(id)sender {

}

- (IBAction)locationDisplayedClicked:(id)sender {
    
}

- (IBAction)locationClicked:(id)sender {
    
}

- (IBAction)resetExperienceClicked:(id)sender {
    [AEPMobileTarget resetExperience];
}

- (IBAction)getThirdPartyClicked:(id)sender {
    [AEPMobileTarget getThirdPartyIdWithCompletion:^(NSString *thirdPartyID, NSError *error){
        [self.lblThirdParty setText:thirdPartyID];
    }];
}

- (IBAction)getTntIDClicked:(id)sender {
    [AEPMobileTarget getTntIdWithCompletion:^(NSString *tntID, NSError *error){
        [self.lblTntId setText:tntID];
    }];
}

- (IBAction)setThirdPartyClicked:(id)sender {
    if(![_textThirdPartyID.text isEqualToString:@""]) {
        [AEPMobileTarget setThirdPartyId:_textThirdPartyID.text];
    }
}

@end
