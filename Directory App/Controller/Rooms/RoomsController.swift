//
//  RoomsController.swift
//  Directory App
//

import UIKit

class RoomsController: UIViewController {

    @IBOutlet weak var roomTableView: UITableView!
    
    private var roomsViewModel : RoomsViewModel!
    
    private var dataSource : RoomsTableViewDataSource<RoomTableViewCell,RoomData>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.roomsViewModel =  RoomsViewModel()
        self.roomsViewModel.bindRoomsViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = RoomsTableViewDataSource(cellIdentifier: "RoomTableViewCell", items: self.roomsViewModel.roomData, configureCell: { (cell, data) in

          
            
           
//            cell.roomLabel.text = "\(data.id ?? "")    isOccupied : \(data.isOccupied ?? true)\n       Max Occupancy: \(data.maxOccupancy ?? 0)"
            
            
            cell.roomLabel.attributedText =
                NSMutableAttributedString()
                .bold("Room No:")
                .normal(" \(data.id ?? "")\n")
                    .bold("Availability:")
                    .normal(" \(data.isOccupied == true ? "YES" : "NO")\n")
                    .bold("Max Occupancy:")
                    .normal(" \(data.maxOccupancy ?? 0)")
        })
        
        DispatchQueue.main.async {
            self.roomTableView.dataSource = self.dataSource
            self.roomTableView.reloadData()
        }
    }


}
