require 'rails_helper'

RSpec.describe DutiesController, type: :controller do
  describe '#index' do
    it 'does it successfully' do
      get :index
      expect(response).to have_http_status :ok
    end
  end
end
