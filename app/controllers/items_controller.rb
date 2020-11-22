class ItemsController < ApplicationController
  def index
    @user = User.all
  end

  # def new
  #   @User = User.new
  # end

  # def create
  # end

  # private

  # def user.params
  #   params.require(:user).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date)
  # end
end
