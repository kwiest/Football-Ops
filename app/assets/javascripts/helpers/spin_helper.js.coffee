#= require 'spin'

defaultOpts = {
    lines: 12
    length: 24
    width: 8
    radius: 24
    corners: 1
    rotate: 0
    color: '#000'
    speed: 1.0
    trail: 64
    shadow: true
    hwaccel: false
}

jQuery.fn.spin = (passedOps) ->
    opts = Batman.mixin {}, defaultOpts, passedOps
    @each ->
        $this = $(this)
        data = $this.data()
        if data.spinner
            data.spinner.stop()
            delete data.spinner
        data.spinner = new Spinner($.extend(color: $this.css('color'), opts)).spin(this) if passedOps != false

    this
