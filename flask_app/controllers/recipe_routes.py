from flask_app import app
from flask import render_template, redirect, request, session
from flask_app.models import recipe_model, user_model


@app.route('/new_recipe')
def new_recipe():
    if 'user_id' not in session: 
        return redirect('/')
    id_data={
        'id': session['user_id']
    }
    one_user= user_model.Users.get_one(id_data)

    return render_template("create_recipe.html", user=one_user )

@app.route('/create_recipe', methods=['POST'])
def create_recipe():
    if 'user_id' not in session: 
        return redirect('/')
    #Add a validate recipe on the line below before request form
    if not recipe_model.Recipes.validate_recipe(request.form):
        return redirect('/new_recipe')
    # dictionary below is not needed because I am using request.form. I am calling on the user ID with the info I am passing before, in this case being user from =one_user. I can also use {{session['user_id']}}
    # recipe_data={
    #     # 'id': session['id'],
    #     'user_id': session['user_id'],
    #     'name': request.form['name'],
    #     'description':request.form['description'],
    #     'instructions':request.form['instructions'],
    #     'created_at':request.form['created_at'],
    #     'under_time':request.form['under_time']
    # }
    recipe_model.Recipes.save_recipe(request.form)
    
    id_data={
        'id': session['user_id']
    }
    one_user= user_model.Users.get_one(id_data)
    return redirect(f'/user/account/{one_user.id}')

@app.route('/edit/recipe/<int:id>')
def edit_form(id):
    if 'user_id' not in session: 
        return redirect('/')
    id_data={
        'id': id
    }
    one_recipe= recipe_model.Recipes.get_one_recipe_with_user(id_data)

    data={
        'id': session['user_id']
    }
    one_user= user_model.Users.get_one(data)
    return render_template('edit_recipe.html', one_recipe=one_recipe, user=one_user)

@app.route('/update/recipe/<int:id>', methods=['POST'])
def update_recipe(id):


    if 'user_id' not in session: 
        return redirect('/logout')
    if not recipe_model.Recipes.validate_recipe(request.form):
        recipe_id = request.form['id'] 
        return redirect(f'/edit/recipe/{recipe_id}')
    #the data below is not needed. The info from request.form is already in a dictionary
    # data={
    #     'id': id,
    #     'name': request.form['name'],
    #     'description':request.form['description'],
    #     'instructions':request.form['instructions'],
    #     'created_at':request.form['created_at'],
    #     'under_time':request.form['under_time']

    # }
    # one_recipe= recipe_model.Recipes.get_one_recipe_with_user(data)

    recipe_model.Recipes.update_recipe(request.form)
    user= session['user_id']

    return redirect(f'/user/account/{user}')


@app.route('/recipe/delete/<int:id>')
def delete_recipe(id):
    if 'user_id' not in session:
        return redirect('/logout')
    id_data={
        'id': id
    }
    recipe_model.Recipes.delete_recipe(id_data)
    user= session['user_id']
    return redirect(f'/user/account/{user}')

@app.route('/show_recipe/<int:id>')
def show_recipe(id):
    if 'user_id' not in session: 
        return redirect('/')
    data={
        'id': id
    }
    one_recipe= recipe_model.Recipes.get_one_recipe_with_user(data)
    user_data={
        'id': session['user_id']
    }
    one_user= user_model.Users.get_one(user_data)
    return render_template('read_one.html', recipe=one_recipe, listed_user=one_user)





