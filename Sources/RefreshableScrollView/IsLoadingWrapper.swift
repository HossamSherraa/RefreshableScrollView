//
//  File.swift
//  pullToRefresh
//
//  Created by Hossam on 24/01/2022.
//

import SwiftUI
public protocol IsLoadingWrapperProtocol {
    func stop()
    func start()
}
struct IsLoadingWrapper : IsLoadingWrapperProtocol {
    let isLoading :  Binding<Bool>
    func stop() {
        print("syoo")
        isLoading.wrappedValue = false
    }
    
    func start() {
        isLoading.wrappedValue = true 
    }
}
