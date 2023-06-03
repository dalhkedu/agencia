# import json

# from faker import Faker
from flask import Flask

# fake = Faker('pt_BR')

app = Flask(__name__)


@app.route("/")
def hello():
    return "ola mundo"


# @app.route("/cpf")
# def hello1():
#     return json.dumps({
#         'numero': fake.cpf()
#     })


# @app.route("/cnpj")
# def hello2():
#     return json.dumps({
#         'numero': fake.cnpj()
#     })


if __name__ == '__main__':
    app.run(host="0.0.0.0")
