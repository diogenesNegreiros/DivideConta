//
//  ViewControllerRepartirConta.m
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 06/03/16.
//  Copyright © 2016 Diogenes. All rights reserved.
//

#import "ViewControllerRepartirConta.h"
#import "SWRevealViewController.h"
@import GoogleMobileAds;


@interface ViewControllerRepartirConta ()<GADInterstitialDelegate, GADBannerViewDelegate>

@property (strong, nonatomic) IBOutlet GADBannerView *banner;
@property(nonatomic, strong) GADInterstitial *interstitial;
@end

@implementation ViewControllerRepartirConta

@synthesize display,quantPessoas,totalConta,artistico,garcom,individual,scrollView,activeField,descricaoConta,percentGarcon ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Inicialização personalizada
    }
    return self;
}

GADRequest* requestIntersDiv;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TEMPORIZADOR DE 5 SEG
    [NSTimer scheduledTimerWithTimeInterval:60
                                     target:self
                                   selector:@selector(showInterstitial)
                                   userInfo:nil
                                    repeats:YES];
    

    // Do any additional setup after loading the view.
    
    self.interstitial.delegate = self;
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-7764785023267812/2942272700"];
    [self.interstitial loadRequest:requestIntersDiv]; // faz a requisição do anuncio interstitial
    
    
    self.banner.adUnitID = @"ca-app-pub-7764785023267812/4698331213";
    self.banner.delegate = self;
    [self showBanner:self.banner];
    
   
    _titleItem.title = NSLocalizedString(@"Men_div", nil);
    
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
    
    UIToolbar* numberToolbarSimple = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    
    UIImage *somar = [UIImage imageNamed:@"soma32x32.png"];
    UIImage *igual = [UIImage imageNamed:@"igual32x32.png"];
    
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithImage:somar style:UIBarButtonItemStylePlain target:nil action:@selector(BotaoSomar:)],[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithImage:igual style:UIBarButtonItemStylePlain target:nil action:@selector(BotaoIgual:)],[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self  action:@selector(doneWithNumberPad)]];
    
     numberToolbarSimple.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self  action:@selector(doneWithNumberPad)]];
    
    [numberToolbarSimple sizeToFit];
    [numberToolbar sizeToFit];
   
    quantPessoas.inputAccessoryView = numberToolbarSimple;
    totalConta.inputAccessoryView = numberToolbar;
    artistico.inputAccessoryView = numberToolbarSimple;
    individual.inputAccessoryView = numberToolbarSimple;
    percentGarcon.inputAccessoryView = numberToolbarSimple;
    
    
    
}


-(void)doneWithNumberPad{
    
    [quantPessoas resignFirstResponder];
    [totalConta resignFirstResponder];
    [ artistico resignFirstResponder];
    [ individual resignFirstResponder];
    [percentGarcon resignFirstResponder];
    [self CalcularConta];
}

// called when click on the retun button.
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


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

- (IBAction)apagaTudo {
    [self apagarTextView:display];
    [self apagarTextField:quantPessoas];
    [self apagarTextField:totalConta];
    [self apagarTextField:artistico];
    [self apagarTextField:individual];
    [self apagarTextView:descricaoConta];
    [self apagarTextField:percentGarcon];
   [self showInterstitial:_interstitial request:requestIntersDiv];
    
   
}



- (IBAction)CalcularConta{
    if ((![totalConta.text isEqual: @""])&& (![quantPessoas.text isEqual: @""])) {
        
//        display.text = [self divideConta:totalConta pessoas:quantPessoas desconto:individual artistico:artistico garcon:garcom percentGarcon:percentGarcon ];
//        descricaoConta.text = nil;
//        [descricaoConta setHidden:YES];
        
        display.text = [self divideConta:totalConta pessoas:quantPessoas desconto:individual artistico:artistico garcon:garcom percentGarcon:percentGarcon];
                descricaoConta.text = nil;
                [descricaoConta setHidden:YES];
    }
    
}

- (IBAction)BotaoSomar:(id)sender {
    [descricaoConta setHidden:NO];
    double registrador = 0;
    
      NSString *displayText = [display.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    
    registrador = [displayText doubleValue]+ [ [totalConta.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue ];
    
     NSString *texto = [[NSString alloc]initWithFormat:@"%.2f",registrador];
    
    texto= [texto stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    
    display.text = texto;
   
    NSString *totalContaText = [totalConta.text stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
   
    
    totalContaText = [totalConta.text stringByReplacingOccurrencesOfString:@"," withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    
    NSString *textoDescricao = [[NSString alloc]init];
    

     totalContaText = [totalContaText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    
    textoDescricao = [[NSString alloc]initWithFormat:@"%@ %@ %@",descricaoConta.text,totalContaText,@"+"];
    
   
    
    descricaoConta.text =  textoDescricao;
    totalConta.text = @"";
    
    
}

- (IBAction)BotaoIgual:(id)sender {
    
    NSString *displayText = [display.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *totalContaText = [totalConta.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    double resultado = [displayText doubleValue] + [totalContaText doubleValue];
    NSString *result = [[NSString alloc]initWithFormat:@"%.2f",resultado];
    
     result = [result stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    
    totalConta.text = result;
    display.text = @"";
    descricaoConta.text = @"";
}

- (IBAction)testarNumero:(UITextField *)sender {
    [self testarNumeroDecimal:sender];
    }

- (IBAction)testarInteiro:(UITextField *)sender {
    [self testarNumeroInteiro:sender];
}

- (IBAction)textFielReturn:(id)sender {
    [ sender resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning {
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
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-7764785023267812/2942272700"];
    [self.interstitial loadRequest:requestIntersDiv];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
