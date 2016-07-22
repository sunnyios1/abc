//
//  ViewController.swift
//  Proj1
//
//  Created by IndianRenters on 22/07/16.
//  Copyright © 2016 Comax Solutions. All rights reserved.
//
var i = 0;
import UIKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["Выбранные", "Стройматериалы", "Отоплени", "Обои","Выбранные", "Стройматериалы", "Отоплени", "Обои"]

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
   
    
    override func viewWillAppear(animated: Bool) {
        title = "Карта скидок"
        img.hidden = true;
        lbl1.hidden = true;
        lbl2.hidden = true;
        lbl3.hidden = true;
        lbl4.hidden = true;
    }
    
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 88.0/255.0, green: 199.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn(sender: AnyObject) {
        
        if i==0 {
        
            img.hidden = false;
            lbl1.hidden = false;
            lbl2.hidden = false;
            lbl3.hidden = false;
            lbl4.hidden = false;
            i+=1
        }
        else{
            
            img.hidden = true;
            lbl1.hidden = true;
            lbl2.hidden = true;
            lbl3.hidden = true;
            lbl4.hidden = true;
            i-=1
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.lbl.text = self.items[indexPath.item]
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

}

