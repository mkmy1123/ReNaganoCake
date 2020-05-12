module ApplicationHelper

	def full_title(page_title = '')
		base_title = "ながのCAKE"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def include_tax(price)
		(price*1.1).round(0)
	end

end
