//
//  NewsCell.swift
//  LadoTsivtsivadze_28
//
//  Created by Ladolado3911 on 6/8/21.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var time: UILabel!
    
    func configure(object obj: NewsModel) {
        imgView.kf.setImage(with: obj.imgUrl)
        title.text = obj.title
        author.text = obj.author
        time.text = obj.time
    }
}
