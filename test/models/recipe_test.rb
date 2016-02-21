require "test_helper"

class RecipeTest <ActiveSupport::TestCase

    def setup
        @chef = Chef.create(chefname: "bob", email: "bob@example.com")
        @recipe = @chef.recipes.build(name: "Chinese Chicken", summary: "best chinese chicken", description: "Hot oils and chives, add tomato sauce")
    end
    
    test "recipe should be valid" do
        assert @recipe.valid?
    end
    
    test "Chef_id should be present" do
        @recipe.chef_id = nil
        assert_not @recipe.valid?
    end
    
    test "name should be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
    end
    
    test "name length should not be too long" do
        @recipe.name = "a" * 101
        assert_not @recipe.valid?
    end
    
    test "name length should not be too short" do
        @recipe.name = "aaaa"
        assert_not @recipe.valid?
    end
    
    test "Summary must be present" do
        @recipe.summary = " "
        assert_not @recipe.valid?
    end
    
    test "Summary legnth should not be too long" do
        @recipe.summary = "a"*151
        assert_not @recipe.valid?
    end
    
    test "Summary legnth should not be too short" do
        @recipe.summary = "aaaa"
        assert_not @recipe.valid?
    end
    
    test "description must be present" do
        @recipe.description = " "
        assert_not @recipe.valid?
    end
    
    test "description should not be too long" do
       @recipe.description = "a" * 551
       assert_not @recipe.valid?
    end

    test "description should not be too shortrt" do
       @recipe.description = "a" * 1
       assert_not @recipe.valid?
    end
end
