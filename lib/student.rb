class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade
  end

  def self.create_table

    sql_command = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
    )
    SQL
    DB[:conn].execute(sql_command)
  end

  def self.drop_table
    sql_command = <<-SQL
      DROP TABLE students;
    SQL
    DB[:conn].execute(sql_command)
  end

  def save
    sql_command = <<-SQL
    INSERT INTO students (name, grade) VALUES (#{self.name}, #{self.grade});
    SQL
    DB[:conn].execute(sql_command)
  end
end
