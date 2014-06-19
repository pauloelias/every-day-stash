$( document ).ready( function ()
{
    //create tabs for custom field groups
    if ( $( '#tabs' ).length > 0 )
    {
        $( '#tabs' ).tabs();
    }

    //assign ZeroClipboard.swf path; the pathToZeroClipboardSwf var is set in javascript code outside this file
    ZeroClipboard.setMoviePath( pathToZeroClipboardSwf );

    //setup single ZeroClipboard object for all our elements
    var clip = new ZeroClipboard.Client();
    clip.setHandCursor( true );

    //assign a common mouseover function for all elements using jQuery
    $( 'a.copy' ).mouseover( function ()
    {
        //set the clip text to our innerHTML
        clip.setText( $( this ).children( 'span.copyText' ).html() );
        $( this ).children( 'span.clipTip' ).children( 'span.clipText' ).html( 'Click to Copy' );

        //reposition the movie over our element or create it if this is the first time
        if ( clip.div )
        {
            clip.receiveEvent( 'mouseout', null );
            clip.reposition( this );
        }
        else
        {
            clip.glue( this );
        }

        //gotta force these events due to the Flash movie moving all around. This insures the CSS effects are properly updated.
        clip.receiveEvent( 'mouseover', null );
    });

    //add a complete event to let the user know the text was copied
    clip.addEventListener( 'complete', function ()
    {
        $( 'span.clipText' ).html( 'Copied!' );
    });
});