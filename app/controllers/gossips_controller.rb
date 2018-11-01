class GossipsController < ApplicationController
	def index
		@gossip = Gossip.all
	end
	def new
		@gossip = Gossip.new
	end
	def create
		create_params = params.require(:gossip).permit(:title, :content, :anonymous_gossiper)
		@gossip = Gossip.create!(create_params)
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