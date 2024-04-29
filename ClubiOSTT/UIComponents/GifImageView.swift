//
//  GifImageView.swift
//  Club
//
//  Created by Adrien Carvalot on 08/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

/** Custom UIImageView allowing to play a GIF. */
class GifImageView: UIImageView {

    // MARK: - IBInspectables
    
    /** The name of the GIF to play. */
    @IBInspectable var gifName: String = ""
    
    /** The name of the GIF to play. */
    @IBInspectable var animated: Bool = true
    
    /** The GIF's animation speed as `Double`, the closer it is from `0.0` the slower it is,
     and the higher it is faster it is. The default speed is `600.0`.  */
    @IBInspectable var animationSpeed: Double = 600.0
    
    // MARK: - Properties
    
    /** The activity indicator view used when loading a new gif. */
    private var activityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    /** The placeholder view used when loading a new gif. */
    private var placeholderView: UIView?
    
    /** Overrides the image property to reset the loading state if needed. */
    override var image: UIImage? {
        didSet {
            if isLoading { isLoading = false }
        }
    }
    
    /** Indicates whether a gif is being loaded and updates the loading state accordingly. */
    private var isLoading = false {
        didSet { handleLoadingState() }
    }
    
    // MARK: - Initializers

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    init(frame: CGRect, gifName: String? = nil) {
        super.init(frame: frame)
        
        if let gifName = gifName {
            self.gifName = gifName
        }
        
        setupView()
    }
    
    // MARK: - Private functions

    /** Common setup design */
    private func setupView() {
        activityIndicatorView.frame = frame
        placeholderView = UIView(frame: frame)
        placeholderView?.backgroundColor = UIColor.custom.gray02
        placeholderView?.fitInView(self)
        activityIndicatorView.fitInView(self)
        isLoading = false
    }
    
    /** Start or stop the loading and show or hide the loading placeholder view. */
    private func handleLoadingState() {
        isLoading ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
        placeholderView?.isHidden = !isLoading
    }
    
    // MARK: - Open functions
    
    /** Start the GIF animation. */
    open func startGifAnimation() {
        loadGif(named: gifName, animated: true)
    }
    
    /** Stop the GIF animation. */
    open func stopGifAnimation() {
        loadGif(named: gifName, animated: false)
    }
    
    /**
     Load a GIF from its local file name.
     - parameter named: The name of the GIF file.
     - parameter animated: Indicates whether the GIF should be animated or not.
     - parameter animationSpeed: The GIF's animation speed, only used if GIF is animated.
     */
    open func loadGif(named: String, animated: Bool? = nil, animationSpeed: Double? = nil) {
        
        /** Stores the GIF file name in order to be able to stop/play it later */
        gifName = named
//        
//        image = UIImage.gifImage(named: named,
//                                 animated: animated ?? self.animated,
//                                 animationSpeed: animationSpeed ?? self.animationSpeed)
    }
    
    /**
     INFO: ⚠️ Play/pause not available for GIF loaded from data, need to work on it ⚠️
     
     Load a GIF from a given data.
     - parameter data: The data of the GIF.
     - parameter animated: Indicates whether the GIF should be animated or not.
     - parameter animationSpeed: The GIF's animation speed, only used if GIF is animated.
     */
    open func loadGif(data: Data, animated: Bool? = nil, animationSpeed: Double? = nil) {
//        image = UIImage.gifImageFromData(data,
//                                         animated: animated ?? self.animated,
//                                         animationSpeed: animationSpeed ?? self.animationSpeed)
    }
    
    /**
     INFO: ⚠️ Play/pause not available for GIF loaded from URL, need to work on it ⚠️
     
     Load a GIF from a given remote or local URL (loads while loading data if remote).
     - parameter url: The url of the GIF (remote or local).
     - parameter animated: Indicates whether the GIF should be animated or not.
     - parameter animationSpeed: The GIF's animation speed, only used if GIF is animated.
     */
    open func loadGif(url: URL, animated: Bool? = nil, animationSpeed: Double? = nil) {
        isLoading = true
        
        var media: Data?
        let group = DispatchGroup()
        group.enter()

        DispatchQueue.global().async {
            media = try? Data(contentsOf: url)
            group.leave()
        }

        group.notify(queue: DispatchQueue.main) {
            guard let gifData = media else { return }
            
            self.loadGif(data: gifData, animated: animated, animationSpeed: animationSpeed)
            self.isLoading = false
        }
    }
    
}
