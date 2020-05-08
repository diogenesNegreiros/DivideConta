//
//  ViewControllerJurosComp.m
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 02/03/16.
//  Copyright © 2016 Diogenes. All rights reserved.
//

#import "ViewControllerJurosComp.h"
#import <math.h>



@implementation ViewControllerJurosComp

@synthesize Field_display;
@synthesize Field_montante;
@synthesize Field_valor_principal;
@synthesize Field_periodo;
@synthesize Field_taxa;
@synthesize SegmentEscolha;
@synthesize activeField;
@synthesize scrollView;
@synthesize Switch_simulaPrice;

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
    
    _titleItem.title = NSLocalizedString(@"Men_jur_c", nil);
    
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
    Field_valor_principal.inputAccessoryView = numberToolbar;
    Field_periodo.inputAccessoryView = numberToolbar;
    Field_taxa.inputAccessoryView = numberToolbar;
    

    
}


-(void)doneWithNumberPad{
    
    [Field_valor_principal resignFirstResponder];
    [Field_taxa resignFirstResponder];
    [Field_periodo resignFirstResponder];
    [self CalcJurComposto];
}



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





//- (IBAction)toqueFechateclado:(id)sender {
  //  [activeField resignFirstResponder];
//}



- (IBAction)apagaTudo{
    [self apagarTextView:Field_display];
    [self apagarTextField:Field_montante];
    [self apagarTextField:Field_periodo];
    [self apagarTextField:Field_taxa];
    [self apagarTextField:Field_valor_principal];
    
}

- (IBAction)CalcJurComposto{
     if ((![Field_montante.text isEqual: @""])&& (![Field_periodo.text isEqual: @""])&&(![Field_taxa.text isEqual: @""])&&(![Field_valor_principal.text isEqual: @""])){
    Field_display.text= [self valorJurosComposto:Field_valor_principal juros:Field_taxa periodo:Field_periodo simulaPrince:Switch_simulaPrice tipoJuros:(int)[SegmentEscolha selectedSegmentIndex]];
     }
}

- (IBAction)testarNumero:(UITextField *)sender {
    [self testarNumeroDecimal:sender];
}
    
- (IBAction)testarInteiro:(UITextField *)sender {
    [self testarNumeroInteiro:sender];
}


/*
 Exemplo:
 Calcule o montante de um capital de R$6.000,00, aplicado a juros compostos, durante 1 ano, à taxa de 3,5% ao mês.
 (use log 1,035=0,0149 e log 1,509=0,1788)
 Resolução:
 P = R$6.000,00
 t = 1 ano = 12 meses
 i = 3,5 % a.m. = 0,035
 M = ?
 
 Usando a fórmula M=P.(1+i)n, obtemos:
 M  =  6000.(1+0,035)12  =  6000. (1,035)12
 Fazendo  x = 1,03512 e aplicando logaritmos, encontramos:
 log x = log 1,03512    =>   log x = 12 log 1,035    =>   log x = 0,1788    =>   x = 1,509
 Então  M = 6000.1,509 = 9054.
 Portanto o montante é R$9.054,00  */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
