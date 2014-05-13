class Diet
  attr_accessor :type
  attr_accessor :freq
  attr_accessor :user_id
  attr_accessor :detail
  attr_reader :id
  attr_reader :errors

  def initialize(user_id, type, freq = 3)
    @user_id = user_id
    @type = type
    @freq = freq
    @detail = set_detail
  end

  def set_detail
    if type == "Vegeterian"
      " 1. Garbonzo Bean Burger
      INGERIDENTS:
      >>16 ozs garbanzo beans (drained)
      >>1 cup shredded carrots
      >>1/3 cup seasoned bread crumbs
      >>2 tbsps italian salad dressing
      >>1 eggs
      >>2 tbsps olive oil
      >>1 dash red pepper flakes (optional)
      ,  2. Eggplant Parmesan
      INGERIDENTS:
      >>2 eggs
      >>1 cup breadcrumbs (Italian seasoned)
      >>1 cup grated parmesan cheese (divided)
      >>1/2 tsp coarse salt
      >>1/4 tsp black ground pepper (freshly)
      >>1 eggplant (large - sliced into 8 rounds)
      >>4 tbsps olive oil
      >>3 cups tomato sauce
      >>1 lb fresh mozzarella (sliced into 8 pieces)
      ,  3. Addictive Sweet Potato
      INGERIDENTS:
      >>1 sweet potatoes (large - chopped)
      >>1/4 sweet onion (chopped)
      >>1/4 tsp salt
      >>1/4 tsp pepper
      >>1/4 tsp smoked paprika
      >>1 tbsp olive oil (or bacon grease!)
      ,  4. Spinach Quiche
      INGERIDENTS:
      >>3 ozs cream cheese (room temperature)
      >>1/3 cup half & half (or milk)
      >>3 eggs
      >>10 ozs chop frozen spinach (thawed and drained)
      >>1/2 cup shredded cheddar cheese (gruyere works well too)
      >>1/4 cup grated parmesan cheese
      >>6 green onions (thinly sliced - 1/2 cup finely diced red or white onion or shallots work as well)
      >>1/4 tsp salt
      >>1/4 tsp pepper
      ,  5. Lentil Soup
      INGERIDENTS:
      >>1 tbsp minced garlic (I used minced garlic from a jar)
      >>1 tbsp minced ginger
      >>1/2 cup chopped celery (or fennel)
      >>1 cup carrots (chopped)
      >>1/2 onion (chopped)
      >>2 tbsps olive oil (use more or less - depending on your pan)
      >>1 tbsp curry powder (I used Penzeys Sweet Curry Powder)
      >>1 cup brown lentils
      >>1 qt chicken stock
      >>black ground pepper
      >>salt
      >>chopped cilantro (or parsley to garnish the soup)
      ,  6. Spaghetti Squash
      INGERIDENTS:
      >>6 lbs spaghetti squash
      >>2 tbsps olive oil
      >>2 tsps unsalted butter
      >>freshly ground pepper
      >>coarse salt
      >>1/2 cup fresh herbs (torn - such as parsley - summer savory - thyme - and chervil)
      >>1/2 cup parmesan cheese (shaved)
      >>1 cup ricotta cheese (fresh)
      ,  7. Spinach Egg Scramble
      INGERIDENTS:
      >>6 eggs (beaten)
      >>3/4 cup onion (chopped)
      >>1/4 cup all-purpose flour
      >>10 ozs chop frozen spinach (thawed and drained)
      >>16 ozs small curd cottage cheese
      >>16 ozs shredded cheddar cheese
      >>1/2 cup butter (melted)
      >>pepper
      >>salt
      , ********************************************************
