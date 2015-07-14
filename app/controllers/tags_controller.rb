class TagsController < ApplicationController
def index
	@tags = Tag.all
end

	def show
		@tag = Tag.find(params[:id])		
	end

	def destroy
		@tag = Tag.find(params[:id]).destroy

		redirect_to tags_path
		flash.notice = "Tag '#{@tag.name}' was deleted"
	end
end
