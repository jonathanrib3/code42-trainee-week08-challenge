# rubocop:disable RSpec/MultipleMemoizedHelpers
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:born_on) }

    describe 'for born_on' do
      around do |example|
        travel_to(Date.new(2022, 5, 15), &example)
      end

      context 'when student was born in the past' do
        subject(:student) { build(:student, born_on: Date.new(2010, 8, 23)).tap(&:valid?) }

        it { is_expected.to be_valid }
        it { expect(student.errors[:born_on]).to be_empty }
      end

      context 'when student will be born in the future' do
        subject(:student) { build(:student, born_on: Date.new(2024, 8, 23)).tap(&:valid?) }

        it { is_expected.not_to be_valid }
        it { expect(student.errors[:born_on]).to include('must be less than 2022-05-15') }
      end

      context 'when student has born today' do
        subject(:student) { build(:student, born_on: Date.new(2022, 5, 15)).tap(&:valid?) }

        it { is_expected.not_to be_valid }
        it { expect(student.errors[:born_on]).to include('must be less than 2022-05-15') }
      end
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:enrollments).dependent(:destroy) }
    it { is_expected.to have_many(:grades).through(:enrollments) }
  end

  describe 'scopes' do
    describe 'find_all_students_enrolled_on_year' do
      context 'when searching for students enrolled on a year' do
        let!(:year) { rand(2012..2023) }
        let!(:course) { create(:course, { year: }) }
        let!(:student) { create(:student) }
        let!(:enrollment) { create(:enrollment, { course:, student: }) }

        it 'retrieves all students data if they are enrolled on the specified year, containing its
            id, name, enrollment code, course name and course year' do
          expect(
            described_class.find_all_students_enrolled_on_year(year)
          ).to eq([[student.id, student.name,
                    enrollment.code, course.name, course.year]])
        end
      end

      context 'when a student is not enrolled on the requested year' do
        let!(:year) { 2023 }
        let!(:course) { create(:course, { year: 2012 }) }
        let!(:student) { create(:student) }
        let!(:enrollment) { create(:enrollment, { course:, student: }) }

        it 'retrieves student name and id' do
          expect(
            described_class.find_all_students_enrolled_on_year(year).first.first.positive? &&
            described_class.find_all_students_enrolled_on_year(year).first.second.include?(student.name)
          ).to be(true)
        end

        it 'does not retrieves all the other data' do
          expect(
            described_class.find_all_students_enrolled_on_year(year).first.third.nil? &&
            described_class.find_all_students_enrolled_on_year(year).first.fourth.nil? &&
            described_class.find_all_students_enrolled_on_year(year).first.fifth.nil?
          ).to be(true)
        end
      end
    end

    describe 'find_student_by_id_enrolled_on_year' do
      context 'when searching for a student enrolled on a specific year through its id' do
        let!(:year) { rand(2012..2023) }
        let!(:course) { create(:course, { year: }) }
        let!(:student) { create(:student) }
        let!(:enrollment) { create(:enrollment, { course:, student: }) }

        it 'retrieves the requested student enrolled on a specific year as a Student model object' do
          expect(
            described_class.find_student_by_id_enrolled_on_year(year:, id: student.id)
          ).to eq([student])
        end
      end

      context 'when searching for a non student enrolled on a specific year through its id' do
        let!(:year) { rand(2023) }
        let!(:course) { create(:course, { year: 2012 }) }
        let!(:student) { create(:student) }
        let!(:enrollment) { create(:enrollment, { course:, student: }) }

        it 'retrieves an empty array' do
          expect(
            described_class.find_student_by_id_enrolled_on_year(year:, id: student.id)
          ).to be_empty
        end
      end
    end

    describe 'find_student_grades_averages_by_id' do
      context 'when retrieving all averages from a student through its id' do
        let!(:year_5th) { 2022 }
        let!(:year_6th) { 2023 }
        let!(:course_5th) { create(:course, { year: year_5th, name: '5th grade' }) }
        let!(:course_6th) { create(:course, { year: year_6th, name: '6th grade' }) }
        let!(:student) { create(:student) }
        let!(:enrollment_5th) { create(:enrollment, { course: course_5th, student: }) }
        let!(:enrollment_6th) { create(:enrollment, { course: course_6th, student: }) }
        let!(:subject) { create(:subject) }
        let!(:exams_5th) { create_list(:exam, 2, { course: course_5th, subject: }) }
        let!(:exams_6th) { create_list(:exam, 2, { course: course_6th, subject: }) }
        let!(:grades_5th) do
          create_list(:grade, 2) do |grade, i|
            grade.exam = exams_5th[i]
            grade.enrollment_code = enrollment_5th.code
          end
        end
        let!(:grades_6th) do
          create_list(:grade, 2) do |grade, i|
            grade.exam = exams_6th[i]
            grade.enrollment_code = enrollment_6th.code
          end
        end

        let(:average_5th) do
          grades_values = grades_5th.map { |grade| grade.value }
          grades_values.sum / grades_values.length
        end
        let(:average_6th) do
          grades_values = grades_6th.map { |grade| grade.value }
          grades_values.sum / grades_values.length
        end

        it 'retrieves subject name, course name, course year
        and the average of the grades grouped by course name and year' do
          binding.pry
          expect(described_class.find_student_grades_averages_by_id(student.id)
          .first.flatten).to eq([subject.name, course.name, course.year, average])
        end
      end
    end
  end
end
