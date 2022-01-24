//
//  File.swift
//  pullToRefresh
//
//  Created by Hossam on 24/01/2022.
//

import SwiftUI

struct LoadingHeader : View {
    let isLoadingViewPresented: Bool
    let yPosition : CGFloat
    var body: some View{
        ProgressView()
            .frame(height: isLoadingViewPresented ? Constants.progressViewHeight : 0)
            .opacity(isLoadingViewPresented ? 1 : 0 )
            .scaleEffect(getScaleValue())
        
    }
    func getScaleValue()->CGFloat{
        print("call")
        return min(max(Constants.progressViewMinScale,  yPosition / Constants.progressViewStartScaleAt) , Constants.progressViewMaxScale)
    }
}
