//
//  DetailViewController.swift
//  Youtube-OneDayBuild
//
//  Created by Linh Tuan on 7/27/20.
//  Copyright © 2020 Linh Tuan. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video:Videos?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // clear the field
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // check if there's a video
        guard video != nil else {
            return
        }
        
        // create the embed url
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        // load it into webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // set the title
        titleLabel.text = video?.title
        
        // set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        // set the description
        textView.text = video?.description
    }
    
}
