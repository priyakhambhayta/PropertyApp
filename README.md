# PropertyApp

Architecture: MVVM

Orientation Support: Portrait and Landscape

This demo contains Property Listing Screen and basic Description Screen. All property images are shown in Scrollable Slideshow and will display placeholder image incase if image is not available to display. Property Description screen will be presented with App Store like card transition Animation.


Cocoa Pods:

<b> 1. ImageSlideshow/SDWebImage: </b>

To show property images like Slide show 

Changes done in Framework files in order to resolve issue of not showing placeholder image when image is nil. It is not recommended to perform direct changes in Framework files because they are not persistant and will disappear when pod file is updated. 

Implement following changes to show placeholder image when Image is not available. 

Go to <b>ImageSlideshowItem.swift</b> file

Replace <b>loadImage()</b> with following method

```
public func loadImage() {
	if self.imageView.image == nil && !isLoading {
		isLoading = true
		imageReleased = false
		activityIndicator?.show()
		image.load(to: self.imageView) {[weak self] image in
			// set image to nil if there was a release request during the image load
			if let imageRelease = self?.imageReleased, imageRelease {
				self?.imageView.image = nil
			} else {
				self?.imageView.image = image
				if image == nil {
					self?.imageView.image = #imageLiteral(resourceName: "ImgNotAvailable")
				}
			}
			self?.activityIndicator?.hide()
			//self?.loadFailed = image == nil
			self?.isLoading = false
			self?.setNeedsLayout()
		}
	}
}
```

<b>2. appstore-card-transition</b>

To implement App Store like custom transition between List and Detail view

Use ```UICollectionView``` to show list of properties and not ```UITableView``` because this transition is supported for Collection view only. 

<b>3. NotificationBannerSwift</b>

To show Banner view for errors
