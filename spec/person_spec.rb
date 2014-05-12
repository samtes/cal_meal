require_relative 'spec_helper'

describe Person do
  context ".all" do
    context "with no people in the database" do
      it "should return an empty array" do
        Person.all.should == []
      end
    end
    context "with multiple people in the db" do
      let!(:foo){ Person.create("Foo") }
      let!(:bar){ Person.create("Bar") }
      let!(:boo){ Person.create("Boo") }
      it "should return all of the people" do
        person_attrs = Person.all.map{ |person| [person.name,person.id] }
        person_attrs.should == [["Foo", foo.id], ["Bar", bar.id], ["Boo", boo.id]]
      end
    end
  end

  context ".count" do
    context "with no people in the database" do
      it "should return 0" do
        Person.count.should == 0
      end
    end
    context "with multiple users in the db 1" do
      let!(:foo){ Person.create("Foo") }
      let!(:bar){ Person.create("Bar") }
      let!(:boo){ Person.create("Boo") }
      it "should return the number of the records" do
        Person.count.should == 3
      end
    end
    context "with multiple users in the db 2" do
      before do
        Person.new("Foo").save
        Person.new("Bar").save
        Person.new("Boo").save
        it "should return the number of the records" do
          Person.count.should == 3
        end
      end
    end
  end

  context ".find_by_name" do
    context "with no people in the database" do
      it "should return the proper error message" do
        Person.find_by_name("Foo").should be_nil
      end
    end
    context "with multiple names in the db" do
      let(:foo){ Person.create("Foo") }
      before do
        Person.new("Foo").save
        Person.new("Bar").save
        Person.new("Boo").save
        it "should return the name passed" do
          Person.find_by_name("Foo").id.should == foo.id
        end
        it "should return a person with that name" do
          Person.find_by_name("Foo").name.should == foo.name
        end
      end
    end
  end

  context ".last" do
    context "with no people in the db" do
      it "should return nil" do
        Person.last.should be_nil
      end
    end
    context "with multiple people in the db" do
      before do
        Person.new("Foo").save
        Person.new("Bar").save
        Person.new("Boo").save
        it "should return the last person in the db" do
          Person.last.name.should == "Boo"
        end
      end
    end
  end

  context "#new" do
    let(:person){ Person.new("Foo") }
    it "should store the name" do
      person.name == "Foo"
    end
  end

  context "#create" do
    let(:result){ Environment.database_connection.execute("Select * from people") }
    let(:person){ Person.create("Goo") }
    context "with a valid name" do
      before do
        Person.any_instance.stub(:valid?){ true }
        person
      end
      it "should record the new id" do
        person.id == result[0]["id"]
      end
      it "should record the new name" do
        result[0]["name"] == "Goo"
      end
      it "should return the correct count" do
        result.count.should == 1
      end
    end
    context "with invalid entry" do
      before do
        Person.any_instance.stub(:valid?){ false }
        person
      end
      it "should not save the new person" do
        result.count.should == 0
      end
    end
  end

  context "#save" do
    let(:result){ Environment.database_connection.execute("Select * from people") }
    let(:person){ Person.new("Goo") }
    let(:person2){ Person.create("Goo") }
    context "with a valid person" do
      before do
        person.stub(:valid?){ true }
      end
      it "should only save one row in the db" do
        person.save
        result.count.should == 1
      end
      it "should save the record in the db" do
        person.save
        result[0]["name"] == "Goo"
      end
      it "should save the records id" do
        person.save
        person.id == result[0]["id"]
      end
    end
    context "with record already exists" do
      before do
        person2.name = "Hii"
        Person.any_instance.stub(:valid?){ true }
        person2
      end
      it "should update the record" do
        person2.save
        result[0]["name"] = "Hii"
      end
      it "should update the frequency" do
        person2.save
        result[0]["id"] = person2.id
      end
    end
    context "update with invalid entry" do
      before do
        Person.any_instance.stub(:valid?){ false }
        person2
      end
      it "should not update the record" do
        person2.save
        result.count.should == 0
      end
    end
  end

  context "#valid?" do
    let(:result){ Environment.database_connection.execute("Select * from people") }
    context "after fixing the error" do
      let(:person){ Person.new("123") }
      it "should return true" do
        person.valid?.should be_false
        person.name = "Joo"
        person.valid?.should be_true
      end
    end
    context "with a unique name" do
      let(:person){ Person.new("Poo") }
      it "should return true" do
        person.valid?.should be_true
      end
    end
    context "with an invalid name" do
      let(:person){ Person.new("349") }
      it "should return false" do
        person.valid?.should be_false
      end
      it "should save an error messages" do
        person.valid?
        person.errors.first.should == "'349' is not a valid person name, as it does not include any letters."
      end
      context "with a duplicate name" do
        let(:name){ "Susan" }
        let(:person){ Person.new(name) }
        before do
          Person.new(name).save
        end
        it "should return false" do
          person.valid?.should be_false
        end
        it "should save the error messages" do
          person.valid?
          person.errors.first.should == "#{name} already exists."
        end
      end
    end
  end

  context "#delete" do
    let(:result){ Environment.database_connection.execute("Select * from people") }
    let(:foo){ Person.create("Foo") }
    it "should delete a people" do
      foo.delete
      Person.find_by_name("Foo").should be_nil
    end
    it "should return nil with result" do
      result.count.should == 0
    end
  end
end
