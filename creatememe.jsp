<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<!--M.Laya,V.Snehita
1602-18-737-018
1602-18-737-046
Team No-10
-->

<head>
    <title>Meme Generator</title>
    <!-- Stylesheets Included -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap-4.4.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="style.css" />
    <!--Script Files are included-->
    <script src="bootstrap-4.4.1-dist/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="script.js"></script>
</head>

<body>
    <!-- Title Of the Project-->
    <div class="media pt-1 md-5" id="title">
    <i class="fa fa-arrow-left" style="font-size:25px;color:whitesmoke" onclick="location.href='index.html'"></i>
        <div class="media-body text-center">
            <h5 id="text" class="text-center">CREATE YOUR MEME</h5>
        </div>
    <p style="font-size:23px;color:whitesmoke">
        &nbsp;&nbsp;Hello,
		<%= request.getParameter("username")%>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
    </div>
    <br>

    <div class="container">
        <!-- Left Part of Page Start -->
        <div class="row">
            <div class="col-md-5">
                <!-- BEGIN: Canvas rendering of generated Meme -->
                <canvas id="meme" class="img-thumbnail img-fluid">
                    Unfortunately your browser does not support canvas.
                </canvas>
                <!-- END: Canvas rendering of generated Meme -->

                <!-- Download Link Start -->
                <a href="#" class="btn btn-primary btn-block" id="download_meme" style="margin-top:10px;">
                    <i class="fa fa-download" aria-hidden="true"></i> Download
                </a>

                <img id="start-image" src="image.jpg" alt="" />
                <!-- Download Link End -->
            </div>
            <!-- Left Part of Page End -->
            <!-- Right Part of Page Start -->
            <div class="col-md-7">
                <!-- Input for uploading the image : START -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon">Image:&emsp;</span>
                            <input type="file" accept="images/*"  class="form-control" id="imgInp" />
                            &emsp; <button class="btn" id="clear"><i class="fa fa-close"></i> Clear</button>
                        </div>

                    </div>
                </div>
                <!-- Input for uploading the image : END -->
                <!-- Inputting the top Text-1 : START -->
                <label class="control-label" for="text_top">Text 1:</label>
                <div class="form-group">
                    <input type="text" class="form-control ui-widget-content" value="Text 1" id="text_top" />
                </div>
                <!-- Inputting the top Text-1 : END -->

                <!-- Sliders for Text-1 offset from top,left and font size: START -->
                <div class="form-group">
                    <div class="row">
                        <label class="control-label col-md-4" for="text_top_offset">Offset from Top:</label>
                        <div class="col-md-6">
                            <input style="width:100%" class="slider" id="text_top_offset" type="range" min="0" max="500" value="40" />
                        </div>
                        <label class="control-label col-md-4" for="text_topleft_offset">Offset from Left:</label>
                        <div class="col-md-6">
                            <input style="width:100%" class="slider" id="text_topleft_offset" type="range" min="0" max="500" value="250" />
                        </div>
                        <label class="control-label col-md-4" for="text_font1_size">Font size:</label>
                        <div class="col-md-6">
                            <input style="width:100%" class="slider" id="text_font1_size" type="range" min="0" max="500" value="20" />
                        </div>
                    </div>
                </div>
                <!-- Slider for Text-1  : END -->

                <p>&nbsp;</p>

                <!-- Inputting the Text-2 : START -->
                <label class="control-label" for="text_bottom">Text 2:</label>
                <div class="form-group">
                    <input type="text" class="form-control" value="Text 2" id="text_bottom" />
                </div>
                <!-- Inputting the Text-2 : END -->

                <!-- Sliders for Text-2 offset from top,left and font size: START -->
                <div class="form-group">
                    <div class="row">
                        <label class="control-label col-md-4" for="text_bottom_offset">Offset from Top:</label>
                        <div class="col-md-6">
                            <input style="width:100%" class="slider" id="text_bottom_offset" type="range" min="0" max="500" value="450" />
                        </div>
                        <label class="control-label col-md-4" for="text_bottomleft_offset">Offset from Left:</label>
                        <div class="col-md-6">
                            <input style="width:100%" class="slider" id="text_bottomleft_offset" type="range" min="0" max="500" value="250" />
                        </div>
                        <label class="control-label col-md-4" for="text_font2_size">Font size:</label>
                        <div class="col-md-6">
                            <input style="width:100%" class="slider" id="text_font2_size" type="range" min="0" max="500" value="20" />
                        </div>
                    </div>
                </div>
                <!-- Sliders for Text-2  : END -->
                <!-- Inputting the middle text : START -->
                <p>&nbsp;</p>
                <label class="control-label" for="text_middle">Text 3:</label>
                <div class="form-group">
                    <input type="text" class="form-control" value="Text 3" id="text_middle" />
                </div>
                <!-- Inputting the middle text : END -->

                <!-- Sliders for Text-3 offset from top,left and font size: START -->
                <div class="form-group">
                    <div class="row">
                        <label class="control-label col-md-4" for="text_middle_offset">Offset from Top:</label>
                        <div class="col-md-6">
                            <input style="width:100%" class="slider" id="text_middle_offset" type="range" min="0" max="500" value="250" />
                        </div>
                        <label class="control-label col-md-4" for="text_middleleft_offset">Offset from Left:</label>
                        <div class="col-md-6">
                            <input style="width:100%" class="slider" id="text_middleleft_offset" type="range" min="0" max="500" value="250" />
                        </div>
                        <label class="control-label col-md-4" for="text_font3_size">Font size:</label>
                        <div class="col-md-6">
                            <input style="width:100%" class="slider" id="text_font3_size" type="range" min="0" max="500" value="20" />
                        </div>

                    </div>
                </div>
                <!-- Sliders for Text-3 : END -->
                <!-- Customization Card : START -->
                <div class="card">

                    <!-- Options Card Header : START -->
                    <div class="card-header">
                        <i class="fa fa-cogs" aria-hidden="true"></i> &nbsp; Customize
                    </div>
                    <!-- Options Card Header : END -->

                    <!-- Options Card Body : START -->
                    <div class="card-body" id="card-body">

                        <div class="row">
                            <div class="col-md-12">


                                <div class="form-group">

                                    <div class="row">
                                        <!-- Slider For Meme-Size : START -->
                                        <label class="control-label col-md-3" for="canvas_size">Meme size:</label>
                                        <div class="col-md-7">
                                            <input style="width:100%" class="slider" id="canvas_size" type="range" min="0" max="1000" value="500" />
                                        </div>
                                        <!-- Slider For Meme-Size : END -->
                                        <!-- Slider For Font Color : START -->
                                        <label class="control-label col-md-3" for="canvas_size">Font Color:</label>
                                        <div class="col-md-7">
                                            <input type="color" id="myColor" value="#000000">
                                        </div>
                                        <!-- Slider For Font Color : END -->
                                        <!-- Slider For Font Family : START -->
                                        <label class="control-label col-md-3" for="canvas_size">Font Family:</label>
                                        <div class="col-md-7">
                                            <select class="form-select" onclick="changeFont()" id="fonts" aria-label="Sans-serif">
                                                <option selected>Choose Font Style</option>
                                                <option value="Serif">Serif</option>
                                                <option value="Sans-serif">Sans-serif</option>
                                                <option value="Monospace">Monospace</option>
                                                <option value="Cursive">Cursive</option>
                                                <option value="Fantasy">Fantasy</option>
                                            </select>
                                        </div>
                                        <!-- Slider For Font Family : END -->
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Options Card Body : END -->
                </div>
                <!-- Customize Card : END -->
            </div>
            <!-- Right Part of page : END -->
        </div>
    </div>
</body>

</html>
