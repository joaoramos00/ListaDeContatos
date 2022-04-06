//
//  ViewController.m
//  Contacts
//
//  Created by João Luis Ferreira Ramos Junior on 31/03/22.
//

#import "ViewController.h"
#import "Contato.h"

@implementation ViewController

-(id) initWithCoder: (NSCoder *) aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.dao = [ContatcsDao contatsDaoInstance];
    }
    return self;
}

-(void) adiciona {
    
    self.contato = [Contato new];
    [self getDadosForm];
    [self.dao adicionaContato: self.contato];
    
    [self.navigationController popViewControllerAnimated:YES];

    [self.delegate contatoAdicionado: self.contato];
    
    
}

- (void) viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *botao = nil;
    if (self.contato) {
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Altera" style:UIBarButtonItemStylePlain target:self action:@selector(altera)];
        self.navigationItem.title = @"Editar";
    }else {
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Adcionar" style:UIBarButtonItemStylePlain target:self action:@selector(adiciona)];
        self.navigationItem.title = @"Novo Contato";
        
    }
    self.navigationItem.rightBarButtonItem = botao;
    if(self.contato){
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.endereco.text = self.contato.end;
        self.site.text = self.contato.site;
        self.email.text = self.contato.email;
    }
}

- (void) altera {
    
    [self getDadosForm];
    
    [self.delegate contatoAtualizado: self.contato];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) getDadosForm {
    
    self.contato.nome = self.nome.text;
    self.contato.end = self.endereco.text;
    self.contato.telefone = self.telefone.text;
    self.contato.email = self.email.text;
    self.contato.site = self.site.text;
    
}

@end
