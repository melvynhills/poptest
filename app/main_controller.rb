class MainController < UIViewController

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    image = UIImage.imageNamed("test")
    @imageView = UIImageView.alloc.initWithImage(image)
    view.addSubview(@imageView)

    gesture = UIPanGestureRecognizer.alloc.initWithTarget(self, action: "didPan:")
    # gesture.delegate = self
    view.addGestureRecognizer(gesture)

    gesture = UIRotationGestureRecognizer.alloc.initWithTarget(self, action: "didRotate:")
    gesture.delegate = self
    view.addGestureRecognizer(gesture)

    gesture = UIPinchGestureRecognizer.alloc.initWithTarget(self, action: "didPinch:")
    gesture.delegate = self
    view.addGestureRecognizer(gesture)
  end

  def gestureRecognizer(gestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer:otherGestureRecognizer)
    true
  end

  def didPan(recognizer)
    velocity = recognizer.velocityInView(view)

    positionAnimation = POPSpringAnimation.animationWithPropertyNamed(KPOPLayerPosition)
    positionAnimation.velocity = NSValue.valueWithCGPoint(velocity)
    positionAnimation.springBounciness = 5.0
    @imageView.layer.pop_addAnimation(positionAnimation, forKey:"positionAnimation")
  end

  def didRotate(recognizer)
    velocity = CGPointMake(recognizer.velocity, 0)

    springAnimation = POPSpringAnimation.animationWithPropertyNamed(KPOPLayerRotation)
    springAnimation.velocity = NSValue.valueWithCGPoint(velocity)
    springAnimation.springBounciness = 5.0
    @imageView.layer.pop_addAnimation(springAnimation, forKey:"rotationAnimation")
  end

  def didPinch(recognizer)
    velocity = CGPointMake(recognizer.velocity, recognizer.velocity)

    sizeAnimation = POPSpringAnimation.animationWithPropertyNamed(KPOPLayerScaleXY)
    sizeAnimation.velocity = NSValue.valueWithCGPoint(velocity)
    sizeAnimation.springBounciness = 5.0
    @imageView.layer.pop_addAnimation(sizeAnimation, forKey:"sizeAnimation")
  end

end
