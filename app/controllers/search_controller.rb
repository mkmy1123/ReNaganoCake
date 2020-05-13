class SearchController < ApplicationController
  before_action :authenticate_admin!

  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @datas = search_for(@model, @content, @method).order(:id).page(params[:page])
  end

  private

  def search_for(model, content, method)
    if model == 'customer'
      method == 'partical'
      Customer.where("first_name LIKE ?", "%#{content}%")
    else
      method == 'partical'
      Item.where("name LIKE ?", "%#{content}%")
    end
  end
end