from flask import Flask, render_template, request, redirect
from db_config import get_connection

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/add_patient', methods=['GET', 'POST'])
def add_patient():
    if request.method == 'POST':
        name = request.form['name']
        age = request.form['age']
        gender = request.form['gender']
        contact = request.form['contact']
        address = request.form['address']

        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Patients (name, age, gender, contact, address) VALUES (%s, %s, %s, %s, %s)",
                       (name, age, gender, contact, address))
        conn.commit()
        cursor.close()
        conn.close()
        return redirect('/')
    return render_template('add_patient.html')

@app.route('/view_patients')
def view_patients():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Patients")
    patients = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('view_patients.html', patients=patients)

@app.route('/add_doctor', methods=['GET', 'POST'])
def add_doctor():
    if request.method == 'POST':
        name = request.form['name']
        specialty = request.form['specialty']
        contact = request.form['contact']

        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Doctors (name, specialty, contact) VALUES (%s, %s, %s)",
                       (name, specialty, contact))
        conn.commit()
        cursor.close()
        conn.close()
        return redirect('/')
    return render_template('add_doctor.html')

@app.route('/view_doctors')
def view_doctors():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Doctors")
    doctors = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('view_doctors.html', doctors=doctors)


# ✅ This must come last!
if __name__ == '__main__':
    app.run(debug=True)
