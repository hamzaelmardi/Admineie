
<%@  taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="modal" id="loader_modal" style="background: transparent !important" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width: 200px !important">
        <div class="modal-content" style="background: transparent !important;border: none;position: absolute;top: 215px;">
            <div class="modal-body p-0">
                <img src="${pageContext.request.contextPath}/assets/images/Spinner_200.gif" class="w-100 rounded mx-auto d-block" style="background: transparent !important;">
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<!-- base:js -->
<script src="${pageContext.request.contextPath}/assets/vendors/base/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
<!-- endinject -->
<!-- plugin js for this page -->

<script src="${pageContext.request.contextPath}/assets/libs/jquery/jquery.ui.touch-punch-improved.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/jquery/jquery-ui.min.js"></script>
<!-- End plugin js for this page -->
<script src="${pageContext.request.contextPath}/assets/vendors/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/progressbar.js/progressbar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/chartjs-plugin-datalabels/chartjs-plugin-datalabels.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/justgage/raphael-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/justgage/justgage.js"></script>
<!-- Custom js for this page-->
<script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>

<%--sweetAlert--%>
<script src="${pageContext.request.contextPath}/assets/js/sweet-alert.min.js"></script>

<%--VALIDATION FORM--%>
<script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/validationTwins.js"></script>

<script src="${pageContext.request.contextPath}/assets/css/datepicker/vitalets-bootstrap-datepicker-c7af15b/js/bootstrap-datepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.datetimepicker.full.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/popper.js"></script>




<script type="text/javascript">
 function go_stat() {
  window.location="pages/statistique/statistique.html"
 }
</script>








<!----My JS ----------------------------------------------------------------------------------------------->

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/MyStyle/SmoothScroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/MyStyle/pcoded.min.js"></script>
<!-- custom js -->
<script src="${pageContext.request.contextPath}/assets/MyStyle/vartical-layout.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/MyStyle/custom-dashboard.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/MyStyle/script.min.js"></script>

<!------------End My JS--------------------------->



<!-- calendar -->
<script src="${pageContext.request.contextPath}/assets/libs/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/fullcalendar/dist/locale-all.js"></script>
<!-- Bootstrap tether Core JavaScript -->


<!-- End Calendar -->


<script src="${pageContext.request.contextPath}/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/cal-init.js"></script>


<%--DataTable%--%>
<script src="${pageContext.request.contextPath}/assets/js/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.fixedColumns.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/toolbar/jquery.toolbar.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/toolbar/custom-toolbar.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>


<script src="${pageContext.request.contextPath}/assets/js/select2.min.js" ></script>
<!----Youssef ---->

<script src="${pageContext.request.contextPath}/assets/js_login/custom.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/anime.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/MyJs.js"></script>



<!--------End Js---->
<script>

$(document).ready(function () {

	$('#notificationDropdown').click(
	   function () {
	       //show its submenu
	       $("#mohaVi").stop().slideToggle(500);    
	   }
	);

	});
	
	
    $(document).ready(function() {
        $(".select2").select2();
        $('.dropdown-toggle').dropdown();
        

        if(location.hash == "#ressources"){

            $([document.documentElement, document.body]).animate({
                scrollTop: $("#ressources").offset().top
            }, 2000);

        }
    });

    function frm_search(){
        if($("#zone_search:visible").length!=0)
            $("#zone_search:visible").hide('slow');
        else
            $("#zone_search").show('slow');
    }
</script>
<script type="text/javascript">

    function checkUser(){

        return $.ajax({
            dataType: 'text',
            url: "/api/checkUser"
        });



    }
    function getFunction(url){
        /* var m=checkUser();

         m.done(function(result){
              var  t=result;

              if(t=="oui"){ */
        $.ajax({
            type : "GET",
            url :url,
            success : function(data) {

                $(".mp").html(data);
            },
            error : function(response) {
                alert("error")
            }
        });/* }
		  else if(t=="non"){
				window.location.href="/index";
			}}) */
    }
    function getFunctionParam(url){


        $.ajax({
            type : "GET",
            url :url,
            success : function(data) {

                $(".mpParam").html(data, function() {
                });

            },
            error : function(response) {
                alert("error")
            }
        });
    }

    function getFunctionType(url){


        $.ajax({
            type : "GET",
            url :url,
            success : function(data) {

                $(".mpParam").html(data, function() {

                });

            },
            error : function(response) {
                alert("error")
            }
        });


    }



    function getFunctionPage(url){

        $.ajax({
            type : "GET",
            url :url,
            success : function(data) {

                $(".content-wrapper").html(data);
            },
            error : function(response) {
                alert("error")
            }
        });


    }

    function validate(evt) {
        var theEvent = evt || window.event;

        // Handle paste
        if (theEvent.type === 'paste') {
            key = event.clipboardData.getData('text/plain');
        } else {
            // Handle key press
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
        }
        var regex = /[0-9]|\,|\./;
        if( !regex.test(key) ) {
            theEvent.returnValue = false;
            if(theEvent.preventDefault) theEvent.preventDefault();
        }
    }


    $('#myCarousel').carousel({
        interval: 4000
    });

    $('.carousel .item').each(function () {
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));

        for (var i = 0; i < 4; i++) {
            next = next.next();
            if (!next.length) {
                next = $(this).siblings(':first');
            }

            next.children(':first-child').clone().appendTo($(this));
        }
    });
    <c:if test="${pageContext.response.locale!='ar' }">
    //Youssef
    var textWrapper = document.querySelector('.ml6 .letters');
    textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    anime.timeline({loop: true})
        .add({
            targets: '.ml6 .letter',
            translateY: ["1.1em", 0],
            translateZ: 0,
            duration: 750,
            delay: (el, i) => 50 * i
        }).add({
        targets: '.ml6',
        opacity: 0,
        duration: 1000,
        easing: "easeOutExpo",
        delay: 1000
    });
    </c:if>
