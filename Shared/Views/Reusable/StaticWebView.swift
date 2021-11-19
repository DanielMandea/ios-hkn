//
//  StaticWebView.swift
//  HKN
//
//  Created by Daniel on 29.01.2021.
//

import SwiftUI
import WebKit

struct StaticWebView: UIViewRepresentable {
    let staticHtml: String?
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let html = staticHtml else {
            uiView.loadHTMLString("<html><body><p>Invalid Body</p></body></html>", baseURL: nil)
            return
        }
        uiView.loadHTMLString(html, baseURL: nil)
    }
}

struct StaticWebView_Previews: PreviewProvider {
    static var previews: some View {
        StaticWebView(staticHtml: "<html><body><p>Hello World</p></body></html>")
    }
}
