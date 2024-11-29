from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

def create_connection():
    connection = mysql.connector.connect(
        host='localhost',
        port=3306,
        user='root',
        password='tiger',
        database='blob_db'
    )
    return connection

#search = "DIM_ACCOUNT"

#connection = create_connection()
#cursor = connection.cursor()
#cursor.execute("SELECT * FROM blob_db.blob_metadata_properties where blob_name like'{}'".format(search))
#blob_details = cursor.fetchall()
#cursor.close()
#connection.close()
#print(blob_details)
#print(type(blob_details))

@app.route('/')
def index():

    return render_template('home.html')

@app.route('/home.html')
def home():

    return render_template('home.html')

@app.route('/about.html')
def about():

    return render_template('about.html')

@app.route('/assist.html')
def assist():

    return render_template('assist.html')



@app.route('/tech_assist.html', methods=['GET', 'POST'])
def tech_assist():
    
    result=request.form
        #DIM_ACCOUNT = result['DIM_ACCOUNT']
        #print(DIM_ACCOUNT)
    connection = create_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT CONTAINER_NAME,COUNT(DISTINCT FOLDER_NAME),COUNT(TABLE_NAME),SUM(BLOB_SIZE) FROM blob_db.blob_metadata_properties GROUP BY CONTAINER_NAME")
    searchDetails = cursor.fetchall()
    print(searchDetails)
    connection.commit()
    cursor.close()
    
        
    return render_template('tech_assist.html', searchDetails = searchDetails)





@app.route('/biz_assist.html', methods=['GET', 'POST'])
def biz_assist():
    if request.method == 'POST' :
        result=request.form
        DIM_ACCOUNT = result['DIM_ACCOUNT']
        connection = create_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM blob_db.blob_metadata_properties where blob_name like'{}'".format(DIM_ACCOUNT))
        searchDetails = cursor.fetchall()
        connection.commit()
        cursor.close()
    
        
        return render_template('biz_assist.html', searchDetails = searchDetails)


    return render_template('biz_assist.html')




@app.route('/kpif_assist.html', methods=['GET', 'POST'])
def kpif_assist():
    if request.method == 'POST' :
        result=request.form
        DIM_ACCOUNT = result['DIM_ACCOUNT']
        connection = create_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM blob_db.kpif_assist_table where KPI_NAME like'{}'".format(DIM_ACCOUNT))
        searchDetails = cursor.fetchall()
        connection.commit()
        cursor.close()
    
        
        return render_template('kpif_assist.html', searchDetails = searchDetails)


    return render_template('kpif_assist.html')



if __name__=='__main__':
    app.debug=True
    app.run(host = '0.0.0.0', port = 5010)