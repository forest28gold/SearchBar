import UIKit

class TableViewCell1: UITableViewCell {
    
    @IBOutlet weak var TermLbl: UILabel!
    @IBOutlet weak var DefinitionLbl: UILabel!
    @IBOutlet weak var TypesLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        //accessoryType = UITableViewCellAccessoryType.disclosureIndicator

        // Configure the view for the selected state
    }
    
   }
