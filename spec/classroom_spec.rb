require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'It should initialize a classroom and add student to it' do
    classroom = Classroom.new('Class 1')
    student = Student.new(id: 1, age: 22, name: 'Student 1', parent_permission: true, classroom: classroom.label)
    it 'should create new classroom' do
      expect(classroom.label).to eq 'Class 1'
    end
    it 'should add student to new classroom' do
      classroom.add_student(student)
      expect(classroom.students.length).to eq 1
    end
  end
end
