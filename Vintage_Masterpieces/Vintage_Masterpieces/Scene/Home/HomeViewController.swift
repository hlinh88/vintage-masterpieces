//
//  HomeViewController.swift
//  Vintage_Masterpieces
//
//  Created by Hoang Linh Nguyen on 11/3/2024.
//

import UIKit
import WebKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let token = UserDefaults.standard.value(forKey: "Authorization") {
            print("Token: \(token)")
        } else {
            getAccessTokenFromWebView()
        }
    }

    private func getAccessTokenFromWebView() {
        guard let urlRequest = APIService.shared.getAccessTokenURL() else { return }
        let webview = WKWebView()

        webview.load(urlRequest)
        webview.navigationDelegate = self
        view = webview
    }

}

extension HomeViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let urlString = webView.url?.absoluteString else { return }
        print(urlString)

        var tokenString = ""
        if urlString.contains("#access_token=") {
            let range = urlString.range(of: "#access_token=")
            guard let index = range?.upperBound else { return }

            tokenString = String(urlString[index...])
        }

        if !tokenString.isEmpty {
            let range = tokenString.range(of: "&token_type=Bearer")
            guard let index = range?.lowerBound else { return }

            tokenString = String(tokenString[..<index])
            UserDefaults.standard.setValue(tokenString, forKey: "Authorization")
            webView.removeFromSuperview()
        }
    }
}
