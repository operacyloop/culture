create_table "employee", force: :cascade do |t|
    t.string  "name_of_employee"
    t.text    "details_about_employee"
    t.string "attribute"
    t.integer "user_id"
  end

  Attribute/Characteristic table
  rating -> integer

REQUIREMENTS FOR  PROJECT:

X Build an MVC Sinatra application.
X Use ActiveRecord with Sinatra.
X Use multiple models.
X Use at least one has_many relationship on a User model and one belongs_to relationship on another model.
X Must have user accounts - users must be able to sign up, sign in, and sign out.
>>> ??? Validate uniqueness of user login attribute (username or email).
>>> ??? Once logged in, a user must have the ability to...
X create
X read
>>> update
>>> ? destroy 
the resource that belongs_to user.
>>> ??? Ensure that users can edit and delete only their own resources - not resources created by other users.
>>> ??? Validate user input so bad data cannot be persisted to the database.

BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)