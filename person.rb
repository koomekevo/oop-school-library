class Person
  def initialize(age, name = 'Unknow', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  private

  def of_age?
    @age >= 18
  end
end