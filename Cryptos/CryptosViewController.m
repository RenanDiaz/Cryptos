//
//  ViewController.m
//  Cryptos
//
//  Created by Renán Díaz Reyes on 5/27/16.
//  Copyright © 2016 Renán Díaz Reyes. All rights reserved.
//

#import "CryptosViewController.h"

@interface CryptosViewController ()

@end

@implementation CryptosViewController
@synthesize campoCrypt;
@synthesize campoLlave;
@synthesize campoPlano;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.campoLlave.delegate = self;
    self.campoPlano.layer.borderWidth = 1.0f;
    self.campoPlano.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.campoCrypt.layer.borderWidth = 1.0f;
    self.campoCrypt.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self procesarTexto:nil];
    return YES;
}

- (IBAction)procesarTexto:(id)sender {
    if(![campoPlano.text isEqualToString:@""]) {
        campoCrypt.text = [self encrypt:campoPlano.text withKey:campoLlave.text];
    } else {
        campoPlano.text = [self decrypt:campoCrypt.text withKey:campoLlave.text];
    }
}

- (IBAction)limpiarCampoPlano:(id)sender {
    campoPlano.text = @"";
}

- (IBAction)limpiarCampoCrypt:(id)sender {
    campoCrypt.text = @"";
}

- (NSString *)encrypt:(NSString *)text withKey:(NSString *)key {
    int chars = (int)text.length;
    int maxCount = (int)key.length;
    unichar keyList[maxCount];
    for(int i = 0; i < maxCount; i++) {
        keyList[i] = [key characterAtIndex:i];
    }
    
    unichar res[chars];
    int j = 0;
    for(int i = 0; i < chars; i++) {
        unichar code = [text characterAtIndex:i];
        unichar key = keyList[j] - 32;
        
        if(key % 2 == 0) {
            res[i] = (unichar)(code + key);
        } else {
            res[i] = (unichar)(code - key);
        }
        
        j++;
        if(j == maxCount)
        {
            j = 0;
        }
    }
    
    return [NSString stringWithCharacters:res length:chars];
}

- (NSString *)decrypt:(NSString *)text withKey:(NSString *)key {
    int chars = (int)text.length;
    int maxCount = (int)key.length;
    unichar keyList[maxCount];
    for(int i = 0; i < maxCount; i++) {
        keyList[i] = [key characterAtIndex:i];
    }
    
    unichar res[chars];
    int j = 0;
    for(int i = 0; i < chars; i++) {
        unichar code = [text characterAtIndex:i];
        unichar key = keyList[j] - 32;
        
        if(key % 2 == 0) {
            res[i] = (unichar)(code - key);
        } else {
            res[i] = (unichar)(code + key);
        }
        
        j++;
        if(j == maxCount)
        {
            j = 0;
        }
    }
    
    return [NSString stringWithCharacters:res length:chars];
}
@end
