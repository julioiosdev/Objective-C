//
//  CBComment.h
//  Listados y colecciones
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CBTipoCommentPhoto,
    CBTipoCommentText,
    CBTipoCommentAlbum
}CBTipoComment;


@interface CBComment : NSObject


@property NSString * contact;
@property NSString * name;
@property CBTipoComment type;
@property NSString * text;
@property NSString * photo;
@property NSArray * album;


@end
