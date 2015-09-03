//
//  FeedTVC.swift
//  InTown
//
//  Created by Ronald Hernandez on 9/3/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

import UIKit

class FeedTVC: UITableViewController {

    @IBOutlet weak var postButton: UIButton!

override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()


    //change the button color 
    self.postButton.backgroundColor = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 1.0/255.0, alpha: 1.0)

    }
        //add image to navigation bar.
override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(true)

////    //change the image of the titleview for navbar
//    // 1
//    var nav = self.navigationController?.navigationBar
//    // 2
//
//   // nav?.barStyle = UIBarStyle.Black
//
//   // nav?.tintColor = UIColor.yellowColor()
//    // 3
//    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//    imageView.contentMode = .ScaleAspectFit
//    // 4
//    let image = UIImage(named: "cityOnlyLogo")
//    imageView.image = image
//    // 5
//    navigationItem.titleView = imageView


   

    self.navigationController!.navigationBar.barStyle = UIBarStyle.BlackTranslucent
    self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()







}






    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
    
    
    
}
