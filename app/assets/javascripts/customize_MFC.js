
$(function(){
    if($("#devise_notice").text() != ""){
        createDialog("<p class='heading3 alert-message'><b>"+ $("#devise_notice").text() +"</b></p>");
        $("#devise_notice").remove();
    }
    if($("#devise_alert").text() != ""){
        createDialog("<p class='heading3 alert-message'><b>"+ $("#devise_alert").text() +"</b></p>");
        $("#devise_alert").remove();
    }
    function createDialog( message) {
        $.colorbox({
            html : message,
            transition: 'fade',
            width: 600,
            height: 130,
            scrolling: false
        });
        setTimeout(function() {
            $.colorbox.close();
        }, 2300);
    }

});

 

$(function() {

    $(".flexslider").flexslider({ 
     animation: "slide"
       }); 

});


$(function() {
    $('#event_start_time').timeEntry().change(function() { 
        var log = $('#log'); 
        log.val(log.val() + ($('#event_start_time').val() || 'blank') + '\n'); 
    });


     $('#event_end_time').timeEntry().change(function() { 
        var log = $('#log'); 
        log.val(log.val() + ($('#event_end_time').val() || 'blank') + '\n'); 
    });
});

// $(function() {
//     $('#event_start_time').timepicker();
//     $('#event_end_time').timepicker();
// });


$(function() {


    $( "#event_start_date" ).datepicker({
        showOn: "button",
        buttonImage: "/assets/calendar_icon.jpg",
        buttonImageOnly: true,
        changeMonth: true,
        changeYear: true,
        numberOfMonths: 1,
        dateFormat: $.datepicker.ISO_8601,
        onSelect: function( selectedDate ) {
            $( "#event_end_date" ).datepicker( "option", "minDate", selectedDate );
        }
    });

    $( "#event_end_date" ).datepicker({
        showOn: "button",
        buttonImage: "/assets/calendar_icon.jpg",
        buttonImageOnly: true,
        defaultDate: "+0w",
        changeMonth: true,
        changeYear: true,
        numberOfMonths: 1,
        dateFormat: $.datepicker.ISO_8601,
        onSelect: function( selectedDate ) {
            $( "#event_start_date" ).datepicker( "option", "maxDate", selectedDate );
        }
    }); 

});

$(function() {
    $("#new_category_check").click(function() {
      if ($(this).is(":checked")) {
        $("#event_category_id").prop("disabled", true);
        $("#add_new_category").show()
      } 

      else {
        $("#event_category_id").prop("disabled", false);
        $("#add_new_category").hide()
      }
    });


    $("#new_activity_check").click(function() {
      if ($(this).is(":checked")) {
        $("#add_new_activity").show()
      } 
      else {     
        $("#add_new_activity").hide()
      }
    });
});




