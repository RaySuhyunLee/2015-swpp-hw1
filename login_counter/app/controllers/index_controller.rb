class IndexController < ApplicationController
	def index
	end

  def login
		@id = params[:id]
		@pass = params[:pass]

		@user = UserAccount.find_by(username: @id, pass: @pass)

		respond_to do |format|
			if @id.length < 5 or @id.length > 20
				format.json { render :json => { :error_code => -1 } }
			elsif @pass.length < 8 or @pass.length > 20
				format.json { render :json => { :error_code => -2 } }
			elsif @user.nil?
				format.json { render :json => { :error_code => -4 } }
			else
				@user.count += 1
				@user.save

				format.json { render :json => { :user_name => @user.username, :login_count => @user.count } }
			end
		end
  end

	def signup
		@id = params[:id]
		@pass = params[:password]

		respond_to do |format|
			if @id.length < 5 or @id.length > 20
				$error_code = -1
				format.html { redirect_to :action => "index" }
				format.json { render :json => { :error_code => -1 } }
			elsif @pass.length < 8 or @pass.length > 20
				$error_code = -2
				format.html { redirect_to :action => "index" }
				format.json { render :json => { :error_code => -2 } }
			elsif not UserAccount.find_by(username: @id).nil?
				$error_code = -3
				msg = { :error_code => -3 }
				format.html { redirect_to :action => "index" }
				format.json { render :json => msg }
			else
				$error_code = nil
				user = UserAccount.create(username: @id, pass: @pass, count: 0)
				msg = { :user_name => @id, :login_count => user.count }
				format.html
				format.json { render :json => msg } 
			end
		end
	end

	def clearData
		UserAccount.destroy_all

		respond_to do |format|
			format.json { render :json => {} }
		end
	end

end
