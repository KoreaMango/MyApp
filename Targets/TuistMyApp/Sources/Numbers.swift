//
//  Numbers.swift
//  TuistMyApp
//
//  Created by 강민규 on 2022/11/11.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

class Numbers {
    func showing() {
        #if Dev
        print("Dev")
        #elseif Alpha
        print("Alpha")
        #elseif Prod
        print("Prod")
        #else
        print("WorkSpace")
        #endif
        print("\n\n")
    }
}
