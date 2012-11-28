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


