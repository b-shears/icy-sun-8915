require 'rails_helper'

RSpec.describe 'employees show page' do
  parks_and_rec = Department.create!(name: "Parks and Rec", floor: "basement")

  employee_1 = parks_and_rec.employees.create!(name: "Ron Swanson", level: 2)
  # employee_2 = parks_and_rec.employees.create!(name: "Lesley Knope", level: 3)
  # employee_3 = parks_and_rec.employees.create!(name: "Andy Dwyer", level: 1)

  ticket_1 = Ticket.create!(subject:'pool repair', age: 5)
  ticket_2 = Ticket.create!(subject:'broken printer', age: 4)
  ticket_3 = Ticket.create!(subject:'broken AC', age: 3)

  EmployeeTicket.create!(employee_id: employee_1.id, ticket_id: ticket_1.id)
  EmployeeTicket.create!(employee_id: employee_1.id, ticket_id: ticket_2.id)
  EmployeeTicket.create!(employee_id: employee_1.id, ticket_id: ticket_3.id)

  it 'should show the employees name and department' do
    visit "/employees/#{employee_1.id}"

    save_and_open_page
    expect(page).to have_content("Ron Swanson")
    expect(page).to have_content("Parks and Rec")
  end

  it 'should list tickets from oldest to youngest' do
    parks_and_rec = Department.create!(name: "Parks and Rec", floor: "basement")

    employee_1 = parks_and_rec.employees.create!(name: "Ron Swanson", level: 2)
    # employee_2 = parks_and_rec.employees.create!(name: "Lesley Knope", level: 3)
    # employee_3 = parks_and_rec.employees.create!(name: "Andy Dwyer", level: 1)

    ticket_1 = Ticket.create!(subject:'pool repair', age: 5)
    ticket_2 = Ticket.create!(subject:'broken printer', age: 4)
    ticket_3 = Ticket.create!(subject:'broken AC', age: 3)

    EmployeeTicket.create!(employee_id: employee_1.id, ticket_id: ticket_1.id)
    EmployeeTicket.create!(employee_id: employee_1.id, ticket_id: ticket_2.id)
    EmployeeTicket.create!(employee_id: employee_1.id, ticket_id: ticket_3.id)

    visit "/employees/#{employee_1.id}"

    expect(ticket_1).to appear_before(ticket_3)

  end
end
