start_date = Date.new(2020, 1, 1)
end_date = Date.new(2050, 12, 31)

(start_date..end_date).each do |date|
  EventDate.create(event_date: date)  
end