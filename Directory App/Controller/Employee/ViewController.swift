//
//  ViewController.swift
//  Directory App
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var employeeTableView: UITableView!
    
    private var employeeViewModel : EmployeesViewModel!
    
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.employeeViewModel =  EmployeesViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData, configureCell: { (cell, evm) in

            if let url = URL(string: evm.avatar ?? "") {
                do {
                    let data: Data = try Data(contentsOf: url)
                    cell.employeeImg.image = UIImage(data: data)
                } catch {
                    // error handling
                }
            }
            
            cell.employeeNameLabel.attributedText =
                NSMutableAttributedString()
                    .bold("\(evm.firstName ?? "") \(evm.lastName ?? "")\n")
                    .bold("Email:")
                    .normal(" \(evm.email ?? "")\n")
                    .bold("Job Title:")
                    .normal(" \(evm.jobtitle ?? "")")
        })
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }


}

