//
//  WebView.swift
//  HKN
//
//  Created by Daniel on 29.01.2021.
//

import SwiftUI
import WebKit

struct macOS_WebView: NSViewRepresentable {
    
    @Binding var isLoading: Bool
    
    var url: String? = nil
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isLoading: $isLoading)
    }
    
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        guard let urlStr = url, let urlFinal = URL(string: urlStr) else {
            nsView.loadHTMLString("<h1>Invalid URL</h1>", baseURL: nil)
            return
        }
        nsView.load(URLRequest(url: urlFinal))
    }
    
    // MARK: - Coordinator
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        var isLoading: Binding<Bool>
        
        init(isLoading: Binding<Bool>) {
            self.isLoading = isLoading
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            isLoading.wrappedValue = false
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        macOS_WebView(isLoading: .constant(true), url: "https://mtdtechnology.net")
    }
}

import SwiftUI




