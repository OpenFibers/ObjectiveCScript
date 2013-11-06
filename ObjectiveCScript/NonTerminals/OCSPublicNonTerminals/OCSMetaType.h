//
//  OCSMetaType.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/7/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#ifndef ObjectiveCScriptDemo_OCSMetaType_h
#define ObjectiveCScriptDemo_OCSMetaType_h

typedef enum {
    OCSIdentifierMetaTypeCustom,//Custom object type. Pointer count only can be 1.
    OCSIdentifierMetaTypeC,//C type: int, unsign int, CGRect, etc. Pointer count can be any value.
    OCSIdentifierMetaTypeId//id. Pointer count only can be 0.
} OCSIdentifierMetaType;

#endif
