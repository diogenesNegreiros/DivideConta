//
//  TelaDeCalculo.m
//  Compras
//
//  Created by mac on 10/07/15.
//  Copyright (c) 2015 Diogenes. All rights reserved.
//

#import "TelaDeCalculo.h"


@interface TelaDeCalculo ()

@end

@implementation TelaDeCalculo

-(NSString*)somar: (UITextField*)nun1 numero2: (UITextField*)nun2{
    NSString*resposta;
    double result;
    result = [nun1.text doubleValue]+[nun2.text doubleValue];
    resposta = [[NSString alloc]initWithFormat:@"%.2f",result];
    return resposta;
}
-(NSString*)subtrair: (UITextField*)nun1 numero2: (UITextField*)nun2{
    NSString*resposta;
    double result;
    result = [nun1.text doubleValue]-[nun2.text doubleValue];
    resposta = [[NSString alloc]initWithFormat:@"%.2f",result];
    return resposta;
}


-(NSString*)multiplicar: (UITextField*)nun1 numero2: (UITextField*)nun2{
    NSString *resposta;
    double result;
    result = [nun1.text doubleValue]*[nun2.text doubleValue];
    resposta= [[NSString alloc]initWithFormat:@"%f",result];
    return resposta;
}
-(NSString*)dividir: (UITextField*)nun1 numero2: (UITextField*)nun2{
    NSString *resposta;
    double result;
    result = [nun1.text doubleValue]/[nun2.text doubleValue];
    resposta= [[NSString alloc]initWithFormat:@"%f",result];
    return resposta;
}

