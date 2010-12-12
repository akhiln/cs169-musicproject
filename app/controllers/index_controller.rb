class IndexController < ApplicationController
  def index
	if params['url']
		@urli = 'clientSideInclude("main_content","http://localhost:3000'+params['url']+'");'
		@title = params['title']
		@urlfb = 'http://localhost:3000/index?url=' + params['url'] + '&title=' + params['title']
	end
  end
end
