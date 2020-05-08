//
//  ViewControllerJuros.h
//  Compras
//
//  Created by mac on 08/07/15.
//  Copyright (c) 2015 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "TelaDeCalculo.h"

@interface ViewControllerJuros : TelaDeCalculo<UITextFieldDelegate>{
    
    IBOutlet UITextView *display2;
    IBOutlet UITextField *valorPrincipal;
    IBOutlet UITextField *juros;
    IBOutlet UISegmentedControl *juroTipo;
    IBOutlet UITextField *periodo;
  
    
    }

@property (strong,nonatomic) IBOutlet UITextView *display2;
@property (strong,nonatomic) IBOutlet UITextField *valorPrincipal;
@property (strong,nonatomic) IBOutlet UITextField *juros;
@property (strong, nonatomic) IBOutlet UISegmentedControl *juroTipo;
@property (strong,nonatomic) IBOutlet UITextField *periodo;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UITextField *activeField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (strong, nonatomic) IBOutlet UINavigationItem *titleItem;


- (IBAction)apagaTudo;
- (IBAction)calcularJuros;


- (IBAction)testarNumero:(UITextField*)TextField;
- (IBAction)testarInteiro:(UITextField *)sender;
    




@end
