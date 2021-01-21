class OwnerController < ApplicationController
    before_action :authenticate_user, {only: [:reserveList]}
    before_action :ownerclear, {only: [:login]}
  def login
      session[:owner] = true
  end
  def enter
      if params[:id] == "id" && params[:pass] == "pass"
          session[:enter] = true
          redirect_to("/owner/reserveList/today")
      else
          @errmsg = "IDまたはパスワードが違います"
          render("/owner/login")
      end
  end
  def reserveList
      require'date'
      session[:disp] = params[:disp]
      if params[:disp] == "today"
          @disp = "（本日）"
          @reserves = Reserve.where("date(date)='#{Date.today}'")
      elsif params[:disp] == "after"
          @disp = "（本日以降）"
          @reserves = Reserve.where("date(date)>'#{Date.today}'")
      elsif params[:disp] == "before"
          @disp = "（過去）"
          @reserves = Reserve.where("date(date)<'#{Date.today}'")
      end

  end
  def logout
      session[:enter] = false
      redirect_to("/owner/login")
  end
  def delete
      reserve = Reserve.find_by(id: params[:id])
      reserve.destroy
      redirect_to("/owner/reserveList/#{session[:disp]}")

  end
  def authenticate_user
     if session[:enter] == false
       redirect_to("/owner/login")
     end
  end
end
