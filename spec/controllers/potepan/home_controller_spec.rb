require 'rails_helper'

RSpec.describe Potepan::HomeController, type: :controller do
  describe "indexアクションに関するテスト" do
    let!(:product1) { create(:product, available_on: 1.month.ago) }
    let!(:product2) { create(:product, available_on: 2.month.ago) }
    let!(:product3) { create(:product, available_on: 3.month.ago) }
    let!(:product4) { create(:product, available_on: 4.month.ago) }
    let!(:product5) { create(:product, available_on: 5.month.ago) }
    let!(:product6) { create(:product, available_on: 6.month.ago) }
    let!(:product7) { create(:product, available_on: 7.month.ago) }
    let!(:product8) { create(:product, available_on: 8.month.ago) }
    let!(:product9) { create(:product, available_on: 9.month.ago) }
    let!(:COUNT_OF_LATED_PRODUCTS) { 8 }
    let(:lated_products) do
      [product1, product2, product3, product4, product5, product6, product7, product8]
    end

    before do
      get :index
    end

    it "正常にレスポンスを返すこと" do
      expect(response).to have_http_status(:ok)
    end

    it "適切なテンプレートが表示されているか" do
      expect(response).to render_template(:index)
    end

    it "新着商品が5個表示されていること" do
      expect(assigns(:lated_products).count).to eq(8)
    end

    it "@lated_productsは適切な情報を持つか" do
      expect(assigns(:lated_products)).to eq lated_products
    end
  end
end
