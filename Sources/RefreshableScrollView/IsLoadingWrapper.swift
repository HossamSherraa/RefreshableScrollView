//
//  File.swift
//  pullToRefresh
//
//  Created by Hossam on 24/01/2022.
//

import SwiftUI
public protocol IsLoadingWrapperProtocol {
    func toggle()
}
struct IsLoadingWrapper : IsLoadingWrapperProtocol {
    let isLoading :  Binding<Bool>
    func toggle() {
        isLoading.wrappedValue.toggle()
    }
}
