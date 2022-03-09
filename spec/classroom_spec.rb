require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'It should initialize a classroom and add student to it' do
    classroom = Classroom.new('Class 1')
    student = Student.new(22, 'Student 1')
    it 'should create new classroom' do
      expect(classroom.label).to eq 'Class 1'
    end
    it 'should add student to new classroom' do
      classroom.add_student(student)
      expect(classroom.students.length).to eq 1
    end
  end
end
