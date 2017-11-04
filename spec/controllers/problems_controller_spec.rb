require 'rails_helper'

RSpec.describe ProblemsController, type: :controller do
  describe '#index' do
    it 'does it successfully' do
      get :index
      expect(response).to have_http_status :ok
    end
  end
  describe '#destroy' do
    it 'destroys successfully' do
      supervisor = Supervisor.create(fullname:'Test', phone_number:'87654321', email:'test@example.com')
      problem = Problem.create(time: Time.now.getutc, computer: 0, details: 'Hello World',
                             fixed: false, supervisor_id: supervisor.id) 
      expect {
        delete :destroy, params: {id: problem.id} 
      }.to change(Problem, :count).by(-1)
    end
    it 'redirects to the supervisors list' do
      supervisor = Supervisor.create(fullname:'Test', phone_number:'87654321', email:'test@example.com')
      problem = Problem.create(time: Time.now.getutc, computer: 0, details: 'Hello World',
                             fixed: false, supervisor_id: supervisor.id) 
      delete :destroy, params: {id: problem.id} 
      expect(response).to redirect_to(problems_path)
    end
  end
end
