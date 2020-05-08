//
//  ViewControllerJuros.m
//  Compras
//
//  Created by mac on 08/07/15.
//  Copyright (c) 2015 Diogenes. All rights reserved.
//

#import "ViewControllerJuros.h"
#import "ViewController.h"
#import "SWRevealViewController.h"


@interface ViewControllerJuros()

@end

@implementation ViewControllerJuros

@synthesize display2;
@synthesize valorPrincipal;
@synthesize juros;
@synthesize juroTipo;
@synthesize periodo;
@synthesize activeField;
@synthesize scrollView;

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
    // Do any additional setup after loading the view.
    
    _titleItem.title = NSLocalizedString(@"Men_jur_s", nil);
    
    [self.scrollView setContentSize:(CGSizeMake(320, 480))];
    
    [self registerForKeyboardNotifications];
    
    SWRevealViewController   *revealViewController   =   self . revealViewController ;
    if   (   revealViewController   )
    {
        [ self . sidebarButton  setTarget : self . revealViewController ] ;
        [ self . sidebarButton  setAction :   @selector (  revealToggle :   ) ] ;
        [ self . view  addGestureRecognizer :self . revealViewController . panGestureRecognizer ] ;
    }
   
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc]initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self  action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    
    valorPrincipal.inputAccessoryView = numberToolbar;
    juros.inputAccessoryView = numberToolbar;
    periodo.inputAccessoryView = numberToolbar;
    
}



-(void)doneWithNumberPad{
   
    [valorPrincipal resignFirstResponder];
    [juros resignFirstResponder];
    [periodo resignFirstResponder];
    [self calcularJuros];
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
    [self apagarTextView:display2];
    [self apagarTextField:valorPrincipal];
    [self apagarTextField:juros];
    [self apagarTextField:periodo];
}
    



- (IBAction)calcularJuros {
    if ((![valorPrincipal.text isEqual: @""])&& (![juros.text isEqual: @""])&&(![periodo.text isEqual: @""])){
        float indice = [juroTipo selectedSegmentIndex];
        
        display2.text= [self valorJuros:valorPrincipal juros:juros periodo:periodo tipoJuros:indice];
        
              
    }
    
}

- (IBAction)testeDigitacao {
    
    NSLog(@"digitou");
   
}

- (IBAction)testarNumero:(UITextField*)TextField {
    [self testarNumeroDecimal:TextField];
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

@end
