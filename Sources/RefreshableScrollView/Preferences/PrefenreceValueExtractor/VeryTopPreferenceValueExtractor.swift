//
//  File.swift
//  pullToRefresh
//
//  Created by Hossam on 24/01/2022.
//

import SwiftUI

struct VeryTopPreferenceValueExtractor : AnyVeryTopPreferenceValueExtractor{
    
    let geometryProxy : GeometryProxy
    let preferences : [VeryTopItemOnScrollViewPrefenreceValue]

    
    func getYPosition() -> CGFloat {
        let center = geometryProxy[preferences.first!.anchor]
        let yPosition = center.y
        return yPosition
    }
    
    
    
}
