//
//  ViewControllerLucro.h
//  Compras
//
//  Created by mac on 07/10/15.
//  Copyright © 2015 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TelaDeCalculo.h"
#import "SWRevealViewController.h"


@interface ViewControllerLucro :TelaDeCalculo<UITextFieldDelegate>{
    
 
  UITextField *QuantidadeCompra;
  UITextField *UnidadeVenda;

 
  UITextField *ValorPagoCompra;
  UITextView *FieldDisplay;
}


@property (strong, nonatomic) IBOutlet UITextField *QuantidadeCompra;
@property (strong, nonatomic) IBOutlet UITextField *UnidadeVenda;




@property (strong, nonatomic) IBOutlet UITextField *ValorPagoCompra;
@property (strong, nonatomic) IBOutlet UITextView *FieldDisplay;

@property (strong, nonatomic) UITextField *activeField;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (strong, nonatomic) IBOutlet UINavigationItem *titleItem;


- (IBAction)apagaTudo;

- (IBAction)CalcLucro;



- (IBAction)testarNumero:(UITextField *)sender;
- (IBAction)testarInteiro:(UITextField *)sender;


@end
