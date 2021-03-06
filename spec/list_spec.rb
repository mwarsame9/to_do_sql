require('rspec')
require('pg')
require('list')
require('spec_helper')


describe(List) do

  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff", :id => nil, :due_date => "2017-05-01"})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff", :id => nil, :due_date => "2017-05-01"})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:name => "Epicodus stuff", :id => nil, :due_date => "2017-05-01 00:00:00"})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff", :id => nil, :due_date => "2017-05-01"})
      list2 = List.new({:name => "Epicodus stuff", :id => nil, :due_date => "2017-05-01"})
      expect(list1).to(eq(list2))
    end
  end

  describe("#sort") do
    it("orders lists by due date") do
      list1 = List.new({:name => "Epicodus stuff", :id => nil, :due_date => "2017-05-05 00:00:00"})
      list1.save()
      list2 = List.new({:name => "Epicodus stuff", :id => nil, :due_date => "2017-05-02 00:00:00"})
      list2.save()
      list3 = List.new({:name => "Epicodus stuff", :id => nil, :due_date => "2017-05-03 00:00:00"})
      list3.save()
      ordered_list = list2, list3, list1
      expect(List.sort()).to(eq(ordered_list))
    end
  end

end
