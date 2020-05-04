from flask import Flask, render_template, request , session , redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail,Message
import math
local_server = True
with open('config.json', 'r') as c:
    params = json.load(c)["params"]


app = Flask(__name__)
app.secret_key = 'secretkey'
if (local_server) :
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else :
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)
mail = Mail(app)

db = SQLAlchemy(app)

@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['number_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['number_of_posts']):(page-1)*int(params['number_of_posts'])+int(params['number_of_posts'])]

    if (page == 1) :
        prev = '#'
        next = "/?page="+str(page+1)
    elif(page == last):
        prev = "/?page="+str(page-1)
        next='#'
    else:
        prev = "/?page="+str(page-1)
        next = "/?page="+str(page+1)



    return render_template("index.html",params = params,posts = posts,prev = prev, next = next)


@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method ==  'POST'):

        """ establish connection with database """
        name=request.form.get('name')
        email=request.form.get('email')
        phone_num=request.form.get('phone')
        msg=request.form.get('msg')
        if (not name or not email or not phone_num or not msg):

            fail_msg='please fill out all the details in the form'
            return render_template('/fail.html', fail_msg = fail_msg , params = params)
        entry = Contacts(name=name, phone = phone_num, msg = msg, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        msg=Message('new message from '+ name,sender=email,recipients = [params['gmail-user']],body=msg+'\n'+phone_num)
        mail.send(msg)
    return render_template("contact.html",params=params)
    #if(request.method=='POST'):
    #     '''Add entry to the database'''
    #     name = request.form.get('name')
    #     email = request.form.get('email')
    #     phone = request.form.get('phone')
    #     message = request.form.get('msg')
    #     entry = Contacts(name=name, phone = phone, msg = message, date= datetime.now(),email = email )
    #     db.session.add(entry)
    #     db.session.commit()
    # return render_template('contact.html')


@app.route("/about")
def about():

        return render_template("about.html",params=params)


@app.route("/post/<post_slug>" , methods=['GET' , 'POST'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    # if request.method == 'POST':
    #     likes = request.form.get('likebutton')
    #     likebutton = Posts(likes = likes)
    #     db.session.add(likebutton)
    #     db.session.commit()







    return render_template("post.html",params=params,post = post)

@app.route("/dashboard" , methods = ['GET' , 'POST'])

def adminlogin():
    if ('user' in session and session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params = params ,posts = posts )
    if request.method == 'POST':
        username = request.form.get('uname')
        password = request.form.get('pass')
        if (username == params['admin_user'] and password == params['admin_pass']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params = params ,posts = posts  )
        else:
            return render_template('login.html', params = params)


    else:
        return render_template('login.html', params = params)





@app.route("/edit/<sno>" , methods=['GET','POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            title_box = request.form.get('title')
            tagline = request.form.get('tagline')
            contents = request.form.get('contents')
            slug = request.form.get('slug')
            img_file=request.form.get('img_file')
            date = datetime.now()
            if sno == '0':
                post = Posts(title = title_box , tagline = tagline , contents = contents , slug = slug ,img_file=img_file, date = date)
                db.session.add(post)
                db.session.commit()

            else :
                post = Posts.query.filter_by(sno = sno).first()
                post.title = title_box
                post.tagline = tagline
                post.contents = contents
                post.slug = slug
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+sno)



        post = Posts.query.filter_by(sno = sno).first()
        return render_template('edit.html' , params=params , post = post , sno = sno)

# response.headers.add('Cache-Control', 'no-store, no-cache, must-revalidate, post-check=0, pre-check=0')

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<sno>" , methods=['GET','POST'])
def delete(sno):
    post = Posts.query.filter_by(sno = sno).first()
    db.session.delete(post)
    db.session.commit()
    return redirect('/dashboard')





class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100),  nullable=False)
    contents = db.Column(db.String(500), unique=True, nullable=False)
    tagline = db.Column(db.String(500), unique=True, nullable=False)
    slug = db.Column(db.String(15), unique=True, nullable=False)
    img_file = db.Column(db.String(20), nullable=True )
    date = db.Column(db.String(12), nullable=True )
    likes = db.Column(db.Integer, nullable=True)



class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100),  nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    phone = db.Column(db.String(15), unique=True, nullable=False)
    msg = db.Column(db.String(100),  nullable=False)
    date = db.Column(db.String(12), nullable=True )





if  __name__ == "__main__":
    app.run(debug = True)
