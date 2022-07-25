require 'rails_helper'

RSpec.describe 'department index page' do
  it 'shows the departments name and floor' do
    parks_and_rec = Department.create!(name: "Parks and Rec", floor: "basement")
    employee_1 = parks_and_rec.employees.create!(name: "Ron Swanson", level: 2)
    employee_2 = parks_and_rec.employees.create!(name: "Lesley Knope", level: 3)
    employee_3 = parks_and_rec.employees.create!(name: "Andy Dwyer", level: 1)

    visit "/departments"
    expect(page).to have_content("Department: Parks and Rec")
    expect(page).to have_content("Floor: basement")
    # within "#department-#{parks_and_rec.id}" do
      expect(page).to have_content("Ron Swanson")
      expect(page).to have_content("Lesley Knope")
      expect(page).to have_content("Andy Dwyer")
    # end
  end


end
