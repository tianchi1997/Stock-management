# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  { name: "Admin", email: "admin@example.com", password: "password", "permission_level": 2 },
  { name: "Reports", email: "reports@example.com", password: "password", "permission_level": 1 },
  { name: "User", email: "user@example.com", password: "password", "permission_level": 0 }
])

Location.create!([
  {parent_id: nil, name: "Hospital A", description: "Location Description 1"},
  {parent_id: nil, name: "Hospital B", description: "Location Description 2"},
  {parent_id: nil, name: "Hospital C", description: "Location Description 3"},
  {parent_id: 1, name: "Vehicles", description: "Location Description 4"},
  {parent_id: 2, name: "Vehicles", description: "Location Description 5"},
  {parent_id: 3, name: "Vehicles", description: "Location Description 6"},
  {parent_id: 1, name: "Room", description: "Location Description 7"},
  {parent_id: 2, name: "Room", description: "Location Description 8"},
  {parent_id: 3, name: "Room", description: "Location Description 9"},
  {parent_id: 7, name: "Room 1", description: "Location Description 10"},
  {parent_id: 7, name: "Room 2", description: "Location Description 11"},
  {parent_id: 7, name: "Room 3", description: "Location Description 12"},
  {parent_id: 4, name: "Ambulance 1", description: "Location Description 13"},
  {parent_id: 4, name: "Ambulance 2", description: "Location Description 14"},
  {parent_id: 13, name: "Compartment 1", description: "Location Description 15"},
  {parent_id: 13, name: "Compartment 2", description: "Location Description 16"}
])

StockItem.create!([
  {name: "Stock Item 1", item_code: "I1", expires: false},
  {name: "Stock Item 2", item_code: "I2", expires: false},
  {name: "Stock Item 3", item_code: "I3", expires: false},
  {name: "Stock Item 4", item_code: "I4", expires: false},
  {name: "Stock Item 5", item_code: "I5", expires: false},
  {name: "Stock Item 6", item_code: "I6", expires: true},
  {name: "Stock Item 7", item_code: "I7", expires: true},
  {name: "Stock Item 8", item_code: "I8", expires: true},
  {name: "Stock Item 9", item_code: "I9", expires: true},
  {name: "Stock Item 10", item_code: "I10", expires: true}
])

Item.create!([
  {location_id: 10, stock_item_id: 2, required: 4, order_to: 8},
  {location_id: 10, stock_item_id: 3, required: 7, order_to: 16},
  {location_id: 10, stock_item_id: 4, required: 3, order_to: 13},
  {location_id: 10, stock_item_id: 6, required: 5, order_to: 8},
  {location_id: 10, stock_item_id: 7, required: 8, order_to: 16},
  {location_id: 10, stock_item_id: 8, required: 3, order_to: 7},
  {location_id: 10, stock_item_id: 9, required: 9, order_to: 12},
  {location_id: 11, stock_item_id: 3, required: 1, order_to: 11},
  {location_id: 11, stock_item_id: 4, required: 4, order_to: 13},
  {location_id: 11, stock_item_id: 5, required: 6, order_to: 9},
  {location_id: 11, stock_item_id: 6, required: 2, order_to: 2},
  {location_id: 12, stock_item_id: 2, required: 3, order_to: 4},
  {location_id: 12, stock_item_id: 4, required: 4, order_to: 4},
  {location_id: 12, stock_item_id: 5, required: 5, order_to: 13},
  {location_id: 12, stock_item_id: 6, required: 5, order_to: 13},
  {location_id: 12, stock_item_id: 7, required: 6, order_to: 10},
  {location_id: 13, stock_item_id: 1, required: 7, order_to: nil},
  {location_id: 13, stock_item_id: 2, required: 1, order_to: nil},
  {location_id: 13, stock_item_id: 3, required: 2, order_to: nil},
  {location_id: 13, stock_item_id: 5, required: 6, order_to: nil},
  {location_id: 13, stock_item_id: 6, required: 2, order_to: nil},
  {location_id: 14, stock_item_id: 1, required: 2, order_to: nil},
  {location_id: 14, stock_item_id: 5, required: 6, order_to: nil},
  {location_id: 14, stock_item_id: 6, required: 3, order_to: nil},
  {location_id: 14, stock_item_id: 7, required: 9, order_to: nil},
  {location_id: 15, stock_item_id: 1, required: 6, order_to: nil},
  {location_id: 15, stock_item_id: 2, required: 7, order_to: nil},
  {location_id: 15, stock_item_id: 4, required: 7, order_to: nil},
  {location_id: 15, stock_item_id: 6, required: 9, order_to: nil},
  {location_id: 15, stock_item_id: 8, required: 3, order_to: nil},
  {location_id: 16, stock_item_id: 1, required: 8, order_to: nil},
  {location_id: 16, stock_item_id: 2, required: 2, order_to: nil},
  {location_id: 16, stock_item_id: 3, required: 7, order_to: nil},
  {location_id: 16, stock_item_id: 4, required: 8, order_to: nil},
  {location_id: 16, stock_item_id: 7, required: 9, order_to: nil},
  {location_id: 16, stock_item_id: 8, required: 3, order_to: nil}
])

