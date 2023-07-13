//
//  MoviesCollectionViewCell.swift
//  Synechron-Assignment
//
//  Created by Prachi Gade on 13/07/23.
//

import UIKit
import SDWebImage

class MoviesCollectionViewCell: UICollectionViewCell {

    static let identifier = "MoviesCollectionViewCell"
    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 5.0
        layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).withAlphaComponent(0.8).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 20.0
        layer.masksToBounds = true
    }
    
    func setupMovieCell(movie: Movies, imageUrl: String) {
        self.movieTitleLbl.text = movie.title
        let url = imageUrl+(movie.poster_path ?? "")
        self.posterImgView.sd_setImage(with: URL(string: url))
    }
}
