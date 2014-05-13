require "sqlite3"

class Database < SQLite3::Database
  def initialize(database)
    super(database)
    self.results_as_hash = true
  end

  def self.connection(environment)
    @connection ||= Database.new("db/cal_meal_#{environment}.sqlite3")
  end

  def create_tables
    self.execute("CREATE TABLE people (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(50))")
    self.execute("CREATE TABLE diets (id INTEGER PRIMARY KEY AUTOINCREMENT, user_id INTEGER, type varchar(50), freq INTEGER, detail varchar(255))")
    self.execute("CREATE TABLE veggie_meals (id INTEGER PRIMARY KEY AUTOINCREMENT, meal varchar(50), content varchar(255))")
  end

  def execute(statement, bind_vars = [])
    Environment.logger.info("Executing: #{statement} with: #{bind_vars}")
    super(statement, bind_vars)
  end
end
