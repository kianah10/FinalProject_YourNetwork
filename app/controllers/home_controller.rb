class HomeController < ApplicationController
  def homepage
    render( :template => "home/landing_page.html.erb")
  end
end
