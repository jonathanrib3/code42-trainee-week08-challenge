# frozen_string_literal: true

STUDENTS_LENGTH = rand(20..40).to_i

students = Student.create!(Array.new(STUDENTS_LENGTH) { { name: Faker::Name.name, born_on: 18.years.ago } })
teachers = Teacher.create!(Array.new(7) { { name: Faker::Name.name } })
subjects = Subject.create!([
                             {
                               name: 'Matemática'
                             },
                             {
                               name: 'Português'
                             },
                             {
                               name: 'História'
                             },
                             {
                               name: 'Geografia'
                             },
                             {
                               name: 'Física'
                             },
                             {
                               name: 'Química'
                             },
                             {
                               name: 'Inglês'
                             }
                           ])

courses = Course.create!([{
                           year: 2012,
                           name: '5º Ano',
                           starts_on: Date.new(2012, 1, 1),
                           ends_on: Date.new(2012, 12, 31)
                         },
                          {
                            year: 2012,
                            name: '6º Ano',
                            starts_on: Date.new(2012, 1, 1),
                            ends_on: Date.new(2012, 12, 31)
                          },
                          {
                            year: 2012,
                            name: '7º Ano',
                            starts_on: Date.new(2012, 1, 1),
                            ends_on: Date.new(2012, 12, 31)
                          },
                          {
                            year: 2012,
                            name: '8º Ano',
                            starts_on: Date.new(2012, 1, 1),
                            ends_on: Date.new(2012, 12, 31)
                          },
                          {
                            year: 2012,
                            name: '9º Ano',
                            starts_on: Date.new(2012, 1, 1),
                            ends_on: Date.new(2012, 12, 31)
                          },
                          {
                            year: 2013,
                            name: '5º Ano',
                            starts_on: Date.new(2013, 1, 1),
                            ends_on: Date.new(2013, 12, 31)
                          },
                          {
                            year: 2013,
                            name: '6º Ano',
                            starts_on: Date.new(2013, 1, 1),
                            ends_on: Date.new(2013, 12, 31)
                          },
                          {
                            year: 2013,
                            name: '7º Ano',
                            starts_on: Date.new(2013, 1, 1),
                            ends_on: Date.new(2013, 12, 31)
                          },
                          {
                            year: 2013,
                            name: '8º Ano',
                            starts_on: Date.new(2013, 1, 1),
                            ends_on: Date.new(2013, 12, 31)
                          },
                          {
                            year: 2013,
                            name: '9º Ano',
                            starts_on: Date.new(2013, 1, 1),
                            ends_on: Date.new(2013, 12, 31)
                          },
                          {
                            year: 2014,
                            name: '5º Ano',
                            starts_on: Date.new(2014, 1, 1),
                            ends_on: Date.new(2014, 12, 31)
                          },
                          {
                            year: 2014,
                            name: '6º Ano',
                            starts_on: Date.new(2014, 1, 1),
                            ends_on: Date.new(2014, 12, 31)
                          },
                          {
                            year: 2014,
                            name: '7º Ano',
                            starts_on: Date.new(2014, 1, 1),
                            ends_on: Date.new(2014, 12, 31)
                          },
                          {
                            year: 2014,
                            name: '8º Ano',
                            starts_on: Date.new(2014, 1, 1),
                            ends_on: Date.new(2014, 12, 31)
                          },
                          {
                            year: 2014,
                            name: '9º Ano',
                            starts_on: Date.new(2014, 1, 1),
                            ends_on: Date.new(2014, 12, 31)
                          },
                          {
                            year: 2015,
                            name: '5º Ano',
                            starts_on: Date.new(2015, 1, 1),
                            ends_on: Date.new(2015, 12, 31)
                          },
                          {
                            year: 2015,
                            name: '6º Ano',
                            starts_on: Date.new(2015, 1, 1),
                            ends_on: Date.new(2015, 12, 31)
                          },
                          {
                            year: 2015,
                            name: '7º Ano',
                            starts_on: Date.new(2015, 1, 1),
                            ends_on: Date.new(2015, 12, 31)
                          },
                          {
                            year: 2015,
                            name: '8º Ano',
                            starts_on: Date.new(2015, 1, 1),
                            ends_on: Date.new(2015, 12, 31)
                          },
                          {
                            year: 2015,
                            name: '9º Ano',
                            starts_on: Date.new(2015, 1, 1),
                            ends_on: Date.new(2015, 12, 31)
                          },
                          {
                            year: 2016,
                            name: '5º Ano',
                            starts_on: Date.new(2016, 1, 1),
                            ends_on: Date.new(2016, 12, 31)
                          },
                          {
                            year: 2016,
                            name: '6º Ano',
                            starts_on: Date.new(2016, 1, 1),
                            ends_on: Date.new(2016, 12, 31)
                          },
                          {
                            year: 2016,
                            name: '7º Ano',
                            starts_on: Date.new(2016, 1, 1),
                            ends_on: Date.new(2016, 12, 31)
                          },
                          {
                            year: 2016,
                            name: '8º Ano',
                            starts_on: Date.new(2016, 1, 1),
                            ends_on: Date.new(2016, 12, 31)
                          },
                          {
                            year: 2016,
                            name: '9º Ano',
                            starts_on: Date.new(2016, 1, 1),
                            ends_on: Date.new(2016, 12, 31)
                          },
                          {
                            year: 2017,
                            name: '5º Ano',
                            starts_on: Date.new(2017, 1, 1),
                            ends_on: Date.new(2017, 12, 31)
                          },
                          {
                            year: 2017,
                            name: '6º Ano',
                            starts_on: Date.new(2017, 1, 1),
                            ends_on: Date.new(2017, 12, 31)
                          },
                          {
                            year: 2017,
                            name: '7º Ano',
                            starts_on: Date.new(2017, 1, 1),
                            ends_on: Date.new(2017, 12, 31)
                          },
                          {
                            year: 2017,
                            name: '8º Ano',
                            starts_on: Date.new(2017, 1, 1),
                            ends_on: Date.new(2017, 12, 31)
                          },
                          {
                            year: 2017,
                            name: '9º Ano',
                            starts_on: Date.new(2017, 1, 1),
                            ends_on: Date.new(2017, 12, 31)
                          },
                          {
                            year: 2018,
                            name: '5º Ano',
                            starts_on: Date.new(2018, 1, 1),
                            ends_on: Date.new(2018, 12, 31)
                          },
                          {
                            year: 2018,
                            name: '6º Ano',
                            starts_on: Date.new(2018, 1, 1),
                            ends_on: Date.new(2018, 12, 31)
                          },
                          {
                            year: 2018,
                            name: '7º Ano',
                            starts_on: Date.new(2018, 1, 1),
                            ends_on: Date.new(2018, 12, 31)
                          },
                          {
                            year: 2018,
                            name: '8º Ano',
                            starts_on: Date.new(2018, 1, 1),
                            ends_on: Date.new(2018, 12, 31)
                          },
                          {
                            year: 2018,
                            name: '9º Ano',
                            starts_on: Date.new(2018, 1, 1),
                            ends_on: Date.new(2018, 12, 31)
                          },
                          {
                            year: 2019,
                            name: '5º Ano',
                            starts_on: Date.new(2019, 1, 1),
                            ends_on: Date.new(2019, 12, 31)
                          },
                          {
                            year: 2019,
                            name: '6º Ano',
                            starts_on: Date.new(2019, 1, 1),
                            ends_on: Date.new(2019, 12, 31)
                          },
                          {
                            year: 2019,
                            name: '7º Ano',
                            starts_on: Date.new(2019, 1, 1),
                            ends_on: Date.new(2019, 12, 31)
                          },
                          {
                            year: 2019,
                            name: '8º Ano',
                            starts_on: Date.new(2019, 1, 1),
                            ends_on: Date.new(2019, 12, 31)
                          },
                          {
                            year: 2019,
                            name: '9º Ano',
                            starts_on: Date.new(2019, 1, 1),
                            ends_on: Date.new(2019, 12, 31)
                          },
                          {
                            year: 2020,
                            name: '5º Ano',
                            starts_on: Date.new(2020, 1, 1),
                            ends_on: Date.new(2020, 12, 31)
                          },
                          {
                            year: 2020,
                            name: '6º Ano',
                            starts_on: Date.new(2020, 1, 1),
                            ends_on: Date.new(2020, 12, 31)
                          },
                          {
                            year: 2020,
                            name: '7º Ano',
                            starts_on: Date.new(2020, 1, 1),
                            ends_on: Date.new(2020, 12, 31)
                          },
                          {
                            year: 2020,
                            name: '8º Ano',
                            starts_on: Date.new(2020, 1, 1),
                            ends_on: Date.new(2020, 12, 31)
                          },
                          {
                            year: 2020,
                            name: '9º Ano',
                            starts_on: Date.new(2020, 1, 1),
                            ends_on: Date.new(2020, 12, 31)
                          },
                          {
                            year: 2021,
                            name: '5º Ano',
                            starts_on: Date.new(2021, 1, 1),
                            ends_on: Date.new(2021, 12, 31)
                          },
                          {
                            year: 2021,
                            name: '6º Ano',
                            starts_on: Date.new(2021, 1, 1),
                            ends_on: Date.new(2021, 12, 31)
                          },
                          {
                            year: 2021,
                            name: '7º Ano',
                            starts_on: Date.new(2021, 1, 1),
                            ends_on: Date.new(2021, 12, 31)
                          },
                          {
                            year: 2021,
                            name: '8º Ano',
                            starts_on: Date.new(2021, 1, 1),
                            ends_on: Date.new(2021, 12, 31)
                          },
                          {
                            year: 2021,
                            name: '9º Ano',
                            starts_on: Date.new(2021, 1, 1),
                            ends_on: Date.new(2021, 12, 31)
                          },
                          {
                            year: 2022,
                            name: '5º Ano',
                            starts_on: Date.new(2022, 1, 1),
                            ends_on: Date.new(2022, 12, 31)
                          },
                          {
                            year: 2022,
                            name: '6º Ano',
                            starts_on: Date.new(2022, 1, 1),
                            ends_on: Date.new(2022, 12, 31)
                          },
                          {
                            year: 2022,
                            name: '7º Ano',
                            starts_on: Date.new(2022, 1, 1),
                            ends_on: Date.new(2022, 12, 31)
                          },
                          {
                            year: 2022,
                            name: '8º Ano',
                            starts_on: Date.new(2022, 1, 1),
                            ends_on: Date.new(2022, 12, 31)
                          },
                          {
                            year: 2022,
                            name: '9º Ano',
                            starts_on: Date.new(2022, 1, 1),
                            ends_on: Date.new(2022, 12, 31)
                          },
                          {
                            year: 2023,
                            name: '5º Ano',
                            starts_on: Date.new(2023, 1, 1),
                            ends_on: Date.new(2023, 12, 31)
                          },
                          {
                            year: 2023,
                            name: '6º Ano',
                            starts_on: Date.new(2023, 1, 1),
                            ends_on: Date.new(2023, 12, 31)
                          },
                          {
                            year: 2023,
                            name: '7º Ano',
                            starts_on: Date.new(2023, 1, 1),
                            ends_on: Date.new(2023, 12, 31)
                          },
                          {
                            year: 2023,
                            name: '8º Ano',
                            starts_on: Date.new(2023, 1, 1),
                            ends_on: Date.new(2023, 12, 31)
                          },
                          {
                            year: 2023,
                            name: '9º Ano',
                            starts_on: Date.new(2023, 1, 1),
                            ends_on: Date.new(2023, 12, 31)
                          }])

