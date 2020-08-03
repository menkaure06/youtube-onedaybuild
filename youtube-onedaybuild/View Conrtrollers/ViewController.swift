//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Nadario Ferguson on 8/2/20.
//  Copyright © 2020 Nadario Ferguson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the model
        model.delegate = self
        
        
        
        model.getVideos()
        
    }
    
    // How you pass the selected video over to the detail view controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Confirm that a view was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a reference to the video that was tapped
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // Get a reference to the video view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Set the video
        detailVC.video = selectedVideo
    }
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned video to our video property
        self.videos = videos
        
        // Refresh the tableview
        tableView.reloadData()
    }
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with the data
        
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        
        
        // Return the cell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

