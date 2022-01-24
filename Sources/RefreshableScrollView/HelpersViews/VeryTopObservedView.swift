//
//  File.swift
//  pullToRefresh
//
//  Created by Hossam on 24/01/2022.
//

import SwiftUI
struct VeryTopObservedView : View {
    var body: some View {
        Color.clear
            .frame(height: 3)
        
            .anchorPreference(key: VeryTopItemOnScrollViewPrefenreceKey.self, value: .center) { anchor in
                [VeryTopItemOnScrollViewPrefenreceValue(anchor: anchor)]
            }
        
        
    }
}
