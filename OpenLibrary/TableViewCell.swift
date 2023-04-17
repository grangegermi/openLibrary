//
//  TableViewCell.swift
//  OpenLibrary
//
//  Created by Даша Волошина on 17.04.23.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    static let id  = "TableViewCell"
    
    var image = UIImageView()
    var title = UILabel()
    var dataPublished = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(dataPublished)
        createConstraints()
        
        image.contentMode = .scaleAspectFill
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.numberOfLines = 0
    }
    
    func createConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(40)
            make.left.equalTo(contentView.snp.left).inset(10)
            make.width.equalTo(100)
            make.height.equalTo(100)
            
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(10)
            make.left.equalTo(contentView.snp.left).inset(140)
            make.width.equalTo(200)
            make.height.equalTo(80)
        }
        
        dataPublished.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(70)
            make.left.equalTo(contentView.snp.left).inset(140)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
