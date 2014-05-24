class FrontController < ApplicationController
  def show
    @tab = 1
  end

  def about
    @tab = 4
  end

  def details
    @tab = 2
  end
end
