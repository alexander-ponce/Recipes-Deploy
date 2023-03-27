from flask_app.config.mysqlconnection import connectToMySQL
from flask_app.models import user_model
from flask import flash


class Recipes:
    DB = "recipes"
    def __init__(self, data):
        self.id = data['id']
        self.user_id = data['user_id']
        self.name = data['name']
        self.description = data['description']
        self.instructions = data['instructions']
        self.under_time = data['under_time']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']
        self.creator = None

    @classmethod
    def save_recipe(cls, data):
        # if not cls.validate_post(data):
        #     return False

        query= '''
                INSERT INTO recipes (user_id, name, description, instructions, under_time)
                VALUES (%(user_id)s, %(name)s, %(description)s, %(instructions)s, %(under_time)s);
        '''
        result = connectToMySQL(cls.DB).query_db(query,data)
        return result



    @classmethod
    def get_all_recipes(cls):
        query= """
            SELECT * FROM recipes
            JOIN Users
            Where recipes.user_id = users.id
            ORDER BY recipes.id DESC;
            
        """
        results = connectToMySQL(cls.DB).query_db(query)
        
        all_posts = []

        for row in results:

            one_post = cls(row)
            
            user_data = {
                'id': row ['user_id'],
                'first_name': row ['first_name'],
                'last_name': row ['last_name'],
                'email': row ['email'],
                'password': row ['password'],
                'created_at': row ['created_at'],
                'updated_at': row ['updated_at']
            }
            one_post.creator = user_model.Users(user_data)
            all_posts.append(one_post)
        return all_posts

    @classmethod
    def get_one_recipe(cls, data):
        query = """SELECT * FROM recipes WHERE id = %(id)s;"""
        results = connectToMySQL(cls.DB).query_db(query, data)
        # return cls(results[0])
        return cls(results[0])

#SEE IF YOU FINISHED WORKING ON SHOW ONE RECIPE>> CODE BELOW ALSO CHECK ROUTE
    @classmethod
    def get_one_recipe_with_user(cls,data):
        query='''
            SELECT * FROM recipes
            JOIN users
            ON recipes.user_id = users.id
            WHERE recipes.id= %(id)s;

        '''
        results= connectToMySQL(cls.DB).query_db(query,data)
        # one_recipe = cls(results[0])
        for row in results:
            one_recipe = cls(row)
            user_data={
                    'id': row['users.id'],
                    'first_name': row['first_name'],
                    'last_name': row['last_name'],
                    'email': row['email'],
                    'password': ' ',
                    'created_at': row['users.created_at'],
                    'updated_at': row['users.updated_at']
                }
            one_recipe.creator= user_model.Users(user_data)
        return one_recipe

    @classmethod
    def update_recipe(cls,data):

        #had to add recipes.recipes because I named my workbench schema the same exact name (used for recipes)
        query = """
                UPDATE recipes.recipes
                SET 
                name = %(name)s,
                description = %(description)s, 
                instructions = %(instructions)s, 
                under_time = %(under_time)s, 
                created_at = %(created_at)s
                WHERE id = %(id)s;
        """
                #Semicolon not neeed, only best practice
        result = connectToMySQL(cls.DB).query_db(query,data)
        return result

    @classmethod
    def delete_recipe(cls, data):
            query= '''
                DELETE FROM recipes
                WHERE recipes.id=%(id)s;
            '''
            return connectToMySQL(cls.DB).query_db(query, data)


    @staticmethod
    def validate_recipe(form_data):
            is_valid = True
            
            if len(form_data["name"]) < 1:
                flash("Post content must not be blank.")
                is_valid = False
            if len(form_data["description"]) < 1:
                flash("Post content must not be blank.")
                is_valid = False
            if len(form_data["instructions"]) < 1:
                flash("Post content must not be blank.")
                is_valid = False
            if 'under_time' not in form_data:
                flash("under 30 must not be blank.")
                is_valid = False
                
            if form_data['created_at']  == '':
                flash("date must not be blank.")
                is_valid = False
            

            
            return is_valid



#     #validating my post to make sure the textbox is not empty
#     @staticmethod
#     def validate_post(form_data):
#             is_valid = True
            
#             if len(form_data["content"]) < 1:
#                 flash("Post content must not be blank.")
#                 is_valid = False
            
#             return is_valid
#     #this is another way to get my flash message to display.
#     # @staticmethod
#     # def validate_post(form_data):
#     #         is_valid = True
            
#     #         if len(form_data["content"]) == 0:
#     #             flash("Post cannot be empty.")
#     #             is_valid = False
            
#     #         return is_valid
