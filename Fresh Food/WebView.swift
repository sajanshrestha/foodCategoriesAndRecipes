//
//  WebView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/22/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.load(request)
        return webView
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    } 
}
