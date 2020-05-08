//
//  ViewControllerVenda.h
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 26/01/17.
//  Copyright © 2017 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TelaDeCalculo.h"
#import "SWRevealViewController.h"

@interface ViewControllerVenda : TelaDeCalculo<UITextFieldDelegate>{
    
    
    UITextField *QuantidadeCompra;
   
    UITextField *LucroDesejado;
    UITextField *PercentDeLucro;
    UITextField *ValorPagoCompra;
    UITextView *FieldDisplay;
}


@property (strong, nonatomic) IBOutlet UITextField *QuantidadeCompra;

@property (strong, nonatomic) IBOutlet UITextField *LucroDesejado;
@property (strong, nonatomic) IBOutlet UITextField *PercentDeLucro;
@property (strong, nonatomic) IBOutlet UITextField *ValorPagoCompra;
@property (strong, nonatomic) IBOutlet UITextView *FieldDisplay;

@property (strong, nonatomic) UITextField *activeField;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (strong, nonatomic) IBOutlet UINavigationItem *titleItem;


- (IBAction)apagaTudo;


- (IBAction)CalcValorVenda;

- (IBAction)autoDigitaPercentDesejado;
- (IBAction)testarNumero:(UITextField *)sender;
- (IBAction)testarInteiro:(UITextField *)sender;


@end
