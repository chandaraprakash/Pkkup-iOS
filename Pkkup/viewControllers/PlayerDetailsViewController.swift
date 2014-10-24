//
//  PlayerDetailsViewController.swift
//  Pkkup
//
//  Created by Jonathan Tsai on 10/4/14.
//  Copyright (c) 2014 Pkkup. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: PkkupViewController, UITableViewDataSource, UITableViewDelegate {

    // TODO: wire outlets from views here
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerLocationLabel: UILabel!
    @IBOutlet weak var playerSportsLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var gamesTableView: UITableView!
    @IBOutlet weak var followUnfollowButton: UIButton!
    @IBOutlet weak var gamesSegment: UISegmentedControl!

    var player: PkkupPlayer! {
        willSet(newPlayer) {
            self.playerNameLabel.text = newPlayer.name!
            self.biographyLabel.text = newPlayer.biography!
            HTKImageUtils.sharedInstance.displayImageUrl(newPlayer.getGravatarImageUrl(), imageView: playerImageView)
            self.navigationItem.title = newPlayer.name!
        }

        didSet(oldPlayer) {
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamesTableView.dataSource = self
        gamesTableView.delegate = self
        gamesTableView.rowHeight = UITableViewAutomaticDimension
        gamesTableView.estimatedRowHeight = 80.0
        //customize player image
        self.playerImageView.layer.cornerRadius = 5
        self.playerImageView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onFollow(sender: AnyObject) {
        if(followUnfollowButton.touchInside) {
            followUnfollowButton.setTitle("Unfollow", forState: UIControlState.Normal)
        } else {
            followUnfollowButton.setTitle("Follow", forState: UIControlState.Normal)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _GAMES.count
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if(gamesSegment.titleForSegmentAtIndex(gamesSegment.selectedSegmentIndex) == "Upcoming Games") {
//                return "Upcoming Games"
//        } else if(gamesSegment.titleForSegmentAtIndex(gamesSegment.selectedSegmentIndex) == "Past Locations") {
//            return "Past Locations"
//        } else {
//            return "Recent Games"
//        }
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = gamesTableView.dequeueReusableCellWithIdentifier("GamesCell") as GamesCell
        //cell.sportNameLabel.text = "Basket Ball"
        //cell.sportLocationLabel.text = "700 N First Street, Sunnyvale"
        var game = _GAMES[indexPath.row]
        cell.game = game
        return cell
        
    }

}
