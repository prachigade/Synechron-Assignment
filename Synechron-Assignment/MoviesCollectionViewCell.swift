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
    
    func setupMovieCell(movie: Movies, imageUrl: String) {
        self.movieTitleLbl.text = movie.title
        let url = imageUrl+movie.poster_path
        self.posterImgView.sd_setImage(with: URL(string: url))
    }
}
