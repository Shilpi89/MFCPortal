module EventHelper

 def get_event_category_name category_id
  case category_id
   when FLOOR_MEETING_ID
 	 category = "Floor Meeting"
   when ANNUAL_EVENTS_ID
 	 category = "Annual Event"
   when PICNIC_ID
      category = "Picnic"
   when FAREWELL_ID
 	 category = "Farewell"   
  end
  return category
 end

end
