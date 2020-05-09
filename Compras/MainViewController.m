//
//  ViewController.m
//  SidebarDemo
//
//  Created by Simon on 28/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
@import GoogleMobileAds;

@interface MainViewController ()<GADInterstitialDelegate>

@property ( strong, nonatomic) IBOutlet GADBannerView *bannerView;
@property(nonatomic, strong) GADInterstitial *interstitial;
@end

@implementation MainViewController
GADRequest *request;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //TEMPORIZADOR DE 5 SEG
    [NSTimer scheduledTimerWithTimeInterval:30
                                     target:self
                                   selector:@selector(showInterstitial)
                                   userInfo:nil
                                    repeats:YES];
    
    
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-XXXXXXXXXXXXXXXXXXXXXXXXXXXX"];
    self.interstitial.delegate = self;
   
     [self.interstitial loadRequest:request];
    
    // Request test ads on devices you specify. Your test device ID is printed to the console when
    // an ad request is made.
    //    request.testDevices = @[ kGADSimulatorID, @"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"];
   
    
    // Replace this ad unit ID with your own ad unit ID.
    self.bannerView.adUnitID = @"ca-app-pub-XXXXXXXXXXXXXXXXXXXXXXXX";
    self.bannerView.rootViewController = self;
    GADRequest *banRequest = [GADRequest request];
    [self.bannerView loadRequest:banRequest];
    
    _itemTitle.title = NSLocalizedString(@"Sob_tit", nil);
    _textoSobre.text = NSLocalizedString(@"Sob_app", nil);
    
    
    self.title = NSLocalizedString(@"Sob_tit", nil);
    
    SWRevealViewController   *revealViewController   =   self . revealViewController ;
    if   (   revealViewController   )
    {
        [ self . sidebarButton  setTarget : self . revealViewController ] ;
        [ self . sidebarButton  setAction :   @selector (  revealToggle :   ) ] ;
        [ self . view  addGestureRecognizer :self . revealViewController . panGestureRecognizer ] ;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showInterstitial{
    
    NSLog(@"MainControle Temporizador disparou adMob interstitial!");
    
    if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:self];
    }else {
        NSLog(@"AdMob não disparou interstitial!");
    }
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-XXXXXXXXXXXXXXXXXXXXXXXXXXXX"];
    [self.interstitial loadRequest:request];
}

@end

