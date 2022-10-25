//
//  RoomTableViewCell.swift
//  Directory App
//
import UIKit

class RoomTableViewCell: UITableViewCell {
    

    @IBOutlet weak var roomLabel: UILabel!
    
    var room : RoomData? {
        didSet {
            
            roomLabel.text = room?.id
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
