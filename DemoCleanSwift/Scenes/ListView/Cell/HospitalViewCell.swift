//
//  HospitalViewCell.swift
//  DemoCleanSwift
//
//  Created by passakorn.siangsanan on 1/4/2564 BE.
//

import UIKit

class HospitalViewCell: UITableViewCell {
    
    @IBOutlet weak var lblHospitalID: UILabel!
    @IBOutlet weak var lblHospitalName: UILabel!
    @IBOutlet weak var lblHospitalLocation: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(_ viewModel: DemoListModel.HospitalList.ViewModel.Hospital) {
        selectionStyle = UITableViewCell.SelectionStyle.none
        lblHospitalID.text = viewModel.id
        lblHospitalName.text = viewModel.hospitalName
        lblHospitalLocation.text = viewModel.HospitalLocation
        
    }

}
