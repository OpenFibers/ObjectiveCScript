//
//  OCSMetaType.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/7/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  Mark type as c type, id type or custom type.

#ifndef ObjectiveCScriptDemo_OCSMetaType_h
#define ObjectiveCScriptDemo_OCSMetaType_h

typedef enum {
    OCSMetaTypeVoid,//Void type
    OCSMetaTypeCustom,//Custom object type. Pointer count only can be 1.
    OCSMetaTypeBasic,//C type: int, unsign int, CGRect, etc. Pointer count can be any value.
    OCSMetaTypeId//id. Pointer count only can be 0.
} OCSMetaType;

#endif
