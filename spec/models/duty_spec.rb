require 'rails_helper'

RSpec.describe Duty, type: :model do
  it "should belong to a Supervisor" do
    duty = Duty.reflect_on_association(:supervisor)
    expect(duty.macro).to eq(:belongs_to)
  end
end
