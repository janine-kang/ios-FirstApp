//
//  RMCharacterInfoCollectionViewCell.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/13.
//

import UIKit

class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"
    
    private let valueLable:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Earth"
        label.font = .systemFont(ofSize: 22, weight: .light)
        return label
    }()
    private let titleLable:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    private let iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "globe.americas")
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    private let titleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubViews(titleContainerView, valueLable, iconImageView)
        titleContainerView.addSubview(titleLable)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33),
            
            titleLable.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            titleLable.leftAnchor.constraint(equalTo: titleContainerView.leftAnchor),
            titleLable.rightAnchor.constraint(equalTo: titleContainerView.rightAnchor),
            titleLable.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            
            valueLable.heightAnchor.constraint(equalToConstant: 30),
            valueLable.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 10),
            valueLable.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valueLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        valueLable.text = nil
        titleLable.text = nil
        iconImageView.image = nil
        
    }
    
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        
    }
}
