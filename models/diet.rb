class Diet
  attr_accessor :type
  attr_accessor :freq
  attr_accessor :user_id
  attr_reader :id
  attr_reader :errors

  def initialize(user_id, type, freq = 3)
    @user_id = user_id
    @type = type
    @freq = freq
  end

  def self.all
    statement = "Select * from diets;"
    execute_and_instantiate(statement)
  end

  def self.count
    statement = "Select count(*) from diets;"
    result = Environment.database_connection.execute(statement)
    result[0][0]
  end

  def self.create(user_id, type, freq)
    diet = Diet.new(user_id, type, freq)
    diet.save
    diet
  end

  def self.find_by_id(user_id)
    statement = "Select * from diets where user_id == ?;"
    execute_and_instantiate(statement, user_id)[0]
  end

  def self.last
    statement = "Select * from diets order by id DESC limit(1);"
    execute_and_instantiate(statement)[0]
  end

  def save
    if self.valid?
      statement = "Insert into diets (user_id, type, freq) values (?, ?, ?);"
      Environment.database_connection.execute(statement, [user_id, type, freq])
      @id = Environment.database_connection.execute("SELECT last_insert_rowid();")[0][0]
      true
    else
      false
    end
  end

  def valid?
    @errors = []
    if !type.match /[a-zA-Z]/ || freq.to_i < 3 || freq.to_i > 9
      @errors << "'#{self.type}' is not a valid entry."
    elsif freq.to_i < 3 || freq.to_i > 9
      @errors << "'#{self.freq}' is not a valid entry."
    end
    if Diet.find_by_id(self.user_id)
      @errors << "#{self.user_id} already exists."
    end
    @errors.empty?
  end

  private

  def self.execute_and_instantiate(statement, bind_vars = [])
    rows = Environment.database_connection.execute(statement, bind_vars)
    results = []
    rows.each do |row|
      diet = Diet.new(row["user_id"], row["type"], row["freq"])
      diet.instance_variable_set(:@id,row["id"])
      results << diet
    end
    results
  end
end
