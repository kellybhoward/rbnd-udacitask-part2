require 'chronic'
require 'colorize'
require 'rainbow'
require 'date'
require_relative "lib/listable"
require_relative "lib/errors"
require_relative "lib/udacilist"
require_relative "lib/todo"
require_relative "lib/event"
require_relative "lib/link"

list = UdaciList.new(title: "Julia's Stuff")
list.add("todo", "Buy more cat food", due: "2016-02-03", priority: "low")
list.add("todo", "Sweep floors", due: "2016-01-30")
list.add("todo", "Buy groceries", priority: "high")
list.add("event", "Birthday Party", start_date: "2016-05-08")
list.add("event", "Vacation", start_date: "2016-05-28", end_date: "2016-05-31")
list.add("link", "https://github.com", site_name: "GitHub Homepage")

puts
puts "Here is the inital list for testing:"
list.all
list.delete(3)
puts
puts "This is the list after #3 was deleted"
list.all

puts
puts "Showing the list after deleting two items at once, #1 and #3"
list.delete(1,3) #DONE
list.all

puts
puts "Updated priority for #1 from nothing to medium"
list.update_priority(1,'medium') #DONE
list.all

puts
puts "There's a commented out string here to test the new Error message if you call update_priority on a non-todo item"
# list.update_priority(2,'low') # Testing Error message if the item doesn't have that action ability

# SHOULD CREATE AN UNTITLED LIST AND ADD ITEMS TO IT
# --------------------------------------------------
new_list = UdaciList.new # Should create a list called "Untitled List"
new_list.add("todo", "Buy more dog food", due: "in 5 weeks", priority: "medium")
new_list.add("todo", "Go dancing", due: "in 2 hours")
new_list.add("todo", "Buy groceries", priority: "high")
new_list.add("event", "Birthday Party", start_date: "May 31")
new_list.add("event", "Vacation", start_date: "Dec 20", end_date: "Dec 30")
new_list.add("event", "Life happens")
new_list.add("link", "https://www.udacity.com/", site_name: "Udacity Homepage")
new_list.add("link", "http://ruby-doc.org")

# SHOULD RETURN ERROR MESSAGES
# ----------------------------
# new_list.add("image", "http://ruby-doc.org") # Throws InvalidItemType error
# new_list.delete(9) # Throws an IndexExceedsListSize error
# new_list.add("todo", "Hack some portals", priority: "super high") # throws an InvalidPriorityValue error

# DISPLAY UNTITLED LIST
# ---------------------
puts
puts "Here's an untitled list with 8 items, 3 types of items"
new_list.all

# DEMO FILTER BY ITEM TYPE
# ------------------------
puts
puts "This is the same list using the filter method to show only event items"
new_list.filter("event")
