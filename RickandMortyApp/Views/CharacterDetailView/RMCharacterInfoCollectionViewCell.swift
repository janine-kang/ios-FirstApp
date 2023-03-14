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
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    private let titleLable:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    private let iconImageView: UIImageView = {
        let icon = UIImageView()
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
            
            valueLable.bottomAnchor.constraint(equalTo: titleContainerView.topAnchor),
            valueLable.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 10),
            valueLable.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valueLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        valueLable.text = nil
        titleLable.text = nil
        iconImageView.image = nil
        iconImageView.tintColor = .label
        titleLable.textColor = .label
    }
    
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        titleLable.text = viewModel.title
        valueLable.text = viewModel.displayValue
        iconImageView.image = viewModel.iconImage
        iconImageView.tintColor = viewModel.tintColor
        titleLable.textColor = viewModel.tintColor
    }
}
