# Created by Joel Eisner 2/08/16
# Modified by Shrey Choudhary

# 12 Hour Format: "date +%-I,%M,%-S"
# 24 Hour Format: "date +%-H,%M,%-S"
command: "date +%-H,%M,%-S"

# Refresh every second
refreshFrequency: 1000

# Create the DOM
render: () -> """
    <div class="container">
        <div class="col col-1">
            <div class="row row-1">
                <div class="dot"></div>
            </div>
            <div class="row row-2">
                <div class="dot"></div>
            </div>
            <div class="row row-3">
                <div class="dot"></div>
            </div>
            <div class="row row-4">
                <div class="dot"></div>
            </div>
        </div>
        <div class="col col-2">
            <div class="row row-1">
                <div class="dot"></div>
            </div>
            <div class="row row-2">
                <div class="dot"></div>
            </div>
            <div class="row row-3">
                <div class="dot"></div>
            </div>
            <div class="row row-4">
                <div class="dot"></div>
            </div>
        </div>
        <div class="col col-3">
            <div class="row row-1">
                <div class="dot"></div>
            </div>
            <div class="row row-2">
                <div class="dot"></div>
            </div>
            <div class="row row-3">
                <div class="dot"></div>
            </div>
            <div class="row row-4">
                <div class="dot"></div>
            </div>
        </div>
        <div class="col col-4">
            <div class="row row-1">
                <div class="dot"></div>
            </div>
            <div class="row row-2">
                <div class="dot"></div>
            </div>
            <div class="row row-3">
                <div class="dot"></div>
            </div>
            <div class="row row-4">
                <div class="dot"></div>
            </div>
        </div>
        <div class="col col-5">
            <div class="row row-1">
                <div class="dot"></div>
            </div>
            <div class="row row-2">
                <div class="dot"></div>
            </div>
            <div class="row row-3">
                <div class="dot"></div>
            </div>
            <div class="row row-4">
                <div class="dot"></div>
            </div>
        </div>
        <div class="col col-6">
            <div class="row row-1">
                <div class="dot"></div>
            </div>
            <div class="row row-2">
                <div class="dot"></div>
            </div>
            <div class="row row-3">
                <div class="dot"></div>
            </div>
            <div class="row row-4">
                <div class="dot"></div>
            </div>
        </div>
    </div>
"""

update: (output, domEl) ->
    time = output.split(',')
    hours = parseInt time[0]
    minutes = parseInt time[1]
    seconds = parseInt time[2]
    sepDig = (num, pos) ->
        stringNum = num.toString()
        newInt = stringNum.charAt pos
        parseInt newInt
    # Format Hours
    if hours < 10
        hPos1 = 0
        hPos2 = sepDig(hours, 0)
    else
        hPos1 = sepDig(hours, 0)
        hPos2 = sepDig(hours, 1)
    # Format Minutes
    if minutes < 10
        mPos1 = 0
        mPos2 = sepDig(minutes, 0)
    else
        mPos1 = sepDig(minutes, 0)
        mPos2 = sepDig(minutes, 1)
    # Format Seconds
    if seconds < 10
        sPos1 = 0
        sPos2 = sepDig(seconds, 0)
    else
        sPos1 = sepDig(seconds, 0)
        sPos2 = sepDig(seconds, 1)
    # Fill dots function
    fillDots = (el, num) ->
        if num is 0
            el.find('.dot').removeClass 'fill'
        else if num is 1
            el.find('.row').not('.row-4').find('.dot').removeClass 'fill'
            el.find('.row-4').find('.dot').addClass 'fill'
        else if num is 2
            el.find('.row').not('.row-3').find('.dot').removeClass 'fill'
            el.find('.row-3').find('.dot').addClass 'fill'
        else if num is 3
            el.find('.row').not('.row-3, .row-4').find('.dot').removeClass 'fill'
            el.find('.row-3').find('.dot').addClass 'fill'
            el.find('.row-4').find('.dot').addClass 'fill'
        else if num is 4
            el.find('.row').not('.row-2').find('.dot').removeClass 'fill'
            el.find('.row-2').find('.dot').addClass 'fill'
        else if num is 5
            el.find('.row').not('.row-2, .row-4').find('.dot').removeClass 'fill'
            el.find('.row-2').find('.dot').addClass 'fill'
            el.find('.row-4').find('.dot').addClass 'fill'
        else if num is 6
            el.find('.row').not('.row-2,.row-3').find('.dot').removeClass 'fill'
            el.find('.row-2').find('.dot').addClass 'fill'
            el.find('.row-3').find('.dot').addClass 'fill'
        else if num is 7
            el.find('.row').not('.row-2, .row-3, .row-4').find('.dot').removeClass 'fill'
            el.find('.row-2').find('.dot').addClass 'fill'
            el.find('.row-3').find('.dot').addClass 'fill'
            el.find('.row-4').find('.dot').addClass 'fill'
        else if num is 8
            el.find('.row').not('.row-1').find('.dot').removeClass 'fill'
            el.find('.row-1').find('.dot').addClass 'fill'
        else if num is 9
            el.find('.row').not('.row-1, .row-4').find('.dot').removeClass 'fill'
            el.find('.row-1').find('.dot').addClass 'fill'
            el.find('.row-4').find('.dot').addClass 'fill'

    fillDots($('.col-1'), hPos1)
    fillDots($('.col-2'), hPos2)
    fillDots($('.col-3'), mPos1)
    fillDots($('.col-4'), mPos2)
    fillDots($('.col-5'), sPos1)
    fillDots($('.col-6'), sPos2)

# Basic Style to center output
# 38.3
# 43.2
style: """
    top:800px;
    left:425px;
    * {
        box-sizing:border-box;
    }
    .container {
        width:240px;
        height:160px;
    }
    .col {
        float:left;
        width:40px;
        height:160px;
    }
    .row {
        position:relative;
        width:40px;
        height:40px;
    }
    .dot {
        position:absolute;
        top:50%;
        left:50%;
        margin-top:-10px;
        margin-left:-10px;
        width:20px;
        height:20px;
        border-radius:0%;
        border:2px solid rgba(208,207,196,0.1);
    }
    .dot.fill {
        border:none;
        background-color:rgba(208,207,196,1.0);
    }
"""
