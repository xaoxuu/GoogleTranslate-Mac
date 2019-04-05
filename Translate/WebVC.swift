//
//  WebVC.swift
//  Translate
//
//  Created by xaoxuu on 2019/4/5.
//  Copyright © 2019 Titan Studio. All rights reserved.
//

import Cocoa
import WebKit

class WebVC: NSViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        loadURL(urlStr: "https://translate.google.cn")
        
    }
    
    func loadURL(urlStr: String){
        if let url = URL.init(string: urlStr) {
            let req = URLRequest.init(url: url)
            if let cur = webView.url {
                if cur == url {
                    debugPrint("reload")
                    webView.reloadFromOrigin()
                    return
                }
            }
            webView.load(req)
        }
    }
    
}
