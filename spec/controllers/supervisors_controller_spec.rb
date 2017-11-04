require 'rails_helper'

RSpec.describe SupervisorsController, type: :controller do
  describe '#index' do
    it 'shows index successfully' do
      get :index
      expect(response).to have_http_status :ok
    end
  end
  describe '#destroy' do
    it 'destroys successfully' do
      supervisor = Supervisor.create(fullname:'Test', phone_number:'87654321', email:'test@example.com') 
      expect {
        delete :destroy, params: {id: supervisor.id} 
      }.to change(Supervisor, :count).by(-1)
    end
    it 'redirects to the supervisors list' do
      supervisor = Supervisor.create(fullname:'Test', phone_number:'87654321', email:'test@example.com') 
      delete :destroy, params: {id: supervisor.id} 
      expect(response).to redirect_to(supervisors_path)
    end
  end
end
