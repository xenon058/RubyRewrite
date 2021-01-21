class ReserveController < ApplicationController
    before_action :ownerclear
  def reserveDay

  end

  def reserveRoomList
      require'date'
      reserve_room_no = Reserve.where("date(date)='#{params[:reserveDay]}'").select(:room_no)
      session[:reserveDay] = params[:reserveDay]
      date = Date.strptime(params[:reserveDay],'%Y-%m-%d')
      @date = date.strftime('%Y/%m/%d')
      @rooms = Room.where.not(no: reserve_room_no)
  end
  def reserveDetail
      @room = Room.find_by(no: params[:no])
      session[:room_no] = params[:no]
      session[:room_name] = @room.name
      @errmsg = {}
  end
  def reserveCheck
      @errmsg = {}
      @errmsg.clear
      session[:name] = params[:name]
      session[:telno] = params[:telno]
      session[:mail] = params[:mail]
      session[:checkin] = params[:checkin]
      session[:reserveNumber] = params[:reserveNumber]
      session[:message] = params[:message]
      if params[:name].empty?
          @errmsg[:name] = "名前が入力されていません"
      end
      if params[:telno].empty?
        @errmsg[:telno] = "電話番号が未入力です"
      end
      if params[:checkin].empty?
          @errmsg[:checkin] = "チェックイン予定時間が未入力です"
      end
      if params[:reserveNumber].empty?
          @errmsg[:reserveNumber] =  "宿泊人数が未入力です"
      elsif params[:reserveNumber].to_i.to_s != params[:reserveNumber].to_s
          @errmsg[:reserveNumber] = "宿泊人数は数値で指定してください"
      elsif params[:reserveNumber].to_i <= 0
          @errmsg[:reserveNumber] = "宿泊人数は1名以上を指定してください"
      end

      if @errmsg.count != 0
            render("reserve/reserveDetail")
      else
          redirect_to("/reserve/reserveConfirm")
      end
  end
  def reserveInsert
      customer = Customer.new(name: session[:name],telno: session[:telno],address: session[:mail])
      customer.save
      date = Date.strptime(session[:reserveDay],'%Y-%m-%d')
      no = date.strftime('%Y%m%d')
      maxno =Reserve.where("date(date)='#{session[:reserveDay]}'").count
      maxno += 1
      no += "#{maxno}"

      reserve = Reserve.new(no: no,date: session[:reserveDay],room_no: session[:room_no],customer_id: customer.id,numbers: session[:reserveNumber],checkin_time: session[:checkin],message:session[:message])
      if reserve.save
            session[:no] = reserve.no
            redirect_to("/reserve/reserveFinish")
      else
            flash[:notice] = "予約に失敗しました"
            render("reserve/reserveDay")
      end
      def reserveFinish

      end
  end
end
