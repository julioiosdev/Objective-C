//
//  CBKVOViewController.m
//  Modelo1
//
//  Created by Carlos on 31/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBKVOViewController.h"

@interface CBKVOViewController ()

@end

@implementation CBKVOViewController

- (NSManagedObjectContext *) contexto{
    CBAppDelegate * app = [[UIApplication sharedApplication] delegate];
    return app.managedObjectContext1;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError * error;
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Usuario"];
    request.predicate = [NSPredicate predicateWithFormat:@"nombre='El Hombre de Negro'"];
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    if (resultado.count>0) {
        Usuario * u = [resultado objectAtIndex:0];
        self.txtNombre.text = u.nombre;
        self.txtEdad.text = [NSString stringWithFormat:@"%d años", u.edad];
        self.txtEstadoCivil.text = u.estadoCivil;
        self.txtSexo.text = u.sexo;
        self.imgFoto.image = [UIImage imageNamed:u.foto];
        self.swchA.on = u.a;
        self.swchB.on = u.b;
    }
    
    // Damos de alta las notificaciones en el modelo
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(cambiosEnElModelo:)
     name:NSManagedObjectContextObjectsDidChangeNotification
     object:self.contexto];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cambiar:(id)sender{
    
    NSError * error;
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Usuario"];
    request.predicate = [NSPredicate predicateWithFormat:@"nombre='El Hombre de Negro'"];
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    if (resultado.count>0){
        Usuario *  u = [resultado objectAtIndex:0];
        if (sender == self.swchA){
            [u setA:self.swchA.on];
            
        }
        if (sender == self.swchB){
            [u setB:self.swchB.on];
        }
    }
    
}

- (void) cambiosEnElModelo:(NSNotification *) notificacion{
    
    for (id changedObj in [notificacion.userInfo objectForKey:NSUpdatedObjectsKey]) {
        NSLog(@"%@", changedObj);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
