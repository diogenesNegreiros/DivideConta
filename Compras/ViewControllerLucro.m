//
//  ViewControllerLucro.m
//  Compras
//
//  Created by mac on 07/10/15.
//  Copyright © 2015 Diogenes. All rights reserved.
//

#import "ViewControllerLucro.h"
@import GoogleMobileAds;


@interface ViewControllerLucro ()<GADInterstitialDelegate, GADBannerViewDelegate>

@property(nonatomic, strong) GADInterstitial *interstitial;
@property (strong, nonatomic) IBOutlet GADBannerView *bannerViewAds;

@end

@implementation ViewControllerLucro

@synthesize ValorPagoCompra,FieldDisplay, QuantidadeCompra,UnidadeVenda, activeField, scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Inicialização personalizada
    }
    return self;
}
 GADRequest* requestInters;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    //    //TEMPORIZADOR DE 5 SEG
    //    [NSTimer scheduledTimerWithTimeInterval:5.0
    //                                     target:self
    //                                   selector:@selector(showInterstitial)
    //                                   userInfo:nil
    //                                    repeats:YES];
    
    self.interstitial.delegate = self;
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-7764785023267812/4686274847"];
     [self.interstitial loadRequest:requestInters]; // faz a requisição do anuncio interstitial
    
    // Request test ads on devices you specify. Your test device ID is printed to the console when
    // an ad request is made.
    //    request.testDevices = @[ kGADSimulatorID, @"33BE2250B43518CCDA7DE426D04EE232"];
   
    
    //    [self createAndLoadInterstitial];
    
    
   
    self.bannerViewAds.adUnitID = @"ca-app-pub-7764785023267812/8114383968";
    self.bannerViewAds.delegate = self;
    [self showBanner:self.bannerViewAds];
    
    
    
    // Do any additional setup after loading the view.
    
    _titleItem.title = NSLocalizedString(@"Men_val_l", nil);
    
    [self.scrollView setContentSize:(CGSizeMake(320, 480))];
    
    [self registerForKeyboardNotifications];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self  action:@selector(doneWithNumberPad)]];
    
    [numberToolbar sizeToFit];
    
    
    ValorPagoCompra.inputAccessoryView = numberToolbar;
    QuantidadeCompra.inputAccessoryView = numberToolbar;
    UnidadeVenda.inputAccessoryView = numberToolbar;
    
    
}


-(void)doneWithNumberPad{
    
    [ValorPagoCompra resignFirstResponder];
    [QuantidadeCompra resignFirstResponder];
    [ UnidadeVenda resignFirstResponder];
    [self CalcLucro];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//- (void)createAndLoadInterstitial {
//    self.interstitial =
//    [[DFPInterstitial alloc] initWithAdUnitID:@"ca-app-pub-7764785023267812/4686274847"];
//
//    //ca-app-pub-7764785023267812/4686274847
//
//    GADRequest *request = [GADRequest request];
//    // Request test ads on devices you specify. Your test device ID is printed to the console when
//    // an ad request is made.
//    request.testDevices = @[ kGADSimulatorID, @"2077ef9a63d2b398840261c8221a0c9a" ];
//    [self.interstitial loadRequest:request];
//}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - soluçao da Apple

// Chame esse método em algum lugar a seu gosto no código de configuração do controlador.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Chamado quando o UIKeyboardDidShowNotification é enviado.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // Se o campo de texto ativo está oculto pelo teclado, desloque-lo para ser visível
    // Seu aplicativo pode não precisar ou querer esse comportamento.
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:activeField.frame animated:YES];
    }
}

// Chamado quando o UIKeyboardWillHideNotification é enviado
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
}

- (IBAction)apagaTudo{
    [self apagarTextField:UnidadeVenda];
    [self apagarTextField:QuantidadeCompra];
    [self apagarTextField:ValorPagoCompra];
    [self apagarTextView:FieldDisplay];
    [self showInterstitial:_interstitial request:requestInters];
    
}

- (IBAction)testarNumero:(UITextField *)sender {
    [self testarNumeroDecimal:sender];
}

- (IBAction)testarInteiro:(UITextField *)sender {
    [self testarNumeroInteiro:sender];
}


- (IBAction)CalcLucro{
    if ((![UnidadeVenda.text isEqual: @""])&&(![QuantidadeCompra.text isEqual: @""])&& (![ValorPagoCompra.text isEqual: @""])){
        
        FieldDisplay.text= [self calcularLucro:ValorPagoCompra quantidade:QuantidadeCompra unidadeVenda:UnidadeVenda];
    }
    
    
    
}


#pragma mark UIAlertViewDelegate implementation

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:self];
    } else {
        NSLog(@"Ad wasn't ready");
    }
    
}

#pragma mark dealloc

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationDidEnterBackgroundNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationDidBecomeActiveNotification
                                                  object:nil];
}


@end

