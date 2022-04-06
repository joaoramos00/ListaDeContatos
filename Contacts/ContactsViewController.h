//
//  ContactsViewController.h
//  Contacts
//
//  Created by João Luis Ferreira Ramos Junior on 04/04/22.
//

#import <UIKit/UIKit.h>
#import "ContatcsDao.h"
#import "ViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface ContactsViewController : UITableViewController<ViewControllerDelegate>

@property ContatcsDao *dao;
@property Contato *contatoSelecionado;
@property NSInteger linhaSelecionada;

- (void) contatoAdicionado: (Contato *)contato;
- (void) contatoAtualizado: (Contato *)contato;

@end

NS_ASSUME_NONNULL_END
