require_relative '../models/student'

post('/student') do puts 'API called for post students'
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
	
	@students.each do |student|
		puts student.first_name
	end

	return erb(:students)
end