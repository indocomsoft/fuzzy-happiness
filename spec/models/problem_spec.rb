require 'rails_helper'

RSpec.describe Problem, type: :model do
  it 'should belong to a Supervisor' do
    problem = Problem.reflect_on_association(:supervisor)
    expect(problem.macro).to eq(:belongs_to)
  end
  it 'saves given a valid problem' do 
    supervisor = Supervisor.create(fullname:'Test', phone_number:'87654321', email:'test@example.com')
    problem = Problem.create(time: Time.now.getutc, computer: 0, details: 'Hello World',
                             fixed: false, supervisor_id: supervisor.id)
    expect(problem.save).to be true
  end
end
