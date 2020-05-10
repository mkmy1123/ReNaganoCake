class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @dates = search_for(@how, @model, @content)
    @customers = Customer.all
    @items = Item.all
  end

  private
  def match(model, content)
    if model == 'customer'
      Customer.where(name: content)
    elsif model == 'item'
      Item.where(name: content)
    end
  end

  def partical(model, content)
    if model == 'customer'
      Customer.where("name LIKE ?", "%#{content}%")
    elsif model == 'item'
      Item.where("name LIKE ?", "%#{content}%")
    end
  end

  def search_for(model, content)
    case how
  when 'match'
    match(model, content)
  when 'partical'
    partical(model, content)
    end
  end
end