</script>
<script src="${pageContext.request.contextPath}/assets/js/addObject.js"></script>
<script>
    $(document).ready(function() {
        $('#DataTables_Table_1').DataTable().clear().destroy();
    });
    $(document).ready(function() {
        $('#example2').DataTable().destroy();
    });
    $(document).ready(function() {
        $('#DataTables_Table_0').css("width","100%");
    });
    $(document).ready(function() {
        $('#DataTables_Table_0_filter').css("display","none");
    });
    
    function getfunction(){
    	
    	$.ajax({
    		url: '/api/getNoti',
    		type: 'POST',
    		data: {},
    	})
    	.done(function(data) {
    		console.log("success");
    		console.log(data);
    		$("#mohaVi").html(data);
    	})
    	.fail(function() {
    		console.log("error");
    	})
    	.always(function() {
    		console.log("complete");
    	});
    	

    }

    $(document).ready(function() {
        $(".form-select").removeClass('form-select bg-light').addClass('custom-select');
    });
</script>
<script>
    function OpenRetour(card1,card2){
        $("#auto").removeClass().addClass("container-fluid mb-5 "+card2);
        $("#"+card1).hide();
        $("."+card2).show();
        getDocument(card2);
        getImage(card2);
        getVideo(card2);
    }
    function OpenRetour1(card1,card2){
        $("#auto1").removeClass().addClass("row mt-5 "+card2);
        $("#"+card1).hide();
        $("."+card2).show();
        getDocument(card2);
        getImage(card2);
        getVideo(card2);
    }
    function OpenAuto(card1,card2){
        $("#"+card1).hide();
        $("#"+card2).show();
    }
    function OpenAuto1(card1,card2){
        $("#"+card1).hide();
        $("#"+card2).show();
    }
    function getDocument(type){
        $.ajax({

            type: "GET",
            enctype: 'multipart/form-data',
            url: "/getAccordionDocument/" + type,
            data: {},
            success: function (response) {
                $("#doc").html(response);
            },
            error: function () {

            }
        });
    }
    function getImage(type){
        $.ajax({

            type: "GET",
            enctype: 'multipart/form-data',
            url: "/getAccordionImage/" + type,
            data: {},
            success: function (response) {
                $("#img").html(response);
            },
            error: function () {

            }
        });
    }
    function getVideo(type){
        $.ajax({

            type: "GET",
            enctype: 'multipart/form-data',
            url: "/getAccordionVideo/" + type,
            data: {},
            success: function (response) {
                $("#mesvideo").html(response);
            },
            error: function () {

            }
        });
    }



    $(document).ready(function() {

// Gets the video src from the data-src on each button

        var $videoSrc;
        $('.video-btn').click(function() {
            $videoSrc = $(this).data( "src" );
        });
        console.log($videoSrc);



// when the modal is opened autoplay it
        $('#videoModal').on('shown.bs.modal', function (e) {

// set the video src to autoplay and not to show related video. Youtube related video is like a box of chocolates... you never know what you're gonna get
            $("#video").attr('src',$videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0" );
        })



// stop playing the youtube video when I close the modal
        $('#videoModal').on('hide.bs.modal', function (e) {
            // a poor man's stop video
            $("#video").attr('src',$videoSrc);
        })






// document ready
    });

    function goToLien_menu(url,id){

        $.ajax({
            type: "GET",
            enctype: 'multipart/form-data',
            url : "/api/isAccessible/"+id,
            data: {},
            success : function(response) {
               if(response==="non"){
                   swal("Avertissement ! ","vous n'avez pas le droit d'accès de cette lien","warning");
               }
               else{
                   window.location.href=url;
               }
            },
            error : function() {
                alert("error");
            }
        });
    }


</script>



