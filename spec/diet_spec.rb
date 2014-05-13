require_relative 'spec_helper'

describe Diet do
  context ".all" do
    context "with no diets in the database" do
      it "should return an empty array" do
        Diet.all.should == []
      end
    end
    context "with multiple diets in the db" do
      let!(:foo){ Person.create("Foo") }
      let!(:boo){ Person.create("Boo") }
      let!(:hoo){ Person.create("Hoo") }
      let!(:vegi){ Diet.create(foo.id, "Vegeterian", 4) }
      let!(:vegan){ Diet.create(boo.id, "Vegan", 3) }
      let!(:full){ Diet.create(hoo.id, "Full", 5) }
      it "should return all of the diets" do
        diets_attrs = Diet.all.map{ |diet| [diet.user_id,diet.type,diet.freq] }
        diets_attrs.should == [[foo.id, "Vegeterian", 4], [boo.id, "Vegan", 3], [hoo.id, "Full", 5]]
      end
    end
    context "with one diets in the db" do
      let(:details) do
<<EOS
 1. Garbonzo Bean Burger
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
EOS
      end
      let!(:foo){ Person.create("Foo") }
      let!(:vegi){ Diet.create(foo.id, "Vegeterian", 4) }
      it "should return the diets" do
        diets_attrs = Diet.all.map{ |diet| [diet.user_id,diet.type,diet.freq,diet.detail] }
        diets_attrs.should == [[foo.id, "Vegeterian", 4, details]]
      end
    end
  end

  context ".count" do
    context "with no diet in the database" do
      it "should return 0" do
        Diet.count.should == 0
      end
    end
    context "with multiple items in the database" do
      let!(:foo){ Person.create("Foo") }
      let!(:boo){ Person.create("Boo") }
      let!(:hoo){ Person.create("Hoo") }
      let!(:vegi){ Diet.create(foo.id, "Vegeterian", 4) }
      let!(:vegan){ Diet.create(boo.id, "Vegan", 3) }
      let!(:full){ Diet.create(hoo.id, "Full", 5) }
      it "should return the correct count of the records" do
        Diet.count.should == 3
      end
    end
  end

  context ".find_by_id" do
    let(:foo){ Person.create("Foo") }
    context "with no data in the database" do
      it "should return nil" do
        Diet.find_by_id(foo.id).should be_nil
      end
    end
    context "with record in the database" do
      let!(:foo){ Person.create("Foo") }
      let!(:boo){ Person.create("Boo") }
      let!(:hoo){ Person.create("Hoo") }
      let!(:vegi){ Diet.create(foo.id, "Vegeterian", 4) }
      let!(:vegan){ Diet.create(boo.id, "Vegan", 3) }
      let!(:full){ Diet.create(hoo.id, "Full", 5) }
      it "should find the user by id" do
        Diet.find_by_id(foo.id).type.should == "Vegeterian"
      end
      it "should return the correct frequency of diet" do
        Diet.find_by_id(boo.id).freq.should == 3
      end
    end
  end

  context ".last" do
    context "with no data in the database" do
      it "should return nil" do
        Diet.last.should be_nil
      end
    end
    context "with multiple data in the database" do
      let!(:foo){ Person.create("Foo") }
      let!(:boo){ Person.create("Boo") }
      let!(:hoo){ Person.create("Hoo") }
      let!(:vegi){ Diet.create(foo.id, "Vegeterian", 4) }
      let!(:vegan){ Diet.create(boo.id, "Vegan", 3) }
      let!(:full){ Diet.create(hoo.id, "Full", 5) }
      it "should return the last record in the db" do
        Diet.last.type.should == "Full"
      end
      it "should return the correct id" do
        Diet.last.user_id.should == hoo.id
      end
    end
  end

  context "#new" do
    let(:foo){ Person.create("Foo") }
    let(:diet){ Diet.create(foo.id, "Vegeterian", 4) }
    it "should store the diet" do
      diet.type == "Vegeterian"
    end
  end

  context "#create" do
    let(:result){ Environment.database_connection.execute("Select * from diets") }
    let(:foo){ Person.create("Foo") }
    let(:diet){ Diet.create(foo.id, "Vegeterian", 4) }
    context "with a valid entry" do
      before do
        Diet.any_instance.stub(:valid?){ true }
        diet
      end
      it "should record the new id" do
        diet.id == result[0]["id"]
      end
      it "should record the correct type" do
        result[0]["type"] == "Vegeterian"
      end
      it "should record the correct frequency" do
        result[0]["freq"] == 4
      end
    end
    context "with an invalid entry" do
      before do
        Diet.any_instance.stub(:valid?){ false }
        diet
      end
      it "should not return a record" do
        result.count.should == 0
      end
    end
  end

  context "#save" do
    let(:result){ Environment.database_connection.execute("Select * from diets") }
    let(:foo){ Person.create("Foo") }
    let(:boo){ Person.create("Boo") }
    let(:diet){ Diet.new(foo.id, "Vegeterian", 4) }
    let(:diet2){ Diet.create(foo.id, "Vegan", 5) }
    context "with a valid entry" do
      before do
        Diet.any_instance.stub(:valid?){ true }
        diet
      end
      it "should record the new id" do
        diet.save
        diet.id == result[0]["id"]
      end
      it "should record the correct type" do
        diet.save
        result[0]["type"] == "Vegeterian"
      end
      it "should record the correct frequency" do
        diet.save
        result[0]["freq"] == 4
      end
    end
    context "with an invalid entry" do
      before do
        Diet.any_instance.stub(:valid?){ false }
        diet
      end
      it "should not return a record" do
        diet.save
        result.count.should == 0
      end
    end
    context "with record already exists" do
      before do
        diet2.type = "Full"
        diet2.freq = 6
        Diet.any_instance.stub(:valid_for_update?){ true }
        diet2
      end
      it "should update the record" do
        diet2.save
        result[0]["type"] = "Full"
      end
      it "should update the frequency" do
        diet2.save
        result[0]["freq"] = 6
      end
    end
    context "update with invalid entry" do
      before do
        Diet.any_instance.stub(:valid_for_update?){ false }
        diet2
      end
      it "should not update the record" do
        diet2.save
        result[0]["type"] == "Vegan"
      end
    end

  end

  context "#valid?" do
    let(:result){ Environment.database_connection.execute("Select * from diets") }
    let(:foo){ Person.create("Foo") }
    context "after fixing the error" do
      let(:diet){ Diet.new(foo.id, "123", 4) }
      it "should return true" do
        diet.valid?.should be_false
        diet.type = "Vegeterian"
        diet.valid?.should be_true
      end
    end
    context "with a unique name" do
      let(:diet){ Diet.new(foo.id, "Vegan", 4) }
      it "should return true" do
        diet.valid?.should be_true
      end
    end
    context "with an invalid name" do
      let(:diet){ Diet.new(foo.id, "Vegan", "Jim") }
      it "should return false" do
        diet.valid?.should be_false
      end
      it "should save an error messages" do
        diet.valid?
        diet.errors.first.should == "'Jim' is not a valid entry."
      end
    end
  end

  context "#delete" do
    let(:result){ Environment.database_connection.execute("Select * from diets") }
    let(:foo){ Person.create("Foo") }
    let(:diet){ Diet.new(foo.id, "Vegeterian", 4) }
    it "should delete a diet" do
      diet.delete
      Diet.find_by_id(diet.id).should be_nil
    end
    it "should return nil with result" do
      result.count.should == 0
    end
  end

end

