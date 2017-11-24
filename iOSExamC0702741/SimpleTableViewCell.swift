//
//  SimpleTableViewCell.swift
//  iOSExamC0702741
//
//  Created by Deepesh Mehta on 2017-11-23.
//  Copyright © 2017 Deepesh Mehta. All rights reserved.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {
    let firstLineLabel = UILabel()
    let secondLineLabel = UILabel()
    let thirdLineLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(firstLineLabel)
        self.contentView.addSubview(secondLineLabel)
        self.contentView.addSubview(thirdLineLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        firstLineLabel.frame = CGRect(x: 20, y: 0, width: 70, height: 30)
        secondLineLabel.frame = CGRect(x: 20, y: 35, width: 70, height: 30)
        thirdLineLabel.frame = CGRect(x: 20, y: 70, width: 70, height: 30)
    }

}
