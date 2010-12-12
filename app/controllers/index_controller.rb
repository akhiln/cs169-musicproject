class IndexController < ApplicationController

  def index
    @actions = Action.find(:all, :readonly, :limit => 10, :order => "created_at DESC")
  end
end
