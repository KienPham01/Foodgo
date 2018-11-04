//
//  ShoeDetailTableViewController.swift
//  Nike+Research
//
//  Created by Duc Tran on 3/19/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class ShoeDetailTableViewController : UITableViewController
{
    var shoe: Shoe!
    
    @IBOutlet weak var shoeImagesHeaderView: ShoeImagesHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = shoe.name
        
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tabBarController?.tabBar.items![1].badgeValue = "2"
    }
    
    struct Storyboard {
        static let showImagesPageVC = "ShowImagesPageViewController"
        static let shoeDetailCell = "ShoeDetailCell"
        static let productDetailCell = "ProductDetailsCell"
//        static let suggestionCell = "SuggestionCell"
        static let buyButtonCell = "BuyButtonCell"
    }
    
    @IBAction func BuyButton(_ sender: Any) {
        
        print("spent all money")
        
        
        
    }
    
    
    // MARK : - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showImagesPageVC {
            if let imagesPageVC = segue.destination as? ShoeImagesPageViewController {
                imagesPageVC.images = shoe.images
                imagesPageVC.pageViewControllerDelegate = shoeImagesHeaderView
            }
        }
    }
}

extension ShoeDetailTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 0 - shoe detail cell
        // 1 - buy button
        // 2 - shoe full details button cell
        // 3 - you might like this cell
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.shoeDetailCell, for: indexPath) as! ShoeDetailCell
            cell.shoe = shoe
            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.buyButtonCell, for: indexPath)
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailCell, for: indexPath)
            
            return cell
        }
        
        return UITableViewCell()
    }

}