ItemExpiry.create!([
  {item_id: 1, expiry_date: nil, count: 7},
  {item_id: 2, expiry_date: nil, count: 12},
  {item_id: 3, expiry_date: nil, count: 10},
  {item_id: 8, expiry_date: nil, count: 8},
  {item_id: 9, expiry_date: nil, count: 5},
  {item_id: 10, expiry_date: nil, count: 5},
  {item_id: 12, expiry_date: nil, count: 1},
  {item_id: 13, expiry_date: nil, count: 2},
  {item_id: 14, expiry_date: nil, count: 5},
  {item_id: 17, expiry_date: nil, count: 6},
  {item_id: 18, expiry_date: nil, count: 1},
  {item_id: 19, expiry_date: nil, count: 2},
  {item_id: 20, expiry_date: nil, count: 6},
  {item_id: 22, expiry_date: nil, count: 2},
  {item_id: 23, expiry_date: nil, count: 2},
  {item_id: 26, expiry_date: nil, count: 2},
  {item_id: 27, expiry_date: nil, count: 1},
  {item_id: 28, expiry_date: nil, count: 7},
  {item_id: 31, expiry_date: nil, count: 3},
  {item_id: 32, expiry_date: nil, count: 2},
  {item_id: 33, expiry_date: nil, count: 2},
  {item_id: 34, expiry_date: nil, count: 5},
  {item_id: 7, expiry_date: "2018-09-22", count: 1},
  {item_id: 6, expiry_date: "2018-09-22", count: 1},
  {item_id: 6, expiry_date: "2019-09-22", count: 1},
  {item_id: 30, expiry_date: "2018-09-22", count: 1},
  {item_id: 5, expiry_date: "2018-09-22", count: 4},
  {item_id: 5, expiry_date: "2019-09-22", count: 1},
  {item_id: 16, expiry_date: "2018-09-22", count: 5},
  {item_id: 16, expiry_date: "2019-09-22", count: 4},
  {item_id: 16, expiry_date: "2020-09-22", count: 1},
  {item_id: 25, expiry_date: "2018-09-22", count: 2},
  {item_id: 25, expiry_date: "2019-09-22", count: 2},
  {item_id: 25, expiry_date: "2020-09-22", count: 3},
  {item_id: 25, expiry_date: "2021-09-22", count: 2},
  {item_id: 35, expiry_date: "2018-09-22", count: 4},
  {item_id: 35, expiry_date: "2019-09-22", count: 1},
  {item_id: 35, expiry_date: "2020-09-22", count: 2},
  {item_id: 4, expiry_date: "2018-09-22", count: 1},
  {item_id: 4, expiry_date: "2019-09-22", count: 1},
  {item_id: 4, expiry_date: "2020-09-22", count: 1},
  {item_id: 15, expiry_date: "2018-09-22", count: 1},
  {item_id: 24, expiry_date: "2018-09-22", count: 1},
  {item_id: 24, expiry_date: "2019-09-22", count: 1},
  {item_id: 29, expiry_date: "2018-09-22", count: 2},
  {item_id: 29, expiry_date: "2019-09-22", count: 2},
  {item_id: 29, expiry_date: "2020-09-22", count: 1}
])
