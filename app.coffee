express = require 'express'
routes = require './server/routes'
meet = require './server/routes/meet'
http = require 'http'
path = require 'path'
webappPath = path.join(__dirname, 'webapp')

app = express()

# all environments
app.set 'port', process.env.PORT || 3000
app.set 'views', webappPath + '/views'
app.use express.favicon()
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static webappPath

# development only
if 'development' == app.get('env')
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/meet', meet.list

http.createServer(app).listen app.get('port'),
  () -> console.log 'Express server listening on port ' + app.get('port')