-(NSString*)percentDesconto: (UITextField*)nun1 percentual: (UITextField*)desconto{
    NSString*resposta;
    
    NSString *nun1Text = [nun1.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *descontoText = [desconto.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    double result;
    result= [nun1Text doubleValue]-([descontoText doubleValue]/100)*[nun1Text doubleValue];
    resposta = [[NSString alloc ]initWithFormat:@"%.2f",result];
    return resposta;
}
-(NSString*)percentRepresentaValor: (UITextField*)nun1 numero2: (UITextField*)nun2{
    NSString*resposta;
    double result;
    result= [nun1.text doubleValue]/[nun2.text doubleValue]*100;
    resposta = [[NSString alloc ]initWithFormat:@"%.2f%@",result,@"%"];
    return resposta;
}

-(NSString*)percentValor:(UITextField*)valorPrincipal percentual:(UITextField*) percentual{
    NSString*resposta;
    double result;
    result= [valorPrincipal.text doubleValue]*[percentual.text doubleValue]/100;
    resposta = [[NSString alloc ]initWithFormat:@"%.2f",result];
    return resposta;
}

- (void)apagarTextField:(UITextField *)texto{
    texto.text = @"";
}

- (void)apagarTextView:(UITextView*)texto{
    texto.text = @"";}

-(NSString*)valorJuros:(UITextField*)Valor juros:(UITextField*)juros periodo:(UITextField*)

periodo tipoJuros:(int) index{
   
    NSString* texto;
    
    NSString *valorText = [Valor.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *jurosText = [juros.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *periodoText = [periodo.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
  
    double resultado1;
    if (index==1) {
        resultado1 = ([valorText doubleValue] *[jurosText doubleValue]/100)/12 * [periodoText doubleValue];
    }else{
        resultado1 = [valorText doubleValue] *[jurosText doubleValue]/100  * [periodoText doubleValue];
    }
    double resultado2 = resultado1 + [valorText doubleValue] ;
    double resultado3= 0;
    if (![periodoText isEqual:@""]||[periodoText isEqual:@"0"]) {
        resultado3 = resultado2/[periodoText doubleValue];
    }
    NSString *resultado1Text = [[NSString alloc]initWithFormat:@"%.2f",resultado1];
    NSString *resultado2Text = [[NSString alloc]initWithFormat:@"%.2f",resultado2];
    NSString *resultado3Text = [[NSString alloc]initWithFormat:@"%.2f",resultado3];
    
    resultado1Text = [resultado1Text stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    resultado2Text = [resultado2Text stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    resultado3Text= [resultado3Text stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    
    
    texto = [[NSString alloc]initWithFormat:NSLocalizedString(@"Res_val_jur", nil)
             ,resultado1Text,resultado2Text,resultado3Text];
    return texto;
}

-(NSString*)valorJurosComposto:(UITextField*)Valor juros:(UITextField*)juros periodo:(UITextField*)
periodo simulaPrince:(UISwitch*) simulaPrice tipoJuros:(int) index{
    
    NSString *valorText = [Valor.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *jurosText = [juros.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *periodoText = [periodo.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    double P =[valorText doubleValue];
    double n = [periodoText doubleValue];
    double i = [jurosText doubleValue]/100;
    double result2montante;
    double result1Juros = 0;
    double result3prestacao= 0;
    NSString* texto;
    
    if (index==1) {
        i/=12;    }
    
    if (![periodo.text isEqual:@""]||[periodo.text isEqual:@"0"]) {
        
     
        
        if ([simulaPrice isOn]) {
            result3prestacao = P * ( (pow((1+i), n) * i )/ (pow((1+i), n) -1));
            result2montante = result3prestacao * n;
            result1Juros = result2montante - P;
        } else {
            result2montante =  P * (double) pow((1+i), n ) ;
            result1Juros = result2montante - P;
            result3prestacao = result2montante/n;
        }
        
      
    }
    NSString *resultado1Text = [[NSString alloc]initWithFormat:@"%.2f",result1Juros];
    NSString *resultado2Text = [[NSString alloc]initWithFormat:@"%.2f",result2montante];
    NSString *resultado3Text = [[NSString alloc]initWithFormat:@"%.2f",result3prestacao];
    
    resultado1Text = [resultado1Text stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    resultado2Text = [resultado2Text stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    resultado3Text= [resultado3Text stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    
    texto = [[NSString alloc]initWithFormat:NSLocalizedString(@"Res_val_jur_com", nil),resultado1Text,resultado2Text,resultado3Text];
    return texto;
}
-(NSString*)calcularLucro:(UITextField*)fieldTotalCompra quantidade:(UITextField*)fieldQuantidade unidadeVenda:(UITextField*)fieldUnidadeVenda{
    NSString* texto;
    
    NSString *fieldTotalText = [fieldTotalCompra.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *fieldQuantidadeText = [fieldQuantidade.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *fieldUnidadeVendaText = [fieldUnidadeVenda.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    double lucroTotal, lucroUnidade,valorDaUnidadeComprada;
  
    lucroTotal = [fieldUnidadeVendaText doubleValue]*[fieldQuantidadeText doubleValue]-[fieldTotalText doubleValue];
    valorDaUnidadeComprada = [fieldTotalText doubleValue]/[fieldQuantidadeText doubleValue];
    lucroUnidade = [fieldUnidadeVendaText doubleValue]- valorDaUnidadeComprada;
   
    
    
    NSNumber *percentlucro= [[NSNumber alloc]initWithDouble:lucroTotal/[fieldTotalText doubleValue]*100];
    
    NSString *lucroTotalText = [[NSString alloc]initWithFormat:@"%.2f",lucroTotal];
    NSString *lucroUnidadeText = [[NSString alloc]initWithFormat:@"%.2f",lucroUnidade];
    NSString *percentlucroText = [[NSString alloc]initWithFormat:@"%@",percentlucro];
    
    lucroTotalText = [lucroTotalText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    lucroUnidadeText = [lucroUnidadeText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
//    percentlucroText= [percentlucroText stringByReplacingOccurrencesOfString:@"." withString:@","];
    
    
    texto = [[NSString alloc]initWithFormat:NSLocalizedString(@"Res_cal_luc", nil)
             ,lucroTotalText,lucroUnidadeText,percentlucroText, @"%"];
    
   
    
    
    return texto;
}
-(NSString*)calcularValorDeVenda:(UITextField*)fieldTotalCompra quantidade:(UITextField*)fieldQuantidade lucroDesejado:(UITextField*)fieldLucroDesejado{
    
    NSString *fieldTotalCompraText = [fieldTotalCompra.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *fieldQuantidadeText = [fieldQuantidade.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *fieldLucroDesejadoText = [fieldLucroDesejado.text stringByReplacingOccurrencesOfString:@"," withString:@"."];

    
    NSString* texto;
    double valorDeVenda,valorDeCompra,lucroUnidade,totalDaVendaProduto,totalDeLucro;
    valorDeVenda = ([fieldTotalCompraText doubleValue]+[fieldLucroDesejadoText doubleValue])/[fieldQuantidadeText doubleValue];
    valorDeCompra= [fieldTotalCompraText doubleValue]/ [fieldQuantidadeText doubleValue];
    lucroUnidade = valorDeVenda-valorDeCompra;

    totalDaVendaProduto = valorDeVenda* [fieldQuantidadeText doubleValue];
    totalDeLucro = totalDaVendaProduto - [fieldTotalCompraText doubleValue];
    
    NSString *valorDeCompraText = [[NSString alloc]initWithFormat:@"%.2f",valorDeCompra];
    NSString *valorDeVendaText = [[NSString alloc]initWithFormat:@"%.2f",valorDeVenda];
    NSString *lucroUnidadeText = [[NSString alloc]initWithFormat:@"%.2f",lucroUnidade];
    NSString *totalDaVendaProdutoText = [[NSString alloc]initWithFormat:@"%.2f",totalDaVendaProduto];
    NSString *totalDeLUcroText = [[NSString alloc]initWithFormat:@"%.2f",totalDeLucro];
    
    valorDeCompraText = [valorDeCompraText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    valorDeVendaText = [valorDeVendaText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    lucroUnidadeText= [lucroUnidadeText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    totalDaVendaProdutoText= [totalDaVendaProdutoText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    totalDeLUcroText= [totalDeLUcroText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    
    texto = [[NSString alloc]initWithFormat:NSLocalizedString(@"Res_cal_val_ven", nil)
             ,valorDeCompraText,valorDeVendaText,lucroUnidadeText,totalDaVendaProdutoText,totalDeLUcroText];
    return texto;
}


-(NSString*)divideConta:(UITextField*)fieldTotalConta pessoas:(UITextField*) fieldPessoas desconto:(UITextField*)fieldDesconto artistico:(UITextField*)fieldArtistico garcon:(UISwitch*) SwitchGarcon percentGarcon:(UITextField*)percentGarcon{
    
    NSString *fieldTotalContaText = [fieldTotalConta.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *fieldPessoasText = fieldPessoas.text;
    NSString *fieldDescontoText = [fieldDesconto.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *fieldArtisticoText = [fieldArtistico.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
     NSString *fieldPercentGarconText = [percentGarcon.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    NSString* texto;
    double TotalGeral=0,TotalPorPessoa=0,desconto, garcon=0, artistico=0, taxaGarcon=0;
    
    
    artistico=[fieldArtisticoText doubleValue];
    desconto = [fieldDescontoText doubleValue];
    TotalGeral=[fieldTotalContaText doubleValue];
    taxaGarcon =[fieldPercentGarconText doubleValue]/100;
    
    if ([SwitchGarcon isOn] ) {
        garcon = [fieldTotalContaText doubleValue]*taxaGarcon;
        TotalGeral = [fieldTotalContaText doubleValue] + garcon + artistico - desconto;
        
    }else{
        TotalGeral= TotalGeral + artistico - desconto;
    }
    
    
    TotalPorPessoa=(TotalGeral/[fieldPessoasText doubleValue]);
    
    
    NSString *TotalGeralText = [[NSString alloc]initWithFormat:@"%.2f",TotalGeral];
    NSString *TotalPorPessoaText = [[NSString alloc]initWithFormat:@"%.2f",TotalPorPessoa];
    NSString *artisticoText = [[NSString alloc]initWithFormat:@"%.2f",artistico];
    NSString *garconText = [[NSString alloc]initWithFormat:@"%.2f",garcon];
    NSString *descontoText = [[NSString alloc]initWithFormat:@"%.2f",desconto];
    
    TotalGeralText = [TotalGeralText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    TotalPorPessoaText = [TotalPorPessoaText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    artisticoText = [artisticoText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    garconText = [garconText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];
    descontoText = [descontoText stringByReplacingOccurrencesOfString:@"." withString:[[NSString alloc]initWithFormat:NSLocalizedString(@"SeparadorDecimal", nil)]];

    
    
    texto= [[NSString alloc]initWithFormat:NSLocalizedString(@"Res_div_con", nil)            ,TotalGeralText,TotalPorPessoaText,artisticoText,garconText,descontoText];
    
    return texto;
}
-(BOOL)validaCampoNumerico:(UITextField*)fieldtexto{
    BOOL valid;
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:fieldtexto.text];
    valid = ![alphaNums isSupersetOfSet:inStringSet];
    return valid;
}


- (void)testarNumeroDecimal:(UITextField*)TextField {
    if (![TextField.text  isEqual: @""]){
        
     if(![self validaNumeroDecimal:TextField]){
        
  
        NSLog(@"nao é numero");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: NSLocalizedString(@"Ale_tit", nil)
                                                        message:NSLocalizedString(@"Ale_msg", nil)
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        
        TextField.text=@"";
        };
    }
}
    - (void)testarNumeroInteiro:(UITextField*)TextField {
        if(![self validaNumeroInteiro:TextField]){
            
            
            NSLog(@"nao é inteiro");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: NSLocalizedString(@"Ale_tit_int", nil)
                                                            message:NSLocalizedString(@"Ale_msg_int", nil)
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
            [alert show];
            
            TextField.text=@"";
        };
        
    }

- (void)testarNumeroMaluco:(UITextField*)TextField {
    if(![self validaNumeroInteiro:TextField]){
        
        
        NSLog(@"nao é inteiro");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: NSLocalizedString(@"Ale_tit_int", nil)
                                                        message:NSLocalizedString(@"Ale_msg_int", nil)
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        
        TextField.text=@"";
    };
    
}

-(BOOL)validaNumeroDecimal:(UITextField*)fieldText{
    
//    NSString *regex1 = @"^\\d{1,4}([.,]\\d{1,2})?$";
                    //    "^\\d{0,4}([,.]\\d{0,2})?$"
    
//    NSString *regex1 = @"^\\d{0,30}([,.]\\d{0,2})?$";
    
     NSString *regex1 = @"^\\d\\d{0,30}([,.]\\d{0,2})?$";
    
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
    return[numberTest evaluateWithObject:fieldText.text];
    
    
}
    -(BOOL)validaNumeroInteiro:(UITextField*)fieldText{
        
        //    NSString *regex1 = @"^\\d{1,4}([.,]\\d{1,2})?$";
        //    "^\\d{0,4}([,.]\\d{0,2})?$"
        
        NSString *regex1 = @"^\\d{0,30}";
        NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
        return[numberTest evaluateWithObject:fieldText.text];
        
        
    }



-(void)addToolBarCalc:(UITextField*)TextField{
    
    UIBarButtonItem* botaoOk = [[UIBarButtonItem alloc]initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:UITextFieldTextDidEndEditingNotification  action:nil
                                ];
    UIBarButtonItem* espaco = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
  
    numberToolbar.items = @[espaco,botaoOk];
    [numberToolbar sizeToFit];
    
    

    TextField.inputAccessoryView = numberToolbar;
}
-(void)doneWithNumberPad:field{
    [ field resignFirstResponder];
    
}
-(void)showInterstitial:(GADInterstitial*)interstitial  request:(GADRequest*)request {
    
    NSLog(@"Controle disparou adMob interstitial!");
   
   if (interstitial.isReady) {
       
        [interstitial presentFromRootViewController:self];
    }else {
        NSLog(@"AdMob interstitial não disparou!");
    }
}

-(void)showBanner:(GADBannerView*) bannerViewAds {
   
    bannerViewAds.rootViewController = self;
    
    [bannerViewAds loadRequest:[GADRequest request]];
    
   
    if (bannerViewAds) {
         NSLog(@" Controler disparou adMob Banner!");
      
    }else {
        NSLog(@"AdMob banner não disparou!");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
