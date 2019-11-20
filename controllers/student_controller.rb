require_relative('../models/student')


# Update API
put('/student/:student_id') do
	if !session[:authorized]
		redirect to "/login"
	else
		@student = update_student(params)
		erb(:student_details)
	end
end

# Delete API
delete('/student/:student_id') do
	if !session[:authorized]
		redirect to "/login"
	else
		@student = get_student_details(params[:student_id])
		@student.destroy
		erb(:student_delete)
	end
end

#Create API
post('/student') do
	if !session[:authorized]
		redirect to "/login"
	else
		@student = create_student(params)
		erb(:student_details)
	end
end

# Get the edit form page
get('/student/:student_id/edit') do 
	if !session[:authorized]
		redirect to "/login"
	else
		@student = get_student_details(params[:student_id])
		erb(:student_edit_form)
	end
end

# List all students
get('/students') do
	@title = "Students"
	@students = get_students()

	erb(:students)
end

# Get the detail of one student
get('/student/:student_id') do 
	@student = get_student_details(params[:student_id])

	if @student.nil?
		pass
	end

	erb(:student_details)
end