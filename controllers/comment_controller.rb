require_relative('../models/comment')

# Create new comment
post('/comment') do
	if !session[:authorized]
		redirect to "/login"
	else
		@comment = create_comment(params)
		redirect to "/comments"
	end
end

# List all comments
get('/comments') do
	@title = "Comments"
	@comments = get_comments()

	erb(:comments)
end

# Get the detail of one comment
get('/comment/:comment_id') do
	@comment = get_comment_details(params[:comment_id])

	if @comment.nil?
		pass
	end

	erb(:comment_details)
end

# Get create new comment page
get('/comment') do
	erb(:comment_new)
end


