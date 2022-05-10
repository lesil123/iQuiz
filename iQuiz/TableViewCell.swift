//
//  TableViewCell.swift
//  iQuiz
//
//  Created by 李乐思 on 5/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var subjectTitle: UILabel!
    @IBOutlet weak var subjectDescriptions: UILabel!
    @IBOutlet weak var subjectImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
