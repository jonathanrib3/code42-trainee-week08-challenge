# frozen_string_literal: true

class Student < ApplicationRecord
  validates :name, presence: true
  validates :born_on, presence: true,
                      comparison: { less_than: proc { Time.zone.today } }

  has_many :enrollments, dependent: :destroy
  has_many :grades, through: :enrollments

  scope :find_all_students_enrolled_on_year, lambda { |year|
    Course.joins(
      "JOIN \"enrollments\" \"e\"
      ON \"courses\".\"id\" = \"e\".\"course_id\"
      AND \"courses\".\"year\" = #{year}
      RIGHT JOIN \"students\" \"s\"
      ON \"s\".\"id\" = \"e\".\"student_id\""
    ).order('s.id ASC')
          .pluck('s.id', 's.name', 'e.code', 'courses.name', 'courses.year')
  }

  scope :find_student_by_id_enrolled_on_year, lambda { |year:, id:|
    includes(enrollments: :course).where(id:, course: { year: })
  }

  scope :find_student_grades_averages_by_id, lambda { |id|
    joins("JOIN \"enrollments\" \"e\"
      ON \"students\".\"id\" = \"e\".\"student_id\"
      JOIN \"grades\" \"g\"
      ON \"e\".\"code\" = \"g\".\"enrollment_code\"
      JOIN \"exams\" \"ex\"
      ON \"g\".\"exam_id\" = \"ex\".\"id\"
      JOIN \"courses\" \"c\"
      ON \"c\".\"id\" = \"ex\".\"course_id\"
      JOIN \"subjects\" \"s\"
      ON \"s\".\"id\" = \"ex\".\"subject_id\"
      WHERE \"students\".\"id\" = \"#{id}\"")
      .group('s.name', 'c.name', 'c.year')
      .average('g.value')
  }
end
