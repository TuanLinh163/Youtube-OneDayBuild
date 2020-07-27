//
//  ViewController.swift
//  Youtube-OneDayBuild
//
//  Created by Linh Tuan on 7/23/20.
//  Copyright © 2020 Linh Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!  
    var model = Model()
    var videos = [Videos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // set itself as the delegate of the model
        model.delegate = self
        model.getVideos()
    }
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Videos]) {
        // Set the returned videos to our video poroperty
        self.videos = videos
        
        DispatchQueue.main.async {
            // Refresh the tableview
            self.tableView.reloadData()
        }
    }

    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure cell with the data
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
    }
}

