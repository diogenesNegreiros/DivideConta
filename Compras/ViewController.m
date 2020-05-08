//
//  ViewController.m
//  Compras
//
//  Created by mac on 23/05/15.
//  Copyright (c) 2015 Diogenes. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
@import GoogleMobileAds;


@interface ViewController ()
@property(nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation ViewController

@synthesize display;
@synthesize valor1;
@synthesize percentual1;
@synthesize escolha;
@synthesize valor2;
@synthesize valor3;
@synthesize valor4;
@synthesize activeField;
@synthesize  scrollView;
@synthesize percentual2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Inicialização personalizada
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _titleItem.title = NSLocalizedString(@"Men_por", nil);
    
    _label_por_val.text = NSLocalizedString(@"Por_val", nil);
    _label_por_com.text = NSLocalizedString(@"Por_com", nil);
    _label_por_de.text = NSLocalizedString(@"Por_de", nil);
    _label_por_a_por.text = NSLocalizedString(@"Por_a_por_de", nil);
    _label_por_cif1.text =NSLocalizedString(@"Por_cif", nil);
    _label_por_cif2.text =NSLocalizedString(@"Por_cif", nil);
    _label_por_cif3.text =NSLocalizedString(@"Por_cif", nil);
    _label_por_cif4.text =NSLocalizedString(@"Por_cif", nil);



    _label_por_rep.text = NSLocalizedString(@"Por_rep_no", nil);
    _label_por_per.text = NSLocalizedString(@"Por_per_de", nil);
    _label_por_do_val.text = NSLocalizedString(@"Por_do_val", nil);
    

    
    [escolha setTitle:NSLocalizedString(@"Por_des", nil)forSegmentAtIndex:0];
    [escolha setTitle:NSLocalizedString(@"Por_acr", nil)forSegmentAtIndex:1];
    
    [self.scrollView setContentSize:(CGSizeMake(320, 480))];
    
    [self registerForKeyboardNotifications];
    
    SWRevealViewController   *revealViewController   =   self . revealViewController ;
    if   (revealViewController)
    {
        [ self . sidebarButton  setTarget : self . revealViewController ] ;
        [ self . sidebarButton  setAction :   @selector (  revealToggle :   ) ] ;
        [ self . view  addGestureRecognizer :self . revealViewController . panGestureRecognizer ] ;
    }
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self  action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    
    valor1.inputAccessoryView = numberToolbar;
    percentual1.inputAccessoryView = numberToolbar;
    valor2.inputAccessoryView = numberToolbar;
    valor3.inputAccessoryView = numberToolbar;
    valor4.inputAccessoryView = numberToolbar;
    percentual2.inputAccessoryView = numberToolbar;
    
}

-(void)doneWithNumberPad{
    
    [valor1 resignFirstResponder];
    [percentual1 resignFirstResponder];
    [valor2 resignFirstResponder];
    [valor3 resignFirstResponder];
    [valor4 resignFirstResponder];
    [percentual2 resignFirstResponder];
    [self calcular];
    
}


-(void)apagaTexto:(UITextField*) textField{
    textField.text = @"";
}
-(void)porcentagem1{
    double resposta;
    if (![valor1.text isEqual:@""] && ![percentual1.text isEqual:@""]) {
        
        NSString *valor1Text = [valor1.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
        NSString *percentual1Text = [percentual1.text stringByReplacingOccurrencesOfString:@"," withString:@"."];

        if ([escolha selectedSegmentIndex] ==0) {
           
            resposta = [valor1Text doubleValue]-([percentual1Text doubleValue]/100)*[valor1Text doubleValue];
        }else{
            resposta = ([percentual1Text doubleValue]/100)*[valor1Text doubleValue]+
            [valor1Text doubleValue];
        }
        NSString *texto = [[NSString alloc]initWithFormat:NSLocalizedString(@"Res_por_cif", nil),resposta];
        display.text = [texto stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
        
        }
}
-(void)porcentagem2{
   
    if (![valor2.text isEqual:@"" ]&& ![valor3.text isEqual:@""] ) {
        
        NSString *valor2Text = [valor2.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
        NSString *valor3Text = [valor3.text stringByReplacingOccurrencesOfString:@"," withString:@"."];

         NSNumber *resultado= [[NSNumber alloc]initWithDouble:[valor2Text doubleValue]/[valor3Text doubleValue]*100];
                       display.text = [[NSString alloc]initWithFormat:@"%@%@",resultado,@"%"];
        }
}


-(void)porcentagem3{
    double resposta = 0;
    if (![percentual2.text isEqual:@"" ]&&![valor4.text isEqual:@"" ] ) {
        
        NSString *percentual2Text = [percentual2.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
        NSString *valor4Text = [valor4.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
        
        resposta = [percentual2Text doubleValue]/100*[valor4Text doubleValue];
        }
        NSString *texto = [[NSString alloc]initWithFormat:NSLocalizedString(@"Res_por_cif", nil),resposta];
        display.text = [texto stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];        }




- (IBAction)controleDeDigitacao{


    [self apagaTexto:valor2];
    [self apagaTexto:valor3];
    [self apagaTexto:percentual2];
    [self apagaTexto:valor4];
    [self apagaTexto:display];

  }

- (IBAction)controleDeDigitacao2{
    
    [self apagaTexto:valor1];
    [self apagaTexto:percentual1];
    [self apagaTexto:percentual2];
    [self apagaTexto:valor4];
    [self apagaTexto:display];
}

- (IBAction)controleDedigitacao3 {
    
    [self apagaTexto:valor1];
    [self apagaTexto:percentual1];
    [self apagaTexto:valor2];
    [self apagaTexto:valor3];
    [self apagaTexto:display];
}

- (IBAction)testarNumero:(UITextField *)sender {
    [self testarNumeroDecimal:sender];
}

- (IBAction)calcular{
    if(![valor1.text isEqual:@"" ]){
        [self porcentagem1];
    }else if(![valor2.text isEqual:@"" ]){
        [self porcentagem2];
    }else if(![valor4.text isEqual:@"" ]&&![percentual2.text isEqual:@""]){
        [self porcentagem3];
    }
}




// called when click on the retun button.
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

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
    [self apagaTexto:display];
    [self apagaTexto:valor1];
    [self apagaTexto:percentual1];
    [self apagaTexto:valor2];
    [self apagaTexto:valor3];
    [self apagaTexto:percentual2];
    [self apagaTexto:valor4];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
