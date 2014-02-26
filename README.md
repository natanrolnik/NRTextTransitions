NRTextTransitions
=================

#Basic, block based, text transitions

NRTextTransitions is a category in UIView that makes easier handling animated text transitions for UILabel, UITextView and UITextField. As the standard +[UIView animateWithDuration:animations:] is not able to animate non-animatable properties, and text, font and textColor properties of UILabel, UITextView and UITextField, are non-animatable, you need to use CATransition to do so with animation.
 
NRTextTransitions uses a similar API to the standard UIView class methods, encapsulating the changes passed in the `animations` parameter block. In order to apply the transitions to the objects mentioned in this block, you **MUST** create an array, add the objects to this array, and pass it in the 'textObjects' parameter.

#Example