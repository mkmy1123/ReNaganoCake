class SearchController < ApplicationController
  before_action :authenticate_admin!

  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@model, @content, @how).order(:id).page(params[:page])
  end

  private

  def search_for(model, content, how)
    if model == 'customer'
      how == 'partical'
      Customer.where("first_name LIKE ?", "%#{content}%")
    else
      how == 'partical'
      Item.where("name LIKE ?", "%#{content}%")
    end
  end
end