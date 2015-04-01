class DataController < ApplicationController
	def index
		@account_all = UserAccount.all	
	end
end
