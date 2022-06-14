//
//  MovieCell.swift
//  TableViewPractice
//
//  Created by minsson on 2022/06/14.
//

import UIKit

class EmojiCell: UITableViewCell {

    @IBOutlet weak var emojiImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
