<script type="application/javascript">
    var app = angular.module('kswaughsLiveScore', ['ngStomp']);

    app.controller('LiveController', function ($stomp, $scope) {

        $scope.myres = [];

        $stomp.connect('/call', {})
            .then(function (frame) {
                console.log("123");
                var subscription = $stomp.subscribe('/user/1/callBackInfo',
                    function (payload, headers, res) {
                        console.log(payload);
                        $("#waiterIsComingModal").modal("toggle");
                    });

                $stomp.send('/app/waiterCallBack', '');
            });
    });

</script>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong>Holy guacamole!</strong> You should check in on some of those fields below.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div id="demo" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="../images/CUT3M37NQM.jpg" alt="Carry" class="fluid" width="100%">
            <div class="carousel-caption">
                <h1>Welcome!</h1>
                <br><br><br>
                <h3>Italian pizza</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img src="../images/CUTsauteed-shrimp-topped-with-roasted-red-pepper-sauce-in-pan_2.jpg" alt="Shrimps"
                 class="fluid" width="100%">
            <div class="carousel-caption">
                <h1>Welcome!</h1>
                <br><br><br>
                <h3>Sauteed shrimps</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img src="../images/CUTharissa.jpg" alt="Harissa" class="fluid" width="100%">
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
<div class="container">
    <div class="liveScore" ng-app="kswaughsLiveScore" ng-controller="LiveController">
        <p>Cricket - Live Score</p>
        <ul>
            <li ng-repeat="x in myres">{{$index+1}} - {{x.name}} - <b>{{x.runs}}</b> runs (<b>{{x.balls}}</b>balls)</li>
        </ul>
    </div>
    <div class="row">
        <button type="button" class="btn btn-warning btn-lg btn-block">Waiter</button>
        <a href="\cooker" class="btn btn-warning btn-lg btn-block">Cook</a>
        <a href="\admin" class="btn btn-warning btn-lg btn-block">Administrator</a>
        <a href="\menu\soups" class="btn btn-warning btn-lg btn-block">User</a>

    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="waiterIsComingModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Modal Methods</h4>
            </div>
            <div class="modal-body">
                <p>The <strong>show</strong> method shows the modal and the <strong>hide</strong> method hides the modal.</p>
            </div>
        </div>

    </div>
</div>
<style>
    .row {
        padding: 15pt;
    }

    .btn-block {
        padding: 10pt;
    }
</style>