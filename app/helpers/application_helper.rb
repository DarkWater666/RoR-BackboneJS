module ApplicationHelper

	def title(page_title)
		content_for(:title) { page_title }
	end

	def description(page_title)
		content_for(:description) { page_title }
	end

	def keywords(page_title)
		content_for(:keywords) { page_title }
	end

	def remote_ip
		request.remote_ip
	end

	def flash_message(type, text)
		flash[type] ||= []
		flash[type] << text
	end

end
