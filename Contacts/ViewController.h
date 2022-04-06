//
//  ViewController.h
//  Contacts
//
//  Created by João Luis Ferreira Ramos Junior on 31/03/22.
//

#import <UIKit/UIKit.h>
#import "ContatcsDao.h"

@protocol ViewControllerDelegate <NSObject>


- (void) contatoAdicionado: (Contato *)contato;
- (void) contatoAtualizado: (Contato *)contato;


@end

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *site;
@property IBOutlet UITextField *email;

@property ContatcsDao *dao;
@property Contato *contato;
@property id<ViewControllerDelegate> delegate;

@end

