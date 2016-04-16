//
//  DetailsViewController.swift
//  marvel_heroes
//
//  Created by Thomas Binu on 4/15/16.
//  Copyright © 2016 TMS. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    var hero:Hero!
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var detailsTable: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var heroDetails = [HeroDetail]()
    var images = ["iron_man.jpeg","iron_man.jpeg","iron_man.jpeg","iron_man.jpeg","iron_man.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroDetails.append(HeroDetail(label: "Name", value: hero.name))
        heroDetails.append(HeroDetail(label: "Power", value: hero.power))
        heroDetails.append(HeroDetail(label: "Gender", value: hero.gender.rawValue))
        heroDetails.append(HeroDetail(label: "Team", value: hero.team.rawValue))
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("detail_cell", forIndexPath: indexPath) as! DetailCell
        
        cell.itemLabel.text = heroDetails[indexPath.row].label
        cell.valueLabel.text = heroDetails[indexPath.row].value
        
        return cell
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroDetails.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Profile"
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ImageViewController).pageIndex
        if index != NSNotFound && index < images.count - 1 {
            index! += 1
            
            return getViewControllerAtIndex(index)
        }
        return nil
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ImageViewController).pageIndex
        if index != NSNotFound && index > 0 {
            index! -= 1
            
            return getViewControllerAtIndex(index)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first{
                let index = (currentViewController as! ImageViewController).pageIndex
                pageControl.currentPage = index
                
            }
        }
        
    }
    
    
    func getViewControllerAtIndex(index: NSInteger) -> ImageViewController
    {
        // Create a new view controller and pass suitable data.
        let imageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ImageViewController") as! ImageViewController
        imageViewController.pageIndex = index
        imageViewController.imageName = images[index]
        
        return imageViewController
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "pageViewControllerSegue"{
            let pageViewController = segue.destinationViewController as! UIPageViewController
            
            let imageViewController = getViewControllerAtIndex(0)
            pageViewController.setViewControllers([imageViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
            
            pageViewController.dataSource = self
            pageViewController.delegate = self
            
            
        }
        
    }
    
    
    
    
    
    
}
