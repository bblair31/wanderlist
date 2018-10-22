city_size = ["small", "medium", "large"]

CS.countries.each do |c_code, name|
  c = Country.create(name: name)
    CS.get(c_code).each do |s_code, s_name|
     CS.get(c_code, s_code).each do |city|
      City.create(name: city, size: city_size.sample, country_id: c.id, state_code: s_code)
    end
  end
end

puts "DONE SEEDING"

# t.string "name"
# t.string "size"
# t.integer "country_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.string "state_code"

# CS.get: list of countries (equivalent to CS.countries)
# CS.get(country): list of states (equivalent to CS.states(country))
# CS.get(country, state): list of cities (equivalent to CS.cities(state, country))
