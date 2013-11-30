class ArticlesController < ApplicationController
	
	def create
		comment = Comment.new(comment_params)
		commentable =  
	end

	private
	# Never trust parameters from the scary internet, only allow the white list through.

    def comment_params
      params.require(:comment).permit(:title, :comment)
    end
    def load_commentable
  		resource, id = request.path.split('/')[1, 2]
    	@commentable = resource.singularize.classify.constantize.find(id)	
  	end
end