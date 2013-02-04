$(document).ready(function(){

    $('#event_form_submit').click(function(){
        var count = 0

        if ($('#event_title').val() == ''){
            $('#em_title').html('Title Cannot Be Blank');
            count = count + 1;
        }
//        if ($('#category').val() == null){
//            $('#em_category').html('Please Select a type of event1');
//            count = count + 1;
//        }

//        if ($('#category').val() == null && $('#new_category_name').val() == '' && $('#new_category_description').val() == '' ){
//            $('#em_category').html('Please Select a type of event');
//            count = count + 1;
//        }

        

//        if ($('#category').val()!= ''&& ( $('#new_category_name').val() != '' || $('#new_category_description').val() != '' )){
//            $('#em_category').html('Event can be of one type only');
//            count = count + 1;
//        }
//
//        if ($('#category').val() == null && $('#new_category_name').val()== '' && $('#new_category_description').val()!= '' ){
//            $('#em_new_category').html('Please enter title for the new type of event');
//            count = count + 1;
//        }
//
//        if ($('#category').val() == null && $('#new_category_name').val()!= '' && $('#new_category_description').val()== '' ){
//            $('#em_new_category').html('Please enter description for the new type of event');
//            count = count + 1;
//        }


        if ($('#event_title').val().length > 50 ){
            $('#em_title').html('Title is Too Long');
            count = count + 1;
        }

        if ($('#event_description').val() == ''){
            $('#em_description').html('Description Cannot Be Blank');
            count = count + 1;
        }

        if ($('#event_description').val().length > 500){
            $('#em_description').html('Description is Too Long');
            count = count + 1;
        }

        if ($('#event_category').val() == ''){
            $('#em_category').html('Category Cannot Be Blank');
            count = count + 1;
        }

        if ($('#event_start_date').val() == ''){
            $('#em_start_date').html('Please Select a date from the calender');
            count = count + 1;
        }

        if ($('#event_end_date').val() == ''){
            $('#em_end_date').html('Please Select a date from the calender');
            count = count + 1;
        }

        if ($('#activities').val() == null && $('#new_activity_title').val() == '' && $('#new_activity_description').val() == '' ){
            $('#em_activities').html('Please Select a Activity');
            count = count + 1;
        }

        if ($('#new_activity_title').val()!= '' && $('#new_activity_description').val()== '' ){
            $('#em_new_activity').html('Please enter description for the new activity');
            count = count + 1;
        }

        if ($('#new_activity_title').val()== '' && $('#new_activity_description').val()!= '' ){
            $('#em_new_activity').html('Please enter title for the new activity');
            count = count + 1;
        }

        if (count != 0){
            return false;
        }
    });

    $('#activity_form_submit').click(function(){
        var count = 0
        if ($('#activity_title').val() == ''){
            $('#em_activity_title').html('Title Cannot Be Blank');
            count = count + 1;
        }

        if ($('#activity_description').val() == ''){
            $('#em_activity_description').html('Description Cannot Be Blank');
            count = count + 1;
        }

        if (count !=0 ){
            return false;
        }
    });

    $('#expense_form_submit').click(function(){
        var count = 0
        if ($('#expense_description').val() == ''){
            $('#em_expense_description').html('Description Cannot Be Blank');
            count = count + 1;
        }

        if ($('#expense_amount').val() == ''){
            $('#em_expense_amount').html('Amount Cannot Be Blank');
            count = count + 1;
        }

        if (count !=0 ){
            return false;
        }
    });


});