"
    elsif type == "Vegan"
      " 1. Tofu Salad
      INGERIDENTS:
      >>2 cucumber (lemon - quartered then sliced into 1/4 inch thick slices)
      >>1 handful fresh dill (about 2/3 cup loosely packed)
      >>1/4 cup extra-virgin olive oil
      >>1/4 cup fresh lemon juice
      >>1 pinch salt
      >>8 ozs extra firm tofu (nigari)
      >>1/4 cup pine nuts
      >>1/2 avocado (a large - ripe)
      , Guacamole
      INGERIDENTS:
      >>2 hass avocado (ripe - peeled and cut in half)
      >>2 cloves garlic (crushed)
      >>1 serrano peppers (diced)
      >>1/2 cup chopped cilantro
      >>1/2 lime
      >>salt (to taste)
      , Quinoa and Black Beans
      INGERIDENTS:
      >>1 cup quinoa (uncooked - well rinsed)
      >>1/2 tsp salt
      >>2 cups water
      >>1/3 cup purple onion (diced)
      >>2 tbsps lime juice
      >>15 ozs black beans (drained and rinsed)
      >>1 cup frozen corn (or 1 cup of fresh corn)
      >>3 tomatoes (medium, seeded and cut into chunks)
      >>5 ozs queso fresco (or any farmer's cheese - cut into 1/4-inch cubes)
      >>1 jalapeno chilies (seeded and finely chopped)
      >>1/4 cup chopped cilantro (including tender stems - packed)
      >>3 tbsps olive oil
      , Roasted Brussels
      INGERIDENTS:
      >>2 lbs brussels sprouts
      >>1/4 cup olive oil
      >>4 garlic cloves (Peeled & Mashed)
      >>1 cup white wine
      >>sea salt
      >>cracked black pepper
      >>extra-virgin olive oil
      , Refried Beans
      INGERIDENTS:
      >>1 cup dried pinto beans (soaked overnight in water)
      >>1 cup yellow onion (chopped)
      >>1 tbsp garlic (minced)
      >>1 whole jalapeno chilies (seeded and chopped)
      >>1/2 cup vegetable oil
      >>1 tsp ground cumin
      >>1/2 tsp salt
      >>1/2 cup monterey jack cheese (shredded)
      , Lentile Soup
      INGERIDENTS:
      >>1 tbsp minced garlic (I used minced garlic from a jar)
      >>1 tbsp minced ginger
      >>1/2 cup chopped celery (or fennel)
      >>1 cup carrots (chopped)
      >>1/2 onion (chopped)
      >>2 tbsps olive oil (use more or less - depending on your pan)
      >>1 tbsp curry powder (I used Penzeys Sweet Curry Powder)
      >>1 cup brown lentils
      >>1 qt chicken stock
      >>black ground pepper
      >>salt
      , Spinach Rice
      INGERIDENTS:
      >>21/2 cups brown rice (leftover/pre-cooked - room temp)
      >>11/2 cups spinach (cups well finely chopped)
      >>4 ozs tofu (firm organic - crumbled)
      >>10 black olives (chopped)
      >>1/2 purple onion (medium - diced)
      >>1/3 cup pine nuts (or almonds - toasted)
      >>2 tbsps olive oil
      >>1/2 cup manchego cheese (shredded or Parm or Gruyere)
      >>3 large eggs
      >>1/2 tsp fine sea salt
      , ********************************************************
"
    else
      " 1. Lasagna
      INGREDIENTS:
      >>Olive oil
      >>1 lb lean ground beef
      >>1/2 medium onion - diced (about 3/4 cup)
      >>1/2 large bell pepper (green.. red.. or yellow) 3/4 cup
      >>2 cloves garlic - minced
      >>1 28-ounce can tomato sauce
      >>1/2 6 oz can (3 oz) tomato paste
      >>1 14-ounce can crushed tomatoes
      >>2 Tbsp chopped fresh oregano or 2 teaspoons dried oregano
      >>1/4 cup chopped fresh parsley (preferably flat leaf) - packed
      >>1 Tbsp Italian Seasoning
      >>Pinch of garlic powder and/or garlic salt
      >>1 Tbsp red or white wine vinegar
      >>1 Tbsp to 1/4 cup sugar (to taste - optional)
      >>Salt
      >>1/2 lb dry lasagna noodles (requires 9 lasagna noodles - unbroken)
      >>15 ounces Ricotta cheese
      >>1 1/2 lb (24 ounces) Mozzarella cheese - grated or sliced
      >>1/4 lb (4 ounces) freshly grated parmesan cheese
      ,  2. Fillet Steak
      INGREDIENTS:
      >>2 fillet steaks
      >>salt and freshly ground black pepper to taste
      >>4 tablespoons balsamic vinegar
      >>4 tablespoons dry red wine
      ,  3. Glazed Roasted Chicken
      INGREDIENTS:
      >>1/3 cup Hellmann's® or Best Foods® Real Mayonnaise
      >>3 Tbsp. finely chopped roasted red pepper
      >>1 tsp. garlic powder
      >>1/2 tsp. dried Italian seasoning
      >>1 tsp. balsamic vinegar
      >>6 boneless - skinless chicken breast halves (about 2 lbs.)
      ,  4. Meat Loaf with Chili Sauce
      INGREDIENTS:
      >>unsalted butter (for coating the loaf pan)
      >>2 tbsps vegetable oil
      >>1 cup yellow onion (small-dice - from about 1/2 medium onion)
      >>1/2 cup carrots (small-dice - from about 1 medium carrot)
      >>1/2 cup celery (small-dice - from about 1 medium celery stalk)
      >>1 garlic cloves (medium - minced)
      >>21/2 tsps kosher salt
      >>3/4 cup dry white wine
      >>2 lbs chicken (ground dark-meat)
      >>1/2 cup panko
      >>1 large eggs (lightly beaten)
      >>1/2 cup cheese (shredded aged Gouda - about 1 ounce)
      >>1 tbsp flat leaf parsley (coarsely chopped fresh)
      >>1 tbsp worcestershire sauce
      >>1 tsp fresh leav thyme (finely chopped)
      >>1/2 tsp black ground pepper (freshly)
      ,  5. Saucy BBQ
      INGERIDENTS:
      >>12 chicken drumsticks (or 8 thighs - about 3 1/2 pounds)
      >>1 cup barbecue sauce (divided)
      >>1 tbsp brown sugar
      >>1 tbsp cider vinegar
      >>1 tsp salt (plus more as needed)
      >>1/2 tsp black ground pepper (freshly)
      >>1/2 tsp hot sauce
      >>vegetable oil (to grease pan)12 chicken drumsticks (or 8 thighs - about 3 1/2 pounds)
      >>1 cup barbecue sauce (divided)
      >>1 tbsp brown sugar
      >>1 tbsp cider vinegar
      >>1 tsp salt (plus more as needed)
      >>1/2 tsp black ground pepper (freshly)
      >>1/2 tsp hot sauce
      >>vegetable oil (to grease pan)
      ,  6. Cowboy Pork Chops With Bbq Rice
      INGREDIENTS:
      >>4 boneless pork chops (about 1 lb.)
      >>1 package (10 oz.) sliced mushrooms
      >>2 cloves garlic - chopped
      >>1 cup shredded Monterey Jack cheese (about 4 oz.)
      >>1 cup canned French fried onions
      >>1 package Knorr® Rice Sides™ - Baby Back BBQ
      ,  7. Saucy Beef Kabobs
      INGREDIENTS:
      >>2 cups tomato juice
      >>1/2 cup butter ? Tasty tip
      >>1/4 cup finely chopped onion
      >>1/3 cup ketchup
      >>1 tsp dry mustard
      >>1 tsp salt
      >>1/2 tsp paprika
      >>1/2 tsp black ground pepper
      >>1 clove garlic (minced)
      >>1 tbsp worcestershire sauce
      >>1 dash hot sauce
      >>2 lbs beef sirloin (cut into 1 inch cubes)
      >>1/2 lb fresh mushrooms (stems removed)
      >>1 pt cherry tomatoes
      >>1 onion (large - quartered)
      >>1 green bell pepper (large - cut into 1 inch pieces)
      , ********************************************************
"
    end
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

  def update
    if self.valid_for_update?
      if self.id
        statement = "Update diets set type = ?, freq = ?, detail = ? where user_id = ?;"
        Environment.database_connection.execute(statement, [type, freq, detail, self.user_id])
      end
      true
    else
      false
    end
  end

  def save
    if self.valid?
      statement = "Insert into diets (user_id, type, freq, detail) values (?, ?, ?, ?);"
      Environment.database_connection.execute(statement, [user_id, type, freq, detail])
      @id = Environment.database_connection.execute("SELECT last_insert_rowid();")[0][0]
      true
    else
      false
    end
  end

  def valid_for_update?
    @errors = []
    if !type.match /[a-zA-Z]/
      @errors << "'#{self.type}' is not a valid entry as it doesn't include letters."
    end
    if freq.to_i < 3 || freq.to_i > 9
      @errors << "'#{self.freq}' is not a valid entry."
    end
    @errors.empty?
  end

  def valid?
    @errors = []
    if !type.match /[a-zA-Z]/
      @errors << "'#{self.type}' is not a valid entry as it doesn't include letters."
    end
    if freq.to_i < 3 || freq.to_i > 9
      @errors << "'#{self.freq}' is not a valid entry."
    end
    if Diet.find_by_id(self.user_id)
      @errors << "#{self.user_id} already exists."
    end
    @errors.empty?
  end

  def delete
    statement = "Delete from diets where user_id = ?;"
    Environment.database_connection.execute(statement, self.user_id)
    true
  end

  private

  def self.execute_and_instantiate(statement, bind_vars = [])
    rows = Environment.database_connection.execute(statement, bind_vars)
    results = []
    rows.each do |row|
      diet = Diet.new(row["user_id"], row["type"], row["freq"])
      diet.instance_variable_set(:@id, row["id"])
      results << diet
    end
    results
  end
end
