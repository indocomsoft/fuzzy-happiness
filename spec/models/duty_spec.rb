require 'rails_helper'

RSpec.describe Duty, type: :model do
  it "should belong to a Supervisor" do
    duty = Duty.reflect_on_association(:supervisor)
    expect(duty.macro).to eq(:belongs_to)
  end

  it 'saves given a valid duty' do
    supervisor = Supervisor.create(fullname:'Test', phone_number:'87654321', email:'test@example.com')
    duty = Duty.create(date:Date.today, dropped:false, supervisor_id:supervisor.id)
    expect(duty.save).to be true
  end

  it 'does not save given 2 duties on the same day' do
    supervisor = Supervisor.create(fullname:'Test', phone_number:'87654321', email:'test@example.com')
    supervisor2 = Supervisor.create(fullname:'Test2', phone_number:'87654320', email:'test2@example.com')
    duty = Duty.create(date:Date.today, dropped:false, supervisor_id:supervisor.id)
    duty2 = Duty.create(date:Date.today, dropped:false, supervisor_id:supervisor2.id)
    duty.save
    expect(duty2.save).to be false
  end
end
