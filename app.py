from flask import Flask, render_template, request, redirect
import mysql.connector

app = Flask(__name__)

# Conexão com o MySQL
db = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="Clovis123",
    database="gestao_eventos"
)

# Página inicial (home)
@app.route('/')
def home():
    return render_template('home.html')

# Página de cadastro de evento
@app.route('/cadastro_evento', methods=['GET', 'POST'])
def cadastro_evento():
    if request.method == 'POST':
        nome = request.form['nome']
        data = request.form['data']
        local = request.form['local']
        cursor = db.cursor()
        cursor.execute("INSERT INTO eventos (nome, data, local) VALUES (%s, %s, %s)", (nome, data, local))
        db.commit()
        return redirect('/cadastro_evento')
    return render_template('cadastro_evento.html')

# Página para listar e atualizar eventos
@app.route('/atualizar_evento', methods=['GET', 'POST'])
def atualizar_evento():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM eventos")
    eventos = cursor.fetchall()
    
    if request.method == 'POST':
        id = request.form['id']
        nome = request.form['nome']
        data = request.form['data']
        local = request.form['local']
        cursor.execute("UPDATE eventos SET nome=%s, data=%s, local=%s WHERE id=%s", (nome, data, local, id))
        db.commit()
        return redirect('/atualizar_evento')
    
    return render_template('atualizar_evento.html', eventos=eventos)

if __name__ == '__main__':
    app.run(debug=True)
