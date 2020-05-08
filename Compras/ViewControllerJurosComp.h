//
//  ViewControllerJurosComp.h
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 02/03/16.
//  Copyright © 2016 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TelaDeCalculo.h"
#import "SWRevealViewController.h"


@interface ViewControllerJurosComp:TelaDeCalculo<UITextFieldDelegate> {
    
    
    IBOutlet UITextView *Field_display;
    IBOutlet UITextField *Field_montante;
    IBOutlet UITextField *Field_valor_principal;
    IBOutlet UITextField *Field_periodo;
    IBOutlet UITextField *Field_taxa;
    UISegmentedControl *SegmentEscolha;
    IBOutlet UISwitch *Switch_simulaPrice;
}
@property (strong, nonatomic) IBOutlet UITextField *Field_montante;
@property (strong, nonatomic) IBOutlet UITextField *Field_valor_principal;
@property (strong, nonatomic) IBOutlet UITextField *Field_periodo;
@property (strong, nonatomic) IBOutlet UITextField *Field_taxa;
@property (strong, nonatomic) IBOutlet UITextView *Field_display;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *SegmentEscolha;
@property (strong, nonatomic) UITextField *activeField;
@property (strong, nonatomic) IBOutlet UISwitch *Switch_simulaPrice;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (strong, nonatomic) IBOutlet UINavigationItem *titleItem;

- (IBAction)apagaTudo;

- (IBAction)CalcJurComposto;
- (IBAction)testarNumero:(UITextField *)sender;
- (IBAction)testarInteiro:(UITextField *)sender;




@end
