$(document).ready(function(){

    $('#event_form_submit').click(function(){

        event_form_reset();
        var count = 0
     
        if ($('#event_title').val() == ''){                
            document.getElementById('em_title').innerHTML='Title Cannot be blank';
            count = count + 1;
        }


        if ($('#event_title').val().length > 50 ){
            document.getElementById('em_title').innerHTML='Title is Too Long';      
            count = count + 1;
        }


        if ($("#new_category_check").is(":not(:checked)") && $('#event_category_id').val() == null ) {
            document.getElementById('em_category').innerHTML='Please Select a Category';    
            count = count + 1;
        }

        if ($("#new_category_check").is(":checked")) {

            if ($('#new_category_name').val() == '' && $('#new_category_description').val()== '' ){
                document.getElementById('em_category').innerHTML='Please enter description and title for the new category';
                count = count + 1;
            }
    
            if ($('#new_category_name').val()!= '' && $('#new_category_description').val()== '' ){
                document.getElementById('em_category').innerHTML='Please enter description for the new category';
                count = count + 1;
            }

            if ($('#new_category_name').val()== '' && $('#new_category_description').val()!= '' ){
                document.getElementById('em_category').innerHTML='Please enter title for the new category';
                count = count + 1;
            }
        }
    
        if ($('#event_description').val() == ''){
            document.getElementById('em_description').innerHTML='Description Cannot Be Blank';
            count = count + 1;
        }

        if ($('#event_description').val().length > 500){
            document.getElementById('em_description').innerHTML='Description is Too Long';
            count = count + 1;
        }

        if ($('#event_start_date').val() == ''){
            document.getElementById('em_start_date').innerHTML='Please Select a date from the calender';
            count = count + 1;
        }

        if ($('#event_end_date').val() == ''){
            document.getElementById('em_end_date').innerHTML='Please Select a date from the calender';
            count = count + 1;
        }

        if ($("#new_activity_check").is(":not(:checked)") && $('#activities').val() == null ) {
            document.getElementById('em_activities').innerHTML='Please Select a Activity';    
            count = count + 1;
        }

        if ($("#new_activity_check").is(":checked")) {

            if ($('#activities').val() == null && $('#new_activity_title').val() == '' && $('#new_activity_description').val() == '' ){
                document.getElementById('em_activities').innerHTML='Please Select a Activity';
                count = count + 1;
            }

            if ($('#new_activity_title').val()!= '' && $('#new_activity_description').val()== '' ){
                document.getElementById('em_activities').innerHTML='Please enter description for the new activity';
                count = count + 1;
            }

            if ($('#new_activity_title').val()== '' && $('#new_activity_description').val()!= '' ){
                document.getElementById('em_activities').innerHTML='Please enter title for the new activity';
                count = count + 1;
            }
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

function event_form_reset(){
    window.document.getElementById('em_title').innerHTML = '' ;
    window.document.getElementById('em_description').innerHTML = '' ; 
    window.document.getElementById('em_start_date').innerHTML = '' ;
    window.document.getElementById('em_end_date').innerHTML = '' ;
    window.document.getElementById('em_activities').innerHTML = '' ;
    window.document.getElementById('em_category').innerHTML = '' ;
    return;
}


});

