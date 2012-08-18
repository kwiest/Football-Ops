class IndexController < ApplicationController
  skip_before_filter :ensure_authenticated
	
  def index
  end

end
