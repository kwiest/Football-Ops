class DeveloperController < ApplicationController
  def users
    @users = { first_name: 'Kyle', last_name: 'Wiest' }
  end
end
