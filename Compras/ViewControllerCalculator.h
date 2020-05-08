//
//  ViewControllerCalculator.h
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 05/03/16.
//  Copyright © 2016 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TelaDeCalculo.h"
#import "SWRevealViewController.h"
#import "BMcalculadora.h"

@interface ViewControllerCalculator:TelaDeCalculo<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (nonatomic,strong) BMcalculadora* calculadora;

@property (strong, nonatomic) IBOutlet UILabel *display;
@property (nonatomic) NSInteger valorEntrado;
@property(nonatomic) NSInteger operacao;
@property(nonatomic) BOOL ultimaOperacaoFoiIgual;
@property (strong, nonatomic) IBOutlet UILabel *textoOperacao;

-(IBAction)entrarNumero:(UIButton*)botao;
- (IBAction)limpar:(id)sender;
- (IBAction)igual:(id)sender;
- (IBAction)somar:(id)sender;
- (IBAction)subtrair:(id)sender;
- (IBAction)multiplicar:(id)sender;
- (IBAction)dividir:(id)sender;
- (IBAction)entraPonto:(id)sender;



@end
