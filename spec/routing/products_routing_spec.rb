require 'rails_helper'

RSpec.describe ProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/products').to route_to('products#create', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/products/1').to route_to('products#destroy', id: '1', format: :json)
    end
  end
end
