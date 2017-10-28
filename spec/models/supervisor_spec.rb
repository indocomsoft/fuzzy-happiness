require 'rails_helper'

RSpec.describe Supervisor, type: :model do
  it 'should have many problems' do
    supervisor = Supervisor.reflect_on_association(:problems)
    expect(supervisor.macro).to eq(:has_many)
  end
  it 'should have many duties' do
    supervisor = Supervisor.reflect_on_association(:duties)
    expect(supervisor.macro).to eq(:has_many)
  end
  it 'saves given a valid Supervisor' do
    supervisor = Supervisor.create(fullname:'Test', phone_number:'87654321', email:'test@example.com')
    expect(supervisor.save).to be true
  end
end
