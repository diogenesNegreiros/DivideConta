//
//  ViewControllerVenda.m
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 26/01/17.
//  Copyright © 2017 Diogenes. All rights reserved.
//

#import "ViewControllerVenda.h"
@import GoogleMobileAds;

@interface ViewControllerVenda ()<GADInterstitialDelegate, GADBannerViewDelegate>

@property(nonatomic, strong) GADInterstitial *interstitial;
@property(nonatomic, strong)IBOutlet GADBannerView *bannerView;
@end

@implementation ViewControllerVenda

@synthesize ValorPagoCompra,FieldDisplay, QuantidadeCompra,LucroDesejado,PercentDeLucro, activeField, scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Inicialização personalizada
    }
    return self;
}

 GADRequest* requestIntersVenda;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    
    
    
   
    self.interstitial.delegate = self;
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-XXXXXXXXXXXXXXXXXXXXXXXXXXX"];
    [self.interstitial loadRequest:requestIntersVenda]; // faz a requisição do anuncio interstitial
    

    self.bannerView.adUnitID = @"ca-app-pub-XXXXXXXXXXXXXXXXXXXXXXXXXXX";
     self.bannerView.delegate = self;
    [self showBanner:self.bannerView];
    
    
    
//    // Instantiate the banner view with your desired banner size.
//    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
//    self.bannerView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:self.bannerView];
//    [self positionBannerViewAtBottomOfSafeArea:self.bannerView];
    
   
    
    _titleItem.title = NSLocalizedString(@"Men_val_v", nil);
    
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
    
    LucroDesejado.inputAccessoryView = numberToolbar;
    
}




-(void)doneWithNumberPad{
    
    [ValorPagoCompra resignFirstResponder];
    [QuantidadeCompra resignFirstResponder];
    
    [ LucroDesejado resignFirstResponder];
    [self CalcValorVenda];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
  
    [self apagarTextField:QuantidadeCompra];
    [self apagarTextField:ValorPagoCompra];
    [self apagarTextView:FieldDisplay];
    [self apagarTextField:LucroDesejado];
    [self apagarTextField:PercentDeLucro];
    [self showInterstitial:_interstitial request:requestIntersVenda]; //método da classe TelaDeCalculo
}

//- (IBAction)autoDigitaLucroDesejado{
//    NSString* texto;
//    double lucroPretendido = [ValorPagoCompra.text doubleValue]* ([PercentDeLucro.text doubleValue]/10);
//    texto = [[NSString alloc]initWithFormat:@"%2.f",lucroPretendido];
//    PercentDeLucro.text= texto;
//    LucroDesejado.text=texto;
//}


- (IBAction)autoDigitaPercentDesejado{
    if ((![ValorPagoCompra.text isEqual: @""])&&(![LucroDesejado.text isEqual: @""])){
        
    
    NSString*texto;
    NSNumber *PorcentagemLucro = [[NSNumber alloc]initWithDouble: [LucroDesejado.text doubleValue]/[ValorPagoCompra.text doubleValue]*100];
    texto = [[NSString alloc]initWithFormat:@"%@%@",PorcentagemLucro,@" %"];
    PercentDeLucro.text= texto;
    }
}

- (IBAction)testarNumero:(UITextField *)sender {
    [self testarNumeroDecimal:sender];
}
    
- (IBAction)testarInteiro:(UITextField *)sender {
    [self testarNumeroInteiro:sender];
}



- (IBAction)CalcValorVenda{
    if ((![QuantidadeCompra.text isEqual: @""])&& (![ValorPagoCompra.text isEqual: @""])&&(![LucroDesejado.text isEqual: @""])&&(![PercentDeLucro.text isEqual: @""])){
        FieldDisplay.text= [self calcularValorDeVenda:ValorPagoCompra quantidade:QuantidadeCompra lucroDesejado:LucroDesejado];
    }
}


-(void)positionBannerViewAtBottomOfSafeArea:(UIView *_Nonnull)bannerView {
    if (@available(ios 9.0, *)) {
        [self positionBannerViewAtBottomOfSafeAreaiOS9Plus:bannerView];
    } else {
        [self positionBannerViewAtBottomOfSafeAreaPreiOS9:bannerView];
    }
}- (void)positionBannerViewAtBottomOfSafeAreaiOS9Plus:(UIView *_Nonnull)bannerView NS_AVAILABLE_IOS(9.0) {
    // Position the banner. Stick it to the bottom of the safe area.
    // Centered horizontally.
    NSLayoutXAxisAnchor *centerXAnchor;
    NSLayoutYAxisAnchor *bottomAnchor;
    
    if (@available(ios 11.0, *)) {
        UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
        centerXAnchor = guide.centerXAnchor;
        bottomAnchor = guide.bottomAnchor;
    } else {
        centerXAnchor = self.view.centerXAnchor;
        bottomAnchor = self.bottomLayoutGuide.topAnchor;
    }
    
    [NSLayoutConstraint activateConstraints:@[
                                              [bannerView.centerXAnchor constraintEqualToAnchor:centerXAnchor],
                                              [bannerView.bottomAnchor constraintEqualToAnchor:bottomAnchor]
                                              ]];
}

- (void)positionBannerViewAtBottomOfSafeAreaPreiOS9:(UIView *_Nonnull)bannerView {
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bannerView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bannerView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.bottomLayoutGuide
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0]];
}
@end
