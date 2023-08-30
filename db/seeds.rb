# frozen_string_literal: true

STUDENTS_LENGTH = rand(20..40)
TEACHERS_LENGTH = 7
GRADES = ['5º Ano', '6º Ano', '7º Ano', '8º Ano', '9º Ano'].freeze
SUBJECTS_PARAMS = [{ name: 'Matemática' }, { name: 'Português' }, { name: 'História' },
                   { name: 'Geografia' }, { name: 'Física' }, { name: 'Química' },
                   { name: 'Inglês' }].freeze

COURSES_PARAMS = GRADES.map do |grade|
  grades_array = []
  (2012..2023).each do |year|
    grades_array.push(
      {
        year:,
        name: grade,
        starts_on: Date.new(year, 1, 1),
        ends_on: Date.new(year, 12, 31)
      }
    )
  end
  grades_array
end.flatten.freeze

puts('Creating Students...')
students = Student.create!(Array.new(STUDENTS_LENGTH) { { name: Faker::Name.name, born_on: 18.years.ago } })
puts("Done! Students created: #{students.length}")

puts('Creating Teachers...')
teachers = Teacher.create!(Array.new(TEACHERS_LENGTH) { { name: Faker::Name.name } })
puts("Done! Teachers created: #{teachers.length}")

puts('Creating Subjects...')
subjects = Subject.create!(SUBJECTS_PARAMS)
puts("Done! Subjects created: #{subjects.length}")

puts('Creating Courses...')
courses = Course.create!(COURSES_PARAMS)
puts("Done! Courses created: #{courses.length}")

# progression equals to a random number (0 or 1) that defines if a student's going to have
# more than one course enrolled, in a progression of grades e.g 5º Ano (2013), 6º Ano (2016) and so forth.
# if there's a progression then it creates the necessary enrollments, if it reaches 2023 or the the last GRADES
# index + 1, then it doesn't iterate

puts('Creating Enrollments...')
enrollments = []
students.each do |student|
  progression = rand(0..1)
  grade = GRADES[rand(0..4)]
  random_year = rand(2012..2023)

  if progression.zero? || random_year == 2023
    course = courses.select { |course| course.year == random_year && course.name == grade }
    enrollments.push(Enrollment.create!({ code: Digest::UUID.uuid_v4, student:,
                                          course: course[0] }))
  else
    year_index = random_year
    continue = true
    grades_index = 0
    while continue == true
      if year_index == 2024 || grades_index == 5
        continue = false
        next
      end
      course = courses.select do |c|
        c.year == year_index && c.name == GRADES[grades_index]
      end
      enrollments.push(Enrollment.create!({ code: Digest::UUID.uuid_v4, student:,
                                            course: course[0] }))
      year_index += 1
      grades_index += 1
    end
  end
end
puts("Done! Enrollments created: #{enrollments.length}")

puts('Creating Exams...')
exams = courses.map do |course|
  exams_quantity = course.year == 2023 ? 4 : 8

  subjects.map do |subject|
    exams = []
    (0..exams_quantity - 1).each do
      exams.push(Exam.create!(course:, subject:,
                              realized_on: Faker::Date.in_date_period(year: course.year)))
    end

    exams.entries
  end
end.flatten
puts("Done! Exams created: #{exams.length}")

puts('Creating Grades...')
grades = enrollments.map do |enrollment|
  enrollments_exams = exams.select { |exam| exam.course_id == enrollment.course_id }

  enrollments_exams.map do |exam|
    value = rand(0..10)
    Grade.create!(value:, exam:, enrollment:)
  end
end.flatten
puts("Done! Grades created: #{grades.length}")

puts('Creating Teachers Assignments...')
teacher_assignments = courses.map do |course|
  teachers.map do |teacher|
    random_subject_index = rand(0..6)
    random_subject = subjects[random_subject_index]
    TeacherAssignment.create!(course:, teacher:, subject: random_subject)
  end
end.flatten

puts("Done! Teachers Assignments created: #{teacher_assignments.length}")

puts('Seed FINALLY completed successfully')
