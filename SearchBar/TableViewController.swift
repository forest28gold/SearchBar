
import UIKit

enum selectedScope20:Int {
    case Term = 0
    case Definition = 1
    case Types = 2

}

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:80))
    let searchController = UISearchController(searchResultsController: nil)


    var initialDataAry:[Model] = Model.generateModelArray()
    var dataAry:[Model] = Model.generateModelArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarSetup()
        let numEntries = dataAry.count
        print(numEntries)
        self.dataAry.sort(by: { $0.imageTerm < $1.imageTerm })
        Timer.scheduledTimer(timeInterval: 2 , target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: true)
  
}

    func timeToMoveOn() {
        
              }
    

    func searchBarSetup() {
        
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Model","Make","Country"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        searchBar.placeholder = "Search based on Model, Make, or Country"
        searchBar.showsCancelButton = false
        searchBar.showsBookmarkButton = false
        searchBar.tintColor = UIColor(red: 76/255, green: 127/255, blue: 250/255, alpha: 1.0)
        searchBar.layer.borderWidth = 0
        self.tableView.tableHeaderView = searchBar
        searchBar.barTintColor = UIColor.white
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        searchBar.isTranslucent = false
        
    }
    
    
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataAry = initialDataAry
            self.dataAry.sort(by: { $0.imageTerm < $1.imageTerm })
            self.tableView.reloadData()
        }else {
            dataAry = initialDataAry
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
            self.dataAry.sort(by: { $0.imageTerm < $1.imageTerm })
            self.tableView.reloadData()
            
        }
    }

        
    
    
   func filterTableView(ind:Int,text:String) {
        switch ind {
        case selectedScope20.Term.rawValue:
            //fix of not searching when backspacing
                dataAry = dataAry.filter({ (mod) -> Bool in
                    return mod.imageTerm.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScope20.Definition.rawValue:
            //fix of not searching when backspacing
            dataAry = dataAry.filter({ (mod) -> Bool in
                return mod.imageDefinition.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScope20.Types.rawValue:
            //fix of not searching when backspacing
            dataAry = dataAry.filter({ (mod) -> Bool in
                return mod.imageTypes.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        default:
            print("no type")
        }
    }
    
    

   override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
            
          

            
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
            
            self.tableView.reloadData()
            
            tableView.setEditing(false, animated: true)
            
            print("favorite button tapped")
            
            
        }
        
        favorite.backgroundColor = UIColor(red: 76/255, green: 127/255, blue: 250/255, alpha: 1.0)
        
        
        return [favorite]
    }
    
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        // you need to implement this method too or you can't swipe to display the actions
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataAry.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell1
        
        let model = dataAry[indexPath.row]
        
        
        cell.TermLbl.text = model.imageTerm
        cell.TypesLbl.text = model.imageTypes
        cell.DefinitionLbl.text = model.imageDefinition
        cell.accessoryType = .none

        return cell
    }
    
   
    
    //add delegate method for pushing to new detail controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.dataModel = dataAry[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}

