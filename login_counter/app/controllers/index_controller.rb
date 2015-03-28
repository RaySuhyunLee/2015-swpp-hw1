class IndexController < ApplicationController
	def index
		error_code = params[:error_code]
		case error_code
		when "-1"
			@message = "The user name should be 5~20 characters long. Please try again."
		when "-2"
			@message = "The password should be 8~20 characters long. Please try again."
		when "-3"
			@message = "This user name already exists. Please try again."
		when "-4"
			@message = "Invalid username and password combination. Please try again."
		else
			@message = "Please enter your credentials below"
		end
	end

  def login
		@id = params[:id]
		@pass = params[:password]

		@user = UserAccount.find_by(username: @id, pass: @pass)
		respond_to do |format|
			if @id.length < 5 or @id.length > 20
				format.html { redirect_to :action => "index", :error_code => -1 }
				format.json { render :json => { :error_code => -1 } }
			elsif @pass.length < 8 or @pass.length > 20
				format.html { redirect_to :action => "index", :error_code => -2 }
				format.json { render :json => { :error_code => -2 } }

			elsif @user.nil?
				format.html { redirect_to :action => "index", :error_code => -4 }
				format.json { render :json => { :error_code => -4 } }
			else
				@user.count += 1
				@user.save

				format.html
				format.json { render :json => { :user_name => @user.username, :login_count => @user.count } }
			end
		end
  end

	def signup
		@id = params[:id]
		@pass = params[:password]

		respond_to do |format|
			if @id.length < 5 or @id.length > 20
				format.html { redirect_to :action => "index", :error_code => -1 }
				format.json { render :json => { :error_code => -1 } }
			elsif @pass.length < 8 or @pass.length > 20
				format.html { redirect_to :action => "index", :error_code => -2 }
				format.json { render :json => { :error_code => -2 } }
			elsif not UserAccount.find_by(username: @id).nil?
				msg = { :error_code => -3 }
				format.html { redirect_to :action => "index", :error_code => -3 }
				format.json { render :json => msg }
			else
				user = UserAccount.create(username: @id, pass: @pass, count: 1)
				msg = { :user_name => @id, :login_count => user.count }
				format.html { redirect_to :action => "index" }
				format.json { render :json => msg } 
			end
		end
	end

	def clearData
		UserAccount.destroy_all

		redirect_to :action => "index"
	end

	def data
		@account_all = UserAccount.all
	end
end
