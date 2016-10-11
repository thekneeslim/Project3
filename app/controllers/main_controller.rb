class MainController < ApplicationController

  def index

  end

  def browse
    render :browse
  end

  def profile
    render :profile
  end

def landing
  render layout: false
end

end

