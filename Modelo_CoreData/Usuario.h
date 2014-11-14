//
//  Usuario.h
//  Modelo1
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Usuario : NSManagedObject

@property (nonatomic) BOOL a;
@property (nonatomic) BOOL b;
@property (nonatomic) int32_t edad;
@property (nonatomic, retain) NSString * estadoCivil;
@property (nonatomic, retain) NSString * foto;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * sexo;

@end
