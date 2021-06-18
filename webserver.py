  
from flask import Flask, request, redirect, flash
from flask import render_template
import mysql.connector
import pathlib
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user


app = Flask(__name__)
mydb = mysql.connector.connect(
   host="localhost",
   user="root",
   password="",
   database="helpfulresources"
)

def mysql_obj():
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="helperdb"
    )
    return mydb


mycursor = mydb.cursor()
UPLOAD_FOLDER = '/UPLOAD_FOLDER'
app.config['UPLOAD_FOLDER'] = 'UPLOAD_FOLDER'
app.config['MAX_CONTENT_PATH'] = '100000000000000'

ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}




app.config['SECRET_KEY'] = "SECRET_KEY"

STAV_KEY = '123'
CREATE_KEY = '456'

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = '/login'

class User(UserMixin):
    def __init__(self, id, us_type, active=True):
        self.id = id
        self.us_type = us_type
        self.active = active
    
    def is_active(self):
        return self.active

    def is_anonymous(self):
        return False

    def is_authenticated(self):
        return True


@login_manager.user_loader
def load_user(user_id):
    # using user_id query and get the other details
    mydb = mysql_obj()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM login where passcode='%s'" % (user_id))
    myresult = mycursor.fetchall()
    # get the id and pass to User class
    if len(myresult)>=1:
        mycursor.close()
        mydb.close()
        return User(myresult[0][0], myresult[0][1])
    else:
        mycursor.close()
        mydb.close()
        return None

@app.route('/')
def home_page():
#    return render_template("home.html")
   return render_template("styled_index.html")

@app.route("/tiles")
def  tiles_resources():
   mycursor.execute("SELECT * FROM links")
   myresult = mycursor.fetchall()
   return render_template("tiles.html", myresult=myresult)

@app.route('/tiles/<name>')
def get_product(name):
   mycursor.execute("""SELECT * FROM links where PK=%s""" % (int(name)))
   myresult = mycursor.fetchall()
   return render_template("styled_article.html", myresult=myresult[0])

@app.route('/input', methods=['GET', 'POST'])
def inputs():
    if request.method=='POST':
        Subjects = request.form['Subjects']
        Resource2 = request.form['Resource_2']
        Videolink = request.form['Video_Link']
        sql = "INSERT INTO links (Subjects, Resource_2, youtubelink) VALUES (%s, %s, %s)"
        val = (Subjects, Resource2, Videolink)
        mycursor.execute(sql, val)
        f = request.files['file']
        f.save(f.filename)
        mydb.commit()
        return redirect("/tiles")
    return render_template('styled_createarticle.html')

@app.route('/auth_page', methods=['GET', 'POST'])
def auth_page():
    error = None
    if request.method == "POST" : 
            key = request.form['key']

            if key == STAV_KEY :
                # who = 'stavin'
                mycursor.execute("SELECT * FROM Prayers")
                myresult = mycursor.fetchall()
                return render_template('prayer_show.html', myresult=myresult)
        
            else:
                flash('Incorrect password')

    return render_template('auth.html')

@app.route('/create_auth', methods=['GET', 'POST'])
def create_auth():
    error = None
    if request.method == "POST" : 
            key = request.form['key']

            if key == CREATE_KEY :
                # who = 'stavin'
                return redirect("/prayer_input")
        
            else:
                flash('Incorrect password')

    return render_template('create_auth.html')


@app.route('/prayer_input', methods=['GET', 'POST'])
def prayer_inputs():
    if request.method=='POST':
        point = request.form['point']
        tag = request.form['tag']
        sql = "INSERT INTO Prayers (point, tag) VALUES (%s, %s)"
        val = (point, tag)
        mycursor.execute(sql, val)
        mydb.commit()
        return redirect("/auth_page")
    return render_template('prayer_input.html')

@app.route("/textbox")
def textbox():
    return render_template('textbox.html')

@app.route("/textbox_data", methods=['POST'])
def textbox_data():
    ta_data = request.form['mytextarea']
    print(ta_data)
    return 'got the data'

@app.route("/login")
def login():
    return render_template("login.html")

@app.route("/login_action", methods=['POST'])
def login_action():
    #validate passcode
    mydb = mysql_obj()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM login where passcode='%s'" % (request.form['passcode']))
    myresult = mycursor.fetchall()
    # get the id and pass to User class
    if len(myresult)>=1:
        mycursor.close()
        mydb.close()
        user = User(myresult[0][0], myresult[0][1])
        login_user(user)
        return redirect("/")
    else:
        mycursor.close()
        mydb.close()
        return "invalide passcode"

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return "user logged out"

    
if __name__ == '__main__':
   app.run(debug = True)



