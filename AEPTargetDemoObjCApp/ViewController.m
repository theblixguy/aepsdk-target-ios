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
    AEPTargetPrefetchObject *prefetch1 = [[AEPTargetPrefetchObject alloc] initWithName:@"aep-loc-1" targetParameters:nil];
    AEPTargetPrefetchObject *prefetch2 = [[AEPTargetPrefetchObject alloc] initWithName:@"aep-loc-2" targetParameters:nil];
    [AEPMobileTarget prefetchContent:@[prefetch1, prefetch2] withParameters:nil callback:^(NSError * _Nullable error) {
        NSLog(@"================================================================================================");
        NSLog(@"error? >> %@", error.localizedDescription ?: @"nope");
    }];
}

- (IBAction)locationDisplayedClicked:(id)sender {
    AEPTargetOrder *order = [[AEPTargetOrder alloc] initWithId:@"id1" total:1.0 purchasedProductIds:@[@"ppId1"]];
    AEPTargetProduct *product =[[AEPTargetProduct alloc] initWithProductId:@"pId1" categoryId:@"cId1"];
    AEPTargetParameters * targetParams = [[AEPTargetParameters alloc] initWithParameters:@{@"mbox_parameter_key":@"mbox_parameter_value"} profileParameters:@{@"name":@"Smith"} order:order product:product];
    [AEPMobileTarget displayedLocations:@[@"aep-loc-1", @"aep-loc-2"] withParameters:targetParams];
}

- (IBAction)locationClicked:(id)sender {
    AEPTargetOrder *order = [[AEPTargetOrder alloc] initWithId:@"id1" total:1.0 purchasedProductIds:@[@"ppId1"]];
    AEPTargetProduct *product =[[AEPTargetProduct alloc] initWithProductId:@"pId1" categoryId:@"cId1"];
    AEPTargetParameters * targetParams = [[AEPTargetParameters alloc] initWithParameters:@{@"mbox_parameter_key":@"mbox_parameter_value"} profileParameters:@{@"name":@"Smith"} order:order product:product];
    [AEPMobileTarget clickedLocation:@"aep-loc-1" withParameters:targetParams];
}

- (IBAction)resetExperienceClicked:(id)sender {
    [AEPMobileTarget resetExperience];
}

- (IBAction)getThirdPartyClicked:(id)sender {
    [AEPMobileTarget getThirdPartyIdWithCompletion:^(NSString *thirdPartyID, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.lblThirdParty setText:thirdPartyID];
        });
    }];
}

- (IBAction)getTntIDClicked:(id)sender {
    [AEPMobileTarget getTntIdWithCompletion:^(NSString *tntID, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.lblTntId setText:tntID];
        });
    }];
}

- (IBAction)setThirdPartyClicked:(id)sender {
    if(![_textThirdPartyID.text isEqualToString:@""]) {
        [AEPMobileTarget setThirdPartyId:_textThirdPartyID.text];
    }
}

@end
