
$(function(){
    if($("#devise_notice").text() != ""){
        createDialog("<h3 class='heading3 alert-message'>"+ $("#devise_notice").text() +"</h3>");
        $("#devise_notice").remove();
    }
    if($("#devise_alert").text() != ""){
        createDialog("<h3 class='heading3 alert-message'>"+ $("#devise_alert").text() +"</h3>");
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
        }, 1400);
    }

});

 

$(function() {

    $(".flexslider").flexslider({ 
     animation: "slide"
       }); 

});


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

    $("#activities").multiselect({
        searchable: true,
        noneSelectedText: 'Select Activities'
    }).multiselectfilter();

    // $("#event_category_id").multiselect({
    //      searchable: true,
    //      multiple: false,
    //      noneSelectedText: 'Select A Category'
    // }).multiselectfilter();

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




