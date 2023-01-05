//
//  ViewController.swift
//  Web
//
//  Created by Eunchan Kim on 2023/01/02.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("https://github.com/jinunzzan")
        
    }
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
        
    }
    //페이지 로딩중 인디케이터 실행
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    //페이지 로드 완료 후 인디케이터 중지
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    //페이지 로드 실패시 인디케이터 중지
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            myActivityIndicator.stopAnimating()
            myActivityIndicator.isHidden = true
        }
    //html:// 문자열 삽입
    func checkUrl(_ url:String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
        
        @IBAction func btnGotoUrl(_ sender: UIButton) {
            let myUrl = checkUrl(txtUrl.text!)
            txtUrl.text = ""
            loadWebPage(myUrl)
            
        }
        
        @IBAction func btnGoSite1(_ sender: UIButton) {
            loadWebPage("https://blog.naver.com/lovebox6607")
        }
        
        @IBAction func btnGoSite2(_ sender: UIButton) {
            loadWebPage("https://jinunzzan.tistory.com/")
        }
        
        @IBAction func btnLoadHtmlString(_ sender: UIButton) {
            let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지</p><p><a href=\"https://github.com/jinunzzan\">네이버 블로그</a>으로 이동</p>"
            myWebView.loadHTMLString(htmlString, baseURL: nil)
            
        }
        
        @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
            let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
            let myUrl = URL(fileURLWithPath: filePath!)
            let myRequest = URLRequest(url: myUrl)
            myWebView.load(myRequest)
        }
        
        //툴바버튼
        @IBAction func btmStop(_ sender: UIBarButtonItem) {
            myWebView.stopLoading()
        }
        
        @IBAction func btnReload(_ sender: UIBarButtonItem) {
            myWebView.reload()
        }
        
        @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
            myWebView.goBack()
        }
        
        @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
            myWebView.goForward()
        }
    }
    
