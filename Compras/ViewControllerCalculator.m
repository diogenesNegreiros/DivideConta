//
//  ViewControllerCalculator.m
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 05/03/16.
//  Copyright © 2016 Diogenes. All rights reserved.
//

#import "ViewControllerCalculator.h"

@interface ViewControllerCalculator ()

@end

@implementation ViewControllerCalculator

bool decimal = NO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Inicialização personalizada
    }
    return self;
}

-(IBAction)entrarNumero:(UIButton*)botao{
    double valor;
    
    if (self.ultimaOperacaoFoiIgual) {
        self.valorEntrado = 0;
        self.ultimaOperacaoFoiIgual = NO;
        self.operacao = 0;
    }
   if (decimal) {
       
        NSString *tela = self.display.text;
    NSString *retorno = [ tela stringByAppendingString:@"."];
        retorno = [retorno stringByAppendingString:botao.titleLabel.text];
        self.display.text = retorno;
        
        
        decimal = NO;
        
   }else{
    
     valor = [botao.titleLabel.text doubleValue];
    
   
  
    self.valorEntrado = self.valorEntrado * 10 + valor ;
        
   
    
    
    [self.display setText:[NSString stringWithFormat:@"%ld",(long)self.valorEntrado]];
          }
}

- (IBAction)entraPonto:(id)sender {
        decimal = YES;
   
}

- (IBAction)limpar:(id)sender{
    self.calculadora.registrador = 0;
    self.valorEntrado = 0;
    self.ultimaOperacaoFoiIgual = NO;
    self.operacao = 0;
    [self.display setText:[NSString stringWithFormat:@"%ld",(long)self.valorEntrado]];
    self.textoOperacao.text = @"";

}
- (IBAction)somar:(id)sender{
    if (self.ultimaOperacaoFoiIgual) {
        self.valorEntrado = 0;
        self.ultimaOperacaoFoiIgual = NO;
        self.operacao = 1;
    }else{
        [self realizarOperacao];
        self.valorEntrado = 0;
        self.operacao = 1;
    }
   self.textoOperacao.text = @"+";
}

- (IBAction)subtrair:(id)sender {
    if (self.ultimaOperacaoFoiIgual) {
        self.valorEntrado = 0;
        self.ultimaOperacaoFoiIgual = NO;
        self.operacao = 2;
    }else{
        [self realizarOperacao];
        self.valorEntrado = 0;
        self.operacao = 2;
    }
   self.textoOperacao.text = @"-";
}

- (IBAction)multiplicar:(id)sender {
    if (self.ultimaOperacaoFoiIgual) {
        self.valorEntrado = 0;
        self.ultimaOperacaoFoiIgual = NO;
        self.operacao = 3;
    }else{
        [self realizarOperacao];
        self.valorEntrado = 0;
        self.operacao = 3;
    }
   self.textoOperacao.text = @"x";
 
}

- (IBAction)dividir:(id)sender {
    if (self.ultimaOperacaoFoiIgual) {
        self.valorEntrado = 0;
        self.ultimaOperacaoFoiIgual = NO;
        self.operacao = 4;
    }else{
        [self realizarOperacao];
        self.valorEntrado = 0;
        self.operacao = 4;
    }
   self.textoOperacao.text = @"÷";
}

- (IBAction)igual:(id)sender{
    [self realizarOperacao];
    self.ultimaOperacaoFoiIgual =YES;
}

-(void)realizarOperacao{
    switch (self.operacao) {
       
            
        case 1:
            [self.calculadora somar:self.valorEntrado];
            [self.display setText:[NSString stringWithFormat:@"%f",self.calculadora.registrador]];
            break;
        case 2:
            [self.calculadora subtrair:self.valorEntrado];
            [self.display setText:[NSString stringWithFormat:@"%f",self.calculadora.registrador]];
            break;
        case 3:
            [self.calculadora multiplicar:self.valorEntrado];
            [self.display setText:[NSString stringWithFormat:@"%f",self.calculadora.registrador]];
            break;
        case 4:
            [self.calculadora dividir:self.valorEntrado];
            [self.display setText:[NSString stringWithFormat:@"%f",self.calculadora.registrador]];
            break;
        case 0:
            self.calculadora.registrador = self.valorEntrado;
            
        default:
            break;
    }
    self.ultimaOperacaoFoiIgual = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.calculadora = [[BMcalculadora alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
