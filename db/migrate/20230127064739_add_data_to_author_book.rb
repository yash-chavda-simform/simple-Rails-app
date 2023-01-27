class AddDataToAuthorBook < ActiveRecord::Migration[7.0]
  def change
    Author.create(first_name:"yash",last_name:"chavda",dob:"19/10/2001",email:"yash42007@gmail.com")
    Author.create(first_name:"jay",last_name:"bhardiya",dob:"25/5/2000",email:"Jay42007@gmail.com")
    Author.create(first_name:"Prashant",last_name:"chavda",dob:"13/5/2001",email:"Prashant42007@gmail.com")
    Book.create(name:"Book1",price:100,author_id:3)
    Book.create(name:"Book2",price:100,author_id:4)
    Book.create(name:"Book3",price:100,author_id:3)
  end
end
