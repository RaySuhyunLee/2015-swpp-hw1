class IndexController < ApplicationController
	def index
	end

  def login
		id = params[:username]
		pass = params[:password]

		user = UserAccount.find_by(username: id, pass: pass)

		respond_to do |format|
			if id.length < 5 or id.length > 20
				format.json { render :json => { :error_code => -1 } }
			elsif pass.length < 8 or pass.length > 20
				format.json { render :json => { :error_code => -2 } }
			elsif user.nil?
				format.json { render :json => { :error_code => -4 } }
			else
				user.count += 1
				user.save

				session[:username] = user.username
				session[:password] = user.pass

				format.json { render :json => { :user_name => user.username, :login_count => user.count } }
			end
		end
  end

	def signup
		id = params[:username]
		pass = params[:password]

		respond_to do |format|
			if id.length < 5 or id.length > 20
				format.json { render :json => { :error_code => -1 } }
			elsif pass.length < 8 or pass.length > 20
				format.json { render :json => { :error_code => -2 } }
			elsif not UserAccount.find_by(username: id).nil?
				format.json { render :json => { :error_code => -3 } }
			else
				user = UserAccount.create(username: id, pass: pass, count: 1)

				session[:username] = user.username
				session[:password] = user.pass

				format.json { render :json => { :user_name => user.username, :login_count => user.count } }
			end
		end
	end

	def clearData
		UserAccount.destroy_all

		respond_to do |format|
			format.json { render :json => {} }
		end
	end

	def logged
		if session[:username].nil? || session[:password].nil?
			redirect_to '/'
		else
			@user = UserAccount.find_by(username: session[:username], pass: session[:password])
			if @user.nil?
				redirect_to '/'
			end
		end
	end

	def logout
		session[:username] = nil
		session[:password] = nil
		redirect_to '/'
	end

end
