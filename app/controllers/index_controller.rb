class IndexController < ApplicationController
  def index
	if params['url']
		@urli = 'clientSideInclude("main_content","http://project-jukebox.heroku.com'+params['url']+'");'
		@title = params['title']
		@urlfb = 'http://project-jukebox.heroku.com/index?url=' + params['url'] + '&title=' + params['title']
	end
  end
end
