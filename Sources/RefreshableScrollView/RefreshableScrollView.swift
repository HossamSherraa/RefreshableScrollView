//
//  ScrollListView.swift
//  pullToRefresh
//
//  Created by Hossam on 23/01/2022.
//

import SwiftUI

public struct RefreshableScrollView<Content : View>: View {
    public init(@ViewBuilder scrollViewContent: @escaping () -> Content, onRefresh: @escaping (IsLoadingWrapperProtocol) -> Void) {
        self.scrollViewContent = scrollViewContent
        self.onRefresh = onRefresh
    }
    
    @ViewBuilder var scrollViewContent : ()-> Content
    let onRefresh : (_ isLoading : IsLoadingWrapperProtocol)->Void
    @State private var isLoadingViewPresented : Bool = false
    @State private var currentYPos : CGFloat = 0
    public var body: some View {
        
        GeometryReader{ proxy in
            VStack{
                ScrollView{
                    LoadingHeader(isLoadingViewPresented: isLoadingViewPresented, yPosition: currentYPos)
                       
                    VeryTopObservedView()
                    scrollViewContent()
                }
            }
            .onPreferenceChange(VeryTopItemOnScrollViewPrefenreceKey.self) { preferences in
                let preferenceValuesExtractor: AnyVeryTopPreferenceValueExtractor = VeryTopPreferenceValueExtractor(geometryProxy: proxy, preferences: preferences)
                let yPosition = preferenceValuesExtractor.getYPosition()
                updateYPositionWith(newYPosition: yPosition)
                presentLoadingViewIfNeededWith(yPosition: yPosition)
            }
        }
       
    }
    
    
    //MARK: Helpers
    
    private func updateYPositionWith(newYPosition : CGFloat){
        self.currentYPos = newYPosition
    }
    
    private func presentLoadingViewIfNeededWith(yPosition : CGFloat){
        guard isLoadingViewPresented == false else {return}
        if yPosition > Constants.revereseScrollYOffset {
            presentLoadingView()
        }
    }
    private func presentLoadingView(){
        withAnimation {
            isLoadingViewPresented = true
            let isLoadingWrapper = IsLoadingWrapper(isLoading: $isLoadingViewPresented)
            onRefresh(isLoadingWrapper)
        }
    }
}




struct ScrollListView_Previews: PreviewProvider {
    static var previews: some View {
        RefreshableScrollView{
            
        } onRefresh: { isRefreshing in
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                
                    isRefreshing.toggle()
                
            }
            
        }
    }
}








