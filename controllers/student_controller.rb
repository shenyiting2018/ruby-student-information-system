require_relative('../models/student')

post('/student') do 
	params = {
		:first_name=>"Lulu",
		:last_name=>"Liu",
		:address=>"Mars",
		:email=>"miaomiao@gmail.com",
		:birthday=>Date.new(2015),
		:student_class=>1
	}

	student = create_student(params)
end

get('/students') do
	@title = "Students"
	@students = get_students()

	erb(:students)
end


get('/student/:student_id') do 
	@student = get_student_details(params[:student_id])

	if @student.nil?
		pass
	end

	# puts "first name: #{@student.first_name}"
	puts "last name: #{@student.last_name}"
	erb(:student_details)
end