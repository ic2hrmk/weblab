class HomeController < ApplicationController
	def home
		@news = Feedjira::Feed.fetch_and_parse('http://k.img.com.ua/rss/ua/all_news2.0.xml').entries[0,10]
	end
end
