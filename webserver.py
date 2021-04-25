  
from flask import Flask, request, redirect, flash
from flask import render_template
import mysql.connector
import pathlib


app = Flask(__name__)
mydb = mysql.connector.connect(
   host="localhost",
   user="root",
   password="",
   database="helpfulresources"
)


mycursor = mydb.cursor()
UPLOAD_FOLDER = '/UPLOAD_FOLDER'
app.config['UPLOAD_FOLDER'] = 'UPLOAD_FOLDER'
app.config['MAX_CONTENT_PATH'] = '100000000000000'

ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}




app.config['SECRET_KEY'] = "SECRET_KEY"

STAV_KEY = '123'




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
   return render_template("article.html", myresult=myresult)

@app.route('/input', methods=['GET', 'POST'])
def inputs():
    if request.method=='POST':
        Subjects = request.form['Subjects']
        Resource2 = request.form['Resource_2']
        Videolink = request.form['Video_Link']
        sql = "INSERT INTO links (Subjects, Resource_2, Video_Link) VALUES (%s, %s, %s)"
        val = (Subjects, Resource2, Videolink)
        mycursor.execute(sql, val)
        f = request.files['file']
        f.save(f.filename)
        return 'file uploaded successfully'
        mydb.commit()
        return redirect("/tiles")
    return render_template('input.html')

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
		
if __name__ == '__main__':
   app.run(debug = True)



