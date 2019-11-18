require 'dm-core'
require 'dm-migrations'

class Student
	include DataMapper::Resource
	property :student_id, Serial
	property :first_name, String
	property :last_name, String
	property :address, String
	property :email, String
	property :birthday, Date 
	property :student_class, Integer
	property :is_graduated, Boolean
end

class InvalidStudentException < StandardError
end

def create_student(params)
	validate_create_student_param(params, :first_name)
	validate_create_student_param(params, :last_name)
	validate_create_student_param(params, :email)
	validate_create_student_param(params, :student_class)

	student = Student.create(
		first_name: params[:first_name],
		last_name: params[:last_name],
		address: params[:address],
		email: params[:email],
		birthday: params[:birthday],
		student_class: params[:student_class],
		is_graduated: false,
	)
end

def validate_create_student_param(params, attribute_name)
	if !params.has_key?(attribute_name) || params[attribute_name].nil?
		raise InvalidStudentException.new
	end
end

def get_students()
	return Student.all.reverse
end

def get_student_details(student_id)
	# return a student given student_id
	student = Student.get(student_id)
	return student
end 
