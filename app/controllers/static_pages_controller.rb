class StaticPagesController < ApplicationController
  def index
    @courses = Course.all.order("created_at").paginate(:page => params[:page], :per_page => 6 )
  end

  def privacy

  end
end
