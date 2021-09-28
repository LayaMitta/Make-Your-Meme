$(document).ready(function () {

    var canvas = document.getElementById('meme');
    var ctx = canvas.getContext('2d');

    // Main drawing function
    function clearMeme() {
        var img = document.getElementById('start-image');
        var fontSize1 = parseInt($('#text_font1_size').val());
        var fontSize2 = parseInt($('#text_font2_size').val());
        var fontSize3 = parseInt($('#text_font3_size').val());
        var memeSize = parseInt($('#canvas_size').val());
     //   $('#start-image').width(memeSize);
       // $('#start-image').height(memeSize);


        // set form field properties
        $('#text_top_offset').attr('max', memeSize);
        $('#text_bottom_offset').attr('max', memeSize);
        $('#text_middle_offset').attr('max', memeSize);

        // initialize canvas element with desired dimensions

        canvas.width = memeSize;
        canvas.height = memeSize;
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        var croppingDimension = img.height;
        if (img.width < croppingDimension) {
            croppingDimension = img.width;
        }
        ctx.drawImage(img, 0, 0, croppingDimension, croppingDimension, 0, 0, memeSize, memeSize);
    };

    function drawMeme() {
        var img = document.getElementById('start-image');
        var fontSize1 = parseInt($('#text_font1_size').val());
        var fontSize2 = parseInt($('#text_font2_size').val());
        var fontSize3 = parseInt($('#text_font3_size').val());
        var memeSize = parseInt($('#canvas_size').val());

        $("#start-image").attr('height', memeSize);
        $("#start-image").attr('width', memeSize);
        // set form field properties
        $('#text_top_offset').attr('max', memeSize);
        $('#text_bottom_offset').attr('max', memeSize);
        $('#text_middle_offset').attr('max', memeSize);

        // initialize canvas element with desired dimensions
        canvas.width = memeSize;
        canvas.height = memeSize;
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        // calculate minimum cropping dimension
        var croppingDimension = img.height;
        if (img.width < croppingDimension) {
            croppingDimension = img.width;
        }
        ctx.drawImage(img, 0, 0, croppingDimension, croppingDimension, 0, 0, memeSize, memeSize);

        // settings for writing text
        ctx.lineWidth = 1;

        ctx.strokeStyle = 'black';
        ctx.fillStyle = $('#myColor').val();
        ctx.textAlign = 'center';

        var maxTextAreaWidth = memeSize * 0.85;

        // text 1
        var text1 = $('#text_top').val();

        ctx.font = fontSize1 + 'px ' + $('#fonts').val();
        x = parseInt($('#text_topleft_offset').val());
        y = parseInt($('#text_top_offset').val());


        writeText(ctx, text1, x, y, maxTextAreaWidth, fontSize1 + 10);

        // text 2
        var text2 = $('#text_bottom').val();

        ctx.font = fontSize2 + 'px ' + $('#fonts').val();
        x = parseInt($('#text_bottomleft_offset').val());
        y = parseInt($('#text_bottom_offset').val());
        writeText(ctx, text2, x, y, maxTextAreaWidth, fontSize2 + 10);
        //text3
        var text3 = $('#text_middle').val();

        ctx.font = fontSize3 + 'px ' + $('#fonts').val();
        x = parseInt($('#text_middleleft_offset').val());
        y = parseInt($('#text_middle_offset').val());
        writeText(ctx, text3, x, y, maxTextAreaWidth, fontSize3 + 10);

    };

    // function to write text on Image
    function writeText(ctx, text, x, y, maxWidth, lineHeight) {
        var words = text.split(' ');
        var line = '';
        var lines = [];

        for (var n = 0; n < words.length; n++) {
            var testLine = line + ' ' + words[n];
            var testWidth = ctx.measureText(testLine).width;
            if (testWidth > maxWidth) {
                lines.push(line);
                line = words[n] + ' ';
            } else {
                line = testLine;
            }
        }

        // pushing the last line
        lines.push(line);

        // displaying the text on canvas
        for (var k = 0; k < lines.length; k++) {
            ctx.strokeText(lines[k], x, y + lineHeight * k);
            ctx.fillText(lines[k], x, y + lineHeight * k);

        }

    };

    // function to change the image according to the one selected by user
    $("#imgInp").change(function () {
        var input = this;

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#start-image').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }

        window.setTimeout(function () {
            drawMeme()
        }, 500);
    });



    // register event listeners
    $(document).on('change keydown keyup', '#text_top', function () {

        drawMeme();

    });
    $(document).on('change keydown keyup', '#text_bottom', function () {
        drawMeme();
    });
    $(document).on('change keydown keyup', '#text_middle', function () {
        drawMeme();
    });
    $(document).on('input change', '#text_top_offset', function () {
        $('#text_top_offset__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#text_topleft_offset', function () {
        $('#text_topleft_offset__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#text_bottom_offset', function () {
        $('#text_bottom_offset__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#text_bottomleft_offset', function () {
        $('#text_bottomleft_offset__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#text_middle_offset', function () {
        $('#text_middle_offset__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#text_middleleft_offset', function () {
        $('#text_middleleft_offset__val').text($(this).val());
        drawMeme();
    });

    $(document).on('input change', '#text_font1_size', function () {
        $('#text_font1_size__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#text_font2_size', function () {
        $('#text_font2_size__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#text_font3_size', function () {
        $('#text_font3_size__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#text_line_height', function () {
        $('#text_line_height__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#text_stroke_width', function () {
        $('#text_stroke_width__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#canvas_size', function () {
        $('#canvas_size__val').text($(this).val());
        drawMeme();
    });
    $(document).on('input change', '#myColor', function () {
        $('#myColor__val').text($(this).val());
        drawMeme();
    });

    $('#clear').click(function () {
        clearMeme();

    });
    $('#fonts').click(function () {
        $('#fonts__val').text($(this).val());
        drawMeme();

    });

    $('#download_meme').click(function (e) {
        $(this).attr('href', canvas.toDataURL());
        $(this).attr('download', 'meme.png');
    });

    // replace this with a server-side processing method
    $('#download_meme').click(function (e) {
        $(this).attr('href', canvas.toDataURL());
        $(this).attr('download', 'meme.png');
    });

    // init at startup
    window.setTimeout(function () {
        drawMeme();
    }, 100);

});
