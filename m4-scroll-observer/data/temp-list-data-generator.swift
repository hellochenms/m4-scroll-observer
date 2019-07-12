//
//  temp-list-data-generator.swift
//  m6p-ios-temp-tool
//
//  Created by Chen,Meisong on 2019/7/3.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

class temp_list_data_generator {
    public static func indexTextArray(_ theCount: Int) -> [String] {
        var count = theCount
        if count <= 0 {
            count = theCount
        }
        
        var array = [String]()
        for i in 0..<count {
            let text = String(i)
            array.append(text)
        }
        
        return array
    }
    
    public static func randomTextArray(_ theCount: Int) -> [String] {
        var count = theCount
        if count <= 0 {
            count = theCount
        }
        
        var array = [String]()
        for _ in 0..<count {
            var text = "^"
            let r = Int.random(in: 1..<10)
            for _ in 0..<r {
                text += "ABCDefg0123你好世界"
            }
            text += "$"
            array.append(text)
        }
        
        return array
    }
}
