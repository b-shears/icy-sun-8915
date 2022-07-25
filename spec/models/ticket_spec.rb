require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validations' do
    it {should validate_presence_of :subject}
    it {should validate_presence_of :age}
  end
  describe 'relationships' do
    it {should have_many :employee_tickets}
    it {should have_many(:employees).through(:employee_tickets)}
  end

  it 'can sort tickest from oldest from yougest' do
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

    expect(Ticket.ticket_order.first).to eq(ticket_1)
    expect(Ticket.ticket_order.last).to eq(ticket_3)
  end
end
