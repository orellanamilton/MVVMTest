//
//  MoviesTableViewCell.swift
//  MVVMTest
//
//  Created by Milton Orellana on 26/05/2021.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    static let identifier = "MoviesCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Title"
        label.numberOfLines = 0

        return label
    }()
    
    let releaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Release Date"
        
        return label
    }()
    
    let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let voteStar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(red: 239/255.0, green: 206/255.0, blue: 57/255.0, alpha: 1)
        return imageView
    }()
    
    let voteAverage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "Vote Average"
        return label
    }()
    
    func configure(for movie: ResultItem) {
        let vote = String(movie.vote_average)
        let image = "https://image.tmdb.org/t/p/original\(movie.poster_path)"
        poster.setImage(imageURL: image)
        titleLabel.text = movie.title
        releaseDate.text = movie.release_date
        voteAverage.text = vote
        voteStar.image = UIImage(systemName: "star.fill")
    }

    func layout() {
        addSubview(titleLabel)
        addSubview(poster)
        addSubview(releaseDate)
        addSubview(voteAverage)
        addSubview(voteStar)
        
        poster.heightAnchor.constraint(equalToConstant: 175).isActive = true
        poster.widthAnchor.constraint(equalToConstant: 100).isActive = true
        poster.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        poster.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        voteStar.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10).isActive = true
        voteStar.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
        voteAverage.leftAnchor.constraint(equalTo: voteStar.rightAnchor, constant: 2).isActive = true
        voteAverage.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
        releaseDate.leftAnchor.constraint(equalTo: voteAverage.rightAnchor, constant: 10).isActive = true
        releaseDate.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
    }
    
}
