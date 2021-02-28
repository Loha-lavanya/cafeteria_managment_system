class HomeController < ApplicationController
  def index
  end
=begin
  def index
    if current_user
      redirect_to todos_path  (vhange your our page)
    else
      render "index" (go to home page itself i.e no user or password wrong)
    end
=end
end
