start_date = Date.new(2023, 1, 1)
end_date = Date.new(2033, 12, 31)

(start_date..end_date).each do |date|
  EventDate.create(event_date: date)  
end