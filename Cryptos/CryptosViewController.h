//
//  ViewController.h
//  Cryptos
//
//  Created by Renán Díaz Reyes on 5/27/16.
//  Copyright © 2016 Renán Díaz Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CryptosViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *campoLlave;
@property (weak, nonatomic) IBOutlet UITextView *campoPlano;
@property (weak, nonatomic) IBOutlet UITextView *campoCrypt;
- (IBAction)procesarTexto:(id)sender;
- (IBAction)limpiarCampoPlano:(id)sender;
- (IBAction)limpiarCampoCrypt:(id)sender;

@end