GRADES = ['5º Ano', '6º Ano', '7º Ano', '8º Ano', '9º Ano'].freeze

enrollments = []

# PROGRESSION equals to a random number (0 or 1) that defines if a student's going to have
# more than one course enrolled, in a progression of grades e.g 5º Ano (2013), 6º Ano (2016) and so forth.
# if there's a progression then it creates the necessary enrollments, if it reaches 2023 or the the last GRADES
# index + 1, then it doesn't iterate
students.each do |student|
  PROGRESSION = rand(0..1).to_i
  grade = GRADES[rand(0..4)]
  random_year = rand(2012..2023).to_i

  if PROGRESSION.zero? || random_year == 2023
    course = courses.select { |c| c.year == random_year && c.name == grade }
    enrollments.push(Enrollment.create!({ code: Digest::UUID.uuid_v4, student:, course: course[0] }))
  else
    year_index = random_year
    continue = true
    grades_index = 0
    while continue == true
      if year_index == 2024 || grades_index == 5
        continue = false
        next
      end
      course = courses.select { |c| c.year == year_index && c.name == GRADES[grades_index] }
      enrollments.push(Enrollment.create!({ code: Digest::UUID.uuid_v4, student:, course: course[0] }))

      year_index += 1
      grades_index += 1
    end
  end
end

exams = []

courses.each do |course|
  exams_quantity = course.year == 2023 ? 4 : 8

  subjects.each do |subject|
    for i in 0..exams_quantity - 1 do
      exams.push(Exam.create!(course:, subject:, realized_on: Faker::Date.in_date_period(year: course.year)))
    end
  end
end

grades = []

enrollments.each do |enrollment|
  enrollments_exams = exams.select { |e| e.course.id == enrollment.course.id }

  enrollments_exams.each do |exam|
    value = rand(0..10).to_i
    grades.push(Grade.create!(value:, exam:, enrollment:))
  end
end

courses.each do |course|
  teachers.each do |teacher|
    random_subject_index = rand(0..6).to_i
    random_subject = subjects[random_subject_index]
    TeacherAssignment.create!(course:, teacher:, subject: random_subject)
  end
end
