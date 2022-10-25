//
//  EmployeeTableViewCell.swift
//  MVVM_New
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var employeeImg: UIImageView!
    @IBOutlet weak var employeeNameLabel: UILabel!
    
    var employee : EmployeeData? {
        didSet {
            
            if let url = URL(string: employee?.avatar ?? "") {
                do {
                    let data: Data = try Data(contentsOf: url)
                    self.employeeImg.image = UIImage(data: data)
                } catch {
                    // error handling
                }
            }
            
//            employeeIdLabel.text = employee?.id
            employeeNameLabel.text = employee?.firstName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
