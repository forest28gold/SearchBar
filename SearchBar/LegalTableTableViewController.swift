import UIKit

enum selectedScope2:Int {
    case Types = 2
}

class LegalTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    let searchBar = UISearchBar()
    
    let initialDataAry:[Model] = Model.generateModelArray()
    var dataAry:[Model] = Model.generateModelArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarSetup()
        filterTableView(ind: searchBar.selectedScopeButtonIndex, text: "Japan" )
        self.dataAry.sort(by: { $0.imageTerm < $1.imageTerm })

        
    }
    
    func searchBarSetup() {
        searchBar.selectedScopeButtonIndex = 2
    }
    
    
    func filterTableView(ind: Int, text: String) {
        switch ind {
        case selectedScope2.Types.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
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
        
        
        return cell
    }
    
    //add delegate method for pushing to new detail controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.dataModel = dataAry[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    
}
