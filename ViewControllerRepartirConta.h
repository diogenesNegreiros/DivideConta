//
//  ViewControllerRepartirConta.h
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 06/03/16.
//  Copyright © 2016 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TelaDeCalculo.h"
#import "SWRevealViewController.h"

@interface ViewControllerRepartirConta :TelaDeCalculo<UITextFieldDelegate>{
    
    IBOutlet UITextView *display;
    IBOutlet UITextField *quantPessoas;
    IBOutlet UITextField *totalConta;
    IBOutlet UITextField *artistico;
    IBOutlet UISwitch *garcom;
    IBOutlet UITextField *individual;
    UITextField *activeField;
    IBOutlet UITextField *percentGarcon;
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) IBOutlet UITextView *display;
@property (strong, nonatomic) IBOutlet UITextField *quantPessoas;
@property (strong, nonatomic) IBOutlet UITextField *totalConta;
@property (strong, nonatomic) IBOutlet UITextField *artistico;
@property (strong, nonatomic) IBOutlet UISwitch *garcom;
@property (strong, nonatomic) IBOutlet UITextField *individual;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UITextField *activeField;
@property (strong, nonatomic) IBOutlet UINavigationItem *titleItem;
@property (strong, nonatomic) IBOutlet UITextView *descricaoConta;
@property (strong, nonatomic) IBOutlet UITextField *percentGarcon;

- (IBAction)apagaTudo;

- (IBAction)CalcularConta;

- (IBAction)BotaoSomar:(id)sender;
- (IBAction)BotaoIgual:(id)sender;
- (IBAction)testarNumero:(UITextField *)sender;
- (IBAction)testarInteiro:(UITextField *)sender;





@end
