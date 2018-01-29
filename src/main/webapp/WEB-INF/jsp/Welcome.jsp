<%@ include file = "header.jsp" %>
<div id="demo" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="../images/CUT3M37NQM.jpg" alt="Carry" width="1400" height="550">
            <div class="carousel-caption">
                <h1>Welcome!</h1>
                <br><br><br>
                <h3>Italian pizza</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img src="../images/CUTsauteed-shrimp-topped-with-roasted-red-pepper-sauce-in-pan_2.jpg" alt="Shrimps"
                 width="1400" height="550">
            <div class="carousel-caption">
                <h1>Welcome!</h1>
                <br><br><br>
                <h3>Sauteed shrimps</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img src="../images/CUTharissa.jpg" alt="Harissa" width="1400" height="550">
            <div class="carousel-caption">
                <h1>Welcome!</h1>
                <br><br><br>
                <h3>Harissa fries</h3>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>
<%@ include file = "footer.jsp" %>