//
//  ViewController.h
//  Compras
//
//  Created by mac on 23/05/15.
//  Copyright (c) 2015 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TelaDeCalculo.h"


@interface ViewController : TelaDeCalculo<UITextFieldDelegate>{
    
    
    IBOutlet UITextField *display;
    IBOutlet UITextField *valor1;
    IBOutlet UITextField *percentual1;
    IBOutlet UISegmentedControl *escolha;
    IBOutlet UITextField *valor2;
    IBOutlet UITextField *valor3;
    IBOutlet UITextField *percentual2;
    IBOutlet UITextField *valor4;
}

@property (strong, nonatomic) IBOutlet UITextField *display;
@property (strong, nonatomic) IBOutlet UITextField *valor1;
@property (strong, nonatomic) IBOutlet UITextField *percentual1;
@property (strong, nonatomic) IBOutlet UISegmentedControl *escolha;
@property (strong, nonatomic) IBOutlet UITextField *valor2;
@property (strong, nonatomic) IBOutlet UITextField *valor3;
@property (strong, nonatomic) IBOutlet UITextField *percentual2;
@property (strong, nonatomic) IBOutlet UITextField *valor4;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UITextField *activeField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;


@property (weak, nonatomic) IBOutlet UILabel *label_por_de;
@property (weak, nonatomic) IBOutlet UILabel *label_por_val;
@property (weak, nonatomic) IBOutlet UILabel *label_por_com;
@property (weak, nonatomic) IBOutlet UILabel *label_por_a_por;
@property (weak, nonatomic) IBOutlet UILabel *label_por_rep;
@property (weak, nonatomic) IBOutlet UILabel *label_por_per;
@property (weak, nonatomic) IBOutlet UILabel *label_por_cif1;
@property (weak, nonatomic) IBOutlet UILabel *label_por_cif2;
@property (weak, nonatomic) IBOutlet UILabel *label_por_cif3;
@property (weak, nonatomic) IBOutlet UILabel *label_por_cif4;
@property (weak, nonatomic) IBOutlet UILabel *label_por_do_val;



@property (strong, nonatomic) IBOutlet UINavigationItem *titleItem;



- (IBAction)calcular;
- (IBAction)apagaTudo;
- (IBAction)controleDeDigitacao;
- (IBAction)controleDeDigitacao2;
- (IBAction)controleDedigitacao3;
- (IBAction)testarNumero:(UITextField *)sender;





@end

