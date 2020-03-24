describe Web::Controllers::Health do
  describe 'GET /health' do
    before do
      get '/health'
    end

    it 'returns status code OK' do
      expect(last_response).to be_ok
    end
  end
end
