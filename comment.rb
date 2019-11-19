require 'dm-core'
require 'dm-migrations'

class Comment
	include DataMapper::Resource
	property :comment_id, Serial
	property :name, String
	property :content, Text
	property :created_at, DataTime
end

DataMapper.finalize

class InvalidCommentException < StandardError
end

def create_comment(params)
	validate_create_comment_param(params, :name)
	validate_create_comment_param(params, :content)
	comment = Comment.create{
		name: params[:name],
		content: params[:content],
		created_at: Time.now
	}


def validate_create_comment_param(params, attribute_name)
	if !params.has_key?(attribute_name) || params[attribute_name].nil?
		raise InvalidCommentException.new
	end
end
