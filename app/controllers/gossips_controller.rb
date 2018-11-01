class GossipsController < ApplicationController
	def index
		@gossip = Gossip.all
	end

	def new
		@gossip = Gossip.new
	end

	def create
		if @current_user
			@gossip = Gossip.create!(title: params[:gossip][:title], content: params[:gossip][:content], user_id: @current_user.id)
		else
			flash[:info] = "Veuillez vous identifier"
			redirect_to new_gossip_path
		end
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		update_params = params.require(:gossip).permit(:title, :content, :anonymous_gossiper)
		@gossip.update(update_params)
		redirect_to gossips_path
	end

	def destroy
		@gossip = Gossip.find(params[:id])
	    @gossip.destroy
	    redirect_to gossips_path
	end
end