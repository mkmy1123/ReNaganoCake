module ApplicationHelper

	def include_tax(price)
		(price*1.1).round(0)
	end
end
