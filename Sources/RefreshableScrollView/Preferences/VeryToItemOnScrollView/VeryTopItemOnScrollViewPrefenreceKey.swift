//
//  File.swift
//  pullToRefresh
//
//  Created by Hossam on 24/01/2022.
//

import SwiftUI
struct VeryTopItemOnScrollViewPrefenreceKey : PreferenceKey {
    static var defaultValue: [VeryTopItemOnScrollViewPrefenreceValue] = []
    
    static func reduce(value: inout [VeryTopItemOnScrollViewPrefenreceValue], nextValue: () -> [VeryTopItemOnScrollViewPrefenreceValue]) {
        value.append(contentsOf: nextValue())
    }
    
    typealias Value = [VeryTopItemOnScrollViewPrefenreceValue]
    
    
}
