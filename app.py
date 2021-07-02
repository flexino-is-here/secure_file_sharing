from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/api', methods=['GET'])
def hello_world():
    d={ }
    d['Query']=str(request.args['Query']+'qqqqqqqqqqqqqqq')
    return jsonify(d)


# the program is written in linux enviroment
# all the paths are written assuming python program and source file are at same place
# the program is tested for text file
# provide correct path wherever necessary
# the files were all at desktop in linux enviroment



if __name__ == '__main__':
    app.run()

