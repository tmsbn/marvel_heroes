//
//  AvengersListController.swift
//  avengers
//
//  Created by Thomas Binu on 4/14/16.
//  Copyright © 2016 TMS. All rights reserved.
//

import UIKit

class HeroesListController: UITableViewController, UISearchResultsUpdating{
    
    var heroes = [Hero]()
    var tableData = [Hero]()
    var searchController:UISearchController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableData = getData()
        setupSearchView()
    }
    
    @IBAction func toggleEditingMode(sender: AnyObject) {
        if tableView.editing{
            tableView.setEditing(false, animated: true)
            navigationItem.rightBarButtonItem?.title = "Edit"
        }else{
            tableView.setEditing(true, animated: true)
            navigationItem.rightBarButtonItem?.title = "Done"
        }
    }
    
    func getData() -> ([Hero]){
        
        //Avengers
        heroes.append(Hero(name: "Iron Man", gender: .Male, power: "Iron Man Suit"))
        heroes.append(Hero(name: "Thor", gender: .Male, power: "Mjoinr"))
        heroes.append(Hero(name: "Captain America", gender: .Male, power: "Shield"))
        heroes.append(Hero(name: "Hawkeye", gender: .Male, power: "Arrow"))
        heroes.append(Hero(name: "Hulk", gender: .Male, power: "Transformation"))
        
        //Guardians
        heroes.append(Hero(name: "Star Lord", gender: .Male, power: "Iron Man Suit", team: .Guardian))
        heroes.append(Hero(name: "Gamora", gender: .Male, power: "Mjoinr",  team: .Guardian))
        heroes.append(Hero(name: "Drax", gender: .Male, power: "Shield",  team: .Guardian))
        heroes.append(Hero(name: "Groot", gender: .Male, power: "Arrow", team: .Guardian))
        
        //Defenders
        heroes.append(Hero(name: "Jessica Jones", gender: .Male, power: "Strength", team: .Defender))
        heroes.append(Hero(name: "Luke Cage", gender: .Male, power: "Unbreakable Skin",  team: .Defender))
        heroes.append(Hero(name: "Daredevil", gender: .Male, power: "Sonic hearing",  team: .Defender))
        heroes.append(Hero(name: "Iron Fist", gender: .Male, power: "Martial Arts", team: .Defender))
        
        return heroes
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count: Int = 0
        let team: TEAM
        
        switch section {
        case 0:
            team = .Avenger
        case 1:
            team = .Guardian
        case 2:
            team = .Defender
        default:
            team = .Avenger
        }
        
        for hero in tableData{
            if hero.team == team{
                count += 1
            }
        }
        return count
        
        
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return DesignConstants.TableRowHeight
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let index = getAbsolutePositionFromIndexPath(indexPath)
        
        cell.textLabel?.text = tableData[index].name
        cell.detailTextLabel?.text = tableData[index].power
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete{
            heroes.removeAtIndex(getAbsolutePositionFromIndexPath(indexPath))
            tableData = heroes
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
    }
    
    
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title:String?
        
        switch section {
        case 0:
            title = TEAM.Avenger.rawValue
        case 1:
            title = TEAM.Guardian.rawValue
        case 2:
            title = TEAM.Defender.rawValue
        default:
            title = ""
        }
        
        return title! + "s"
        
    }
    
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return TEAM.count
    }
    
    func setupSearchView(){
        
        //let searchController = UISearchController(searchResultsController: nil) //This does not work!
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = searchController.searchBar
        
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        
        if let searchText = searchController.searchBar.text{
            if searchText.characters.count > 0 {
                
                tableData =  heroes.filter({(hero) -> Bool in
                    return hero.name.containsString(searchText) ? true : false
                })
            }else{
                tableData = heroes
            }
            
            tableView.reloadData()
            
        }
    }
    
    func getAbsolutePositionFromIndexPath(indexPath:NSIndexPath) -> (Int){
        
        var index = indexPath.row
        
        for i in 0..<indexPath.section{
            index += self.tableView(tableView, numberOfRowsInSection: i)
        }
        
        return index

    }
